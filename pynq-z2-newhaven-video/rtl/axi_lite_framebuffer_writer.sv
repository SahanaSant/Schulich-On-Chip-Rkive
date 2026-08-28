module axi_lite_framebuffer_writer #(
    parameter int AXI_ADDR_WIDTH = 18,
    parameter int FB_ADDR_WIDTH  = 17,
    parameter int PIXEL_COUNT    = 76800
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

    output logic                      fb_wr_clk,
    output logic                      fb_wr_en,
    output logic [FB_ADDR_WIDTH-1:0]  fb_wr_addr,
    output logic [15:0]               fb_wr_data
);

    timeunit 1ns;
    timeprecision 1ps;

    localparam logic [1:0] AXI_RESP_OKAY   = 2'b00;
    localparam logic [1:0] AXI_RESP_SLVERR = 2'b10;

    logic aw_pending;
    logic [AXI_ADDR_WIDTH-1:0] awaddr_q;
    logic w_pending;
    logic [31:0] wdata_q;
    logic [3:0] wstrb_q;

    logic second_write_pending;
    logic [FB_ADDR_WIDTH-1:0] second_write_addr;
    logic [15:0] second_write_data;

    wire [AXI_ADDR_WIDTH-2:0] requested_pixel =
        awaddr_q[AXI_ADDR_WIDTH-1:1];

    assign fb_wr_clk = s_axi_aclk;

    // AXI address and data channels are independent, so each is buffered until
    // both halves of a write request have arrived.
    always_comb begin
        s_axi_awready = !aw_pending && !s_axi_bvalid &&
                        !second_write_pending;
        s_axi_wready = !w_pending && !s_axi_bvalid &&
                       !second_write_pending;
    end

    // The supplied framebuffer has no processor-side read port. Reads still
    // receive a legal AXI response, but are reported as unsupported.
    always_comb begin
        s_axi_arready = !s_axi_rvalid;
        s_axi_rdata = 32'd0;
    end

    always_ff @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            aw_pending <= 1'b0;
            awaddr_q <= '0;
            w_pending <= 1'b0;
            wdata_q <= '0;
            wstrb_q <= '0;

            s_axi_bresp <= AXI_RESP_OKAY;
            s_axi_bvalid <= 1'b0;

            s_axi_rresp <= AXI_RESP_SLVERR;
            s_axi_rvalid <= 1'b0;

            fb_wr_en <= 1'b0;
            fb_wr_addr <= '0;
            fb_wr_data <= '0;

            second_write_pending <= 1'b0;
            second_write_addr <= '0;
            second_write_data <= '0;
        end else begin
            fb_wr_en <= 1'b0;

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

            if (second_write_pending) begin
                fb_wr_en <= 1'b1;
                fb_wr_addr <= second_write_addr;
                fb_wr_data <= second_write_data;
                second_write_pending <= 1'b0;
                s_axi_bresp <= AXI_RESP_OKAY;
                s_axi_bvalid <= 1'b1;
            end else if (aw_pending && w_pending && !s_axi_bvalid) begin
                aw_pending <= 1'b0;
                w_pending <= 1'b0;

                if (awaddr_q[0]) begin
                    s_axi_bresp <= AXI_RESP_SLVERR;
                    s_axi_bvalid <= 1'b1;
                end else if ((wstrb_q == 4'b0011) &&
                             (awaddr_q[1:0] == 2'b00) &&
                             (requested_pixel < PIXEL_COUNT)) begin
                    fb_wr_en <= 1'b1;
                    fb_wr_addr <= requested_pixel[FB_ADDR_WIDTH-1:0];
                    fb_wr_data <= wdata_q[15:0];
                    s_axi_bresp <= AXI_RESP_OKAY;
                    s_axi_bvalid <= 1'b1;
                end else if ((wstrb_q == 4'b1100) &&
                             (awaddr_q[1:0] == 2'b10) &&
                             (requested_pixel < PIXEL_COUNT)) begin
                    fb_wr_en <= 1'b1;
                    fb_wr_addr <= requested_pixel[FB_ADDR_WIDTH-1:0];
                    fb_wr_data <= wdata_q[31:16];
                    s_axi_bresp <= AXI_RESP_OKAY;
                    s_axi_bvalid <= 1'b1;
                end else if ((wstrb_q == 4'b1111) &&
                             (awaddr_q[1:0] == 2'b00) &&
                             ((requested_pixel + 1'b1) < PIXEL_COUNT)) begin
                    // One 32-bit store contains two adjacent RGB565 pixels.
                    fb_wr_en <= 1'b1;
                    fb_wr_addr <= requested_pixel[FB_ADDR_WIDTH-1:0];
                    fb_wr_data <= wdata_q[15:0];

                    second_write_pending <= 1'b1;
                    second_write_addr <=
                        requested_pixel[FB_ADDR_WIDTH-1:0] + 1'b1;
                    second_write_data <= wdata_q[31:16];
                end else begin
                    s_axi_bresp <= AXI_RESP_SLVERR;
                    s_axi_bvalid <= 1'b1;
                end
            end

            if (s_axi_rvalid && s_axi_rready) begin
                s_axi_rvalid <= 1'b0;
            end
            if (s_axi_arvalid && s_axi_arready) begin
                s_axi_rresp <= AXI_RESP_SLVERR;
                s_axi_rvalid <= 1'b1;
            end
        end
    end

    // ARADDR is intentionally unused because every processor-side read is
    // unsupported with the current write-only framebuffer port.
    wire unused_araddr = &{1'b0, s_axi_araddr, s_axi_awprot, s_axi_arprot};

endmodule
