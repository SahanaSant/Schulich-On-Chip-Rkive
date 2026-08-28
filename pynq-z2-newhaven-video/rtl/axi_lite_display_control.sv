module axi_lite_display_control #(
    parameter int AXI_ADDR_WIDTH = 6
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

    input  logic                      display_init_done,
    input  logic                      display_frame_busy,
    input  logic                      display_frame_done,
    output logic                      display_frame_start
);

    timeunit 1ns;
    timeprecision 1ps;

    localparam logic [1:0] AXI_OKAY = 2'b00;
    localparam logic [1:0] AXI_SLVERR = 2'b10;
    localparam logic [5:0] REG_CONTROL = 6'h00;
    localparam logic [5:0] REG_STATUS = 6'h04;

    logic aw_pending;
    logic [AXI_ADDR_WIDTH-1:0] awaddr_q;
    logic w_pending;
    logic [31:0] wdata_q;
    logic [3:0] wstrb_q;
    logic done_sticky;
    logic error_sticky;

    assign s_axi_awready = !aw_pending && !s_axi_bvalid;
    assign s_axi_wready = !w_pending && !s_axi_bvalid;
    assign s_axi_arready = !s_axi_rvalid;

    always_ff @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            aw_pending <= 1'b0;
            awaddr_q <= '0;
            w_pending <= 1'b0;
            wdata_q <= 32'd0;
            wstrb_q <= 4'd0;
            s_axi_bresp <= AXI_OKAY;
            s_axi_bvalid <= 1'b0;
            s_axi_rdata <= 32'd0;
            s_axi_rresp <= AXI_OKAY;
            s_axi_rvalid <= 1'b0;
            done_sticky <= 1'b0;
            error_sticky <= 1'b0;
            display_frame_start <= 1'b0;
        end else begin
            display_frame_start <= 1'b0;

            if (display_frame_done) begin
                done_sticky <= 1'b1;
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
                s_axi_bresp <= AXI_OKAY;
                s_axi_bvalid <= 1'b1;

                if ((awaddr_q[1:0] != 2'b00) ||
                    (awaddr_q[5:0] != REG_CONTROL) || !wstrb_q[0]) begin
                    s_axi_bresp <= AXI_SLVERR;
                end else begin
                    if (wdata_q[1]) begin
                        done_sticky <= 1'b0;
                        error_sticky <= 1'b0;
                    end
                    if (wdata_q[0]) begin
                        if (!display_init_done || display_frame_busy) begin
                            error_sticky <= 1'b1;
                            s_axi_bresp <= AXI_SLVERR;
                        end else begin
                            done_sticky <= 1'b0;
                            display_frame_start <= 1'b1;
                        end
                    end
                end
            end

            if (s_axi_rvalid && s_axi_rready) begin
                s_axi_rvalid <= 1'b0;
            end
            if (s_axi_arvalid && s_axi_arready) begin
                s_axi_rdata <= 32'd0;
                s_axi_rresp <= AXI_OKAY;
                s_axi_rvalid <= 1'b1;
                if (s_axi_araddr[1:0] != 2'b00) begin
                    s_axi_rresp <= AXI_SLVERR;
                end else begin
                    case (s_axi_araddr[5:0])
                        REG_CONTROL: s_axi_rdata <= 32'd0;
                        REG_STATUS: s_axi_rdata <= {
                            28'd0,
                            error_sticky,
                            display_init_done,
                            done_sticky,
                            display_frame_busy
                        };
                        default: s_axi_rresp <= AXI_SLVERR;
                    endcase
                end
            end
        end
    end

    wire unused_prot = &{1'b0, s_axi_awprot, s_axi_arprot};

endmodule
