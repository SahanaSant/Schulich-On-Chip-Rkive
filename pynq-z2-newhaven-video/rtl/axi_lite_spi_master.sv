module axi_lite_spi_master #(
    parameter int AXI_ADDR_WIDTH = 6,
    parameter int DIV_WIDTH = 16,
    parameter int RESET_CLK_DIV = 200
) (
    input  logic                      s_axi_aclk,
    input  logic                      s_axi_aresetn,

    input  logic [AXI_ADDR_WIDTH-1:0] s_axi_awaddr,
    input  logic [2:0]                s_axi_awprot,
    input  logic                      s_axi_awvalid,
    output logic                      s_axi_awready,

    input  logic [31:0]               s_axi_wdata,
    input  logic [3:0]                s_axi_wstrb,
    input  logic                      s_axi_wvalid,
    output logic                      s_axi_wready,

    output logic [1:0]                s_axi_bresp,
    output logic                      s_axi_bvalid,
    input  logic                      s_axi_bready,

    input  logic [AXI_ADDR_WIDTH-1:0] s_axi_araddr,
    input  logic [2:0]                s_axi_arprot,
    input  logic                      s_axi_arvalid,
    output logic                      s_axi_arready,

    output logic [31:0]               s_axi_rdata,
    output logic [1:0]                s_axi_rresp,
    output logic                      s_axi_rvalid,
    input  logic                      s_axi_rready,

    output logic                      spi_cs_n,
    output logic                      spi_sclk,
    output logic                      spi_mosi,
    input  logic                      spi_miso
);

    timeunit 1ns;
    timeprecision 1ps;

    localparam logic [1:0] AXI_RESP_OKAY   = 2'b00;
    localparam logic [1:0] AXI_RESP_SLVERR = 2'b10;

    localparam logic [5:0] REG_CONTROL = 6'h00;
    localparam logic [5:0] REG_STATUS  = 6'h04;
    localparam logic [5:0] REG_CLK_DIV = 6'h08;
    localparam logic [5:0] REG_TX_DATA = 6'h0C;
    localparam logic [5:0] REG_RX_DATA = 6'h10;

    logic aw_pending;
    logic [AXI_ADDR_WIDTH-1:0] awaddr_q;
    logic w_pending;
    logic [31:0] wdata_q;
    logic [3:0] wstrb_q;

    logic cs_assert;
    logic [DIV_WIDTH-1:0] clk_divider;
    logic [7:0] tx_data;
    logic [7:0] rx_data;
    logic engine_start;
    logic engine_busy;
    logic engine_done;
    logic done_sticky;
    logic rx_valid;

    assign spi_cs_n = !cs_assert;

    always_comb begin
        s_axi_awready = !aw_pending && !s_axi_bvalid;
        s_axi_wready = !w_pending && !s_axi_bvalid;
        s_axi_arready = !s_axi_rvalid;
    end

    spi_byte_master #(
        .DIV_WIDTH(DIV_WIDTH)
    ) byte_engine_i (
        .clk(s_axi_aclk),
        .resetn(s_axi_aresetn),
        .start(engine_start),
        .tx_data(tx_data),
        .clk_divider(clk_divider),
        .rx_data(rx_data),
        .busy(engine_busy),
        .done(engine_done),
        .spi_sclk(spi_sclk),
        .spi_mosi(spi_mosi),
        .spi_miso(spi_miso)
    );

    always_ff @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            aw_pending <= 1'b0;
            awaddr_q <= '0;
            w_pending <= 1'b0;
            wdata_q <= '0;
            wstrb_q <= '0;

            s_axi_bresp <= AXI_RESP_OKAY;
            s_axi_bvalid <= 1'b0;
            s_axi_rdata <= 32'd0;
            s_axi_rresp <= AXI_RESP_OKAY;
            s_axi_rvalid <= 1'b0;

            cs_assert <= 1'b0;
            clk_divider <= RESET_CLK_DIV[DIV_WIDTH-1:0];
            tx_data <= 8'hFF;
            engine_start <= 1'b0;
            done_sticky <= 1'b0;
            rx_valid <= 1'b0;
        end else begin
            engine_start <= 1'b0;

            if (engine_done) begin
                done_sticky <= 1'b1;
                rx_valid <= 1'b1;
            end

            if (s_axi_awvalid && s_axi_awready) begin
                aw_pending <= 1'b1;
                awaddr_q <= s_axi_awaddr;
            end
            if (s_axi_wvalid && s_axi_wready) begin
                w_pending <= 1'b1;
                wdata_q <= s_axi_wdata;
                wstrb_q <= s_axi_wstrb;
            end

            if (s_axi_bvalid && s_axi_bready) begin
                s_axi_bvalid <= 1'b0;
            end

            if (aw_pending && w_pending && !s_axi_bvalid) begin
                aw_pending <= 1'b0;
                w_pending <= 1'b0;
                s_axi_bresp <= AXI_RESP_OKAY;
                s_axi_bvalid <= 1'b1;

                if (awaddr_q[1:0] != 2'b00) begin
                    s_axi_bresp <= AXI_RESP_SLVERR;
                end else begin
                    case (awaddr_q[5:0])
                        REG_CONTROL: begin
                            if (!wstrb_q[0]) begin
                                s_axi_bresp <= AXI_RESP_SLVERR;
                            end else begin
                                cs_assert <= wdata_q[1];
                                if (wdata_q[0]) begin
                                    if (engine_busy) begin
                                        s_axi_bresp <= AXI_RESP_SLVERR;
                                    end else begin
                                        engine_start <= 1'b1;
                                        done_sticky <= 1'b0;
                                        rx_valid <= 1'b0;
                                    end
                                end
                            end
                        end

                        REG_CLK_DIV: begin
                            if ((wstrb_q[1:0] != 2'b11) ||
                                (wdata_q[DIV_WIDTH-1:0] == '0)) begin
                                s_axi_bresp <= AXI_RESP_SLVERR;
                            end else begin
                                clk_divider <= wdata_q[DIV_WIDTH-1:0];
                            end
                        end

                        REG_TX_DATA: begin
                            if (!wstrb_q[0]) begin
                                s_axi_bresp <= AXI_RESP_SLVERR;
                            end else begin
                                tx_data <= wdata_q[7:0];
                            end
                        end

                        default: begin
                            s_axi_bresp <= AXI_RESP_SLVERR;
                        end
                    endcase
                end
            end

            if (s_axi_rvalid && s_axi_rready) begin
                s_axi_rvalid <= 1'b0;
            end

            if (s_axi_arvalid && s_axi_arready) begin
                s_axi_rdata <= 32'd0;
                s_axi_rresp <= AXI_RESP_OKAY;
                s_axi_rvalid <= 1'b1;

                if (s_axi_araddr[1:0] != 2'b00) begin
                    s_axi_rresp <= AXI_RESP_SLVERR;
                end else begin
                    case (s_axi_araddr[5:0])
                        REG_CONTROL: begin
                            s_axi_rdata <= {30'd0, cs_assert, 1'b0};
                        end
                        REG_STATUS: begin
                            s_axi_rdata <= {
                                29'd0,
                                rx_valid,
                                done_sticky,
                                engine_busy
                            };
                        end
                        REG_CLK_DIV: begin
                            s_axi_rdata <= {{(32-DIV_WIDTH){1'b0}}, clk_divider};
                        end
                        REG_TX_DATA: begin
                            s_axi_rdata <= {24'd0, tx_data};
                        end
                        REG_RX_DATA: begin
                            s_axi_rdata <= {24'd0, rx_data};
                        end
                        default: begin
                            s_axi_rresp <= AXI_RESP_SLVERR;
                        end
                    endcase
                end
            end
        end
    end

    wire unused_prot = &{1'b0, s_axi_awprot, s_axi_arprot};

endmodule
