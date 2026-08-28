module video_display_subsystem #(
    parameter int SCREEN_WIDTH = 240,
    parameter int SCREEN_HEIGHT = 320,
    parameter int FB_AXI_ADDR_WIDTH = 18,
    parameter int FB_ADDR_WIDTH = 17,
    parameter int LCD_CLK_DIVIDER = 2
) (
    input  logic                         s_axi_aclk,
    input  logic                         s_axi_aresetn,

    input  logic [FB_AXI_ADDR_WIDTH-1:0] s_fb_axi_awaddr,
    input  logic [2:0]                   s_fb_axi_awprot,
    input  logic                         s_fb_axi_awvalid,
    output logic                         s_fb_axi_awready,
    input  logic [31:0]                  s_fb_axi_wdata,
    input  logic [3:0]                   s_fb_axi_wstrb,
    input  logic                         s_fb_axi_wvalid,
    output logic                         s_fb_axi_wready,
    output logic [1:0]                   s_fb_axi_bresp,
    output logic                         s_fb_axi_bvalid,
    input  logic                         s_fb_axi_bready,
    input  logic [FB_AXI_ADDR_WIDTH-1:0] s_fb_axi_araddr,
    input  logic [2:0]                   s_fb_axi_arprot,
    input  logic                         s_fb_axi_arvalid,
    output logic                         s_fb_axi_arready,
    output logic [31:0]                  s_fb_axi_rdata,
    output logic [1:0]                   s_fb_axi_rresp,
    output logic                         s_fb_axi_rvalid,
    input  logic                         s_fb_axi_rready,

    input  logic [5:0]                   s_ctrl_axi_awaddr,
    input  logic [2:0]                   s_ctrl_axi_awprot,
    input  logic                         s_ctrl_axi_awvalid,
    output logic                         s_ctrl_axi_awready,
    input  logic [31:0]                  s_ctrl_axi_wdata,
    input  logic [3:0]                   s_ctrl_axi_wstrb,
    input  logic                         s_ctrl_axi_wvalid,
    output logic                         s_ctrl_axi_wready,
    output logic [1:0]                   s_ctrl_axi_bresp,
    output logic                         s_ctrl_axi_bvalid,
    input  logic                         s_ctrl_axi_bready,
    input  logic [5:0]                   s_ctrl_axi_araddr,
    input  logic [2:0]                   s_ctrl_axi_arprot,
    input  logic                         s_ctrl_axi_arvalid,
    output logic                         s_ctrl_axi_arready,
    output logic [31:0]                  s_ctrl_axi_rdata,
    output logic [1:0]                   s_ctrl_axi_rresp,
    output logic                         s_ctrl_axi_rvalid,
    input  logic                         s_ctrl_axi_rready,

    output logic                         lcd_cs_n,
    output logic                         lcd_scl,
    output logic                         lcd_sda,
    output logic                         lcd_reset_n
);

    localparam int PIXEL_COUNT = SCREEN_WIDTH * SCREEN_HEIGHT;

    logic fb_wr_clk;
    logic fb_wr_en;
    logic [FB_ADDR_WIDTH-1:0] fb_wr_addr;
    logic [15:0] fb_wr_data;
    logic [FB_ADDR_WIDTH-1:0] fb_rd_addr;
    logic [15:0] fb_rd_data;
    logic display_frame_start;
    logic display_frame_busy;
    logic display_frame_done;
    logic display_init_done;
    logic [7:0] lcd_tx_byte;
    logic lcd_tx_is_data;
    logic lcd_tx_start;
    logic lcd_tx_busy;
    logic lcd_tx_done;

    axi_lite_framebuffer_writer #(
        .AXI_ADDR_WIDTH(FB_AXI_ADDR_WIDTH),
        .FB_ADDR_WIDTH(FB_ADDR_WIDTH),
        .PIXEL_COUNT(PIXEL_COUNT)
    ) framebuffer_writer_i (
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_awaddr(s_fb_axi_awaddr),
        .s_axi_awprot(s_fb_axi_awprot),
        .s_axi_awvalid(s_fb_axi_awvalid),
        .s_axi_awready(s_fb_axi_awready),
        .s_axi_wdata(s_fb_axi_wdata),
        .s_axi_wstrb(s_fb_axi_wstrb),
        .s_axi_wvalid(s_fb_axi_wvalid),
        .s_axi_wready(s_fb_axi_wready),
        .s_axi_bresp(s_fb_axi_bresp),
        .s_axi_bvalid(s_fb_axi_bvalid),
        .s_axi_bready(s_fb_axi_bready),
        .s_axi_araddr(s_fb_axi_araddr),
        .s_axi_arprot(s_fb_axi_arprot),
        .s_axi_arvalid(s_fb_axi_arvalid),
        .s_axi_arready(s_fb_axi_arready),
        .s_axi_rdata(s_fb_axi_rdata),
        .s_axi_rresp(s_fb_axi_rresp),
        .s_axi_rvalid(s_fb_axi_rvalid),
        .s_axi_rready(s_fb_axi_rready),
        .fb_wr_clk(fb_wr_clk),
        .fb_wr_en(fb_wr_en),
        .fb_wr_addr(fb_wr_addr),
        .fb_wr_data(fb_wr_data)
    );

    framebuffer #(
        .ADDR_WIDTH(FB_ADDR_WIDTH),
        .DATA_WIDTH(16),
        .LOCAT_NUM(PIXEL_COUNT)
    ) framebuffer_i (
        .wr_clk(fb_wr_clk),
        .wr_en(fb_wr_en),
        .wr_addr(fb_wr_addr),
        .wr_data(fb_wr_data),
        .rd_clk(s_axi_aclk),
        .rd_addr(fb_rd_addr),
        .rd_data(fb_rd_data)
    );

    axi_lite_display_control display_control_i (
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_awaddr(s_ctrl_axi_awaddr),
        .s_axi_awprot(s_ctrl_axi_awprot),
        .s_axi_awvalid(s_ctrl_axi_awvalid),
        .s_axi_awready(s_ctrl_axi_awready),
        .s_axi_wdata(s_ctrl_axi_wdata),
        .s_axi_wstrb(s_ctrl_axi_wstrb),
        .s_axi_wvalid(s_ctrl_axi_wvalid),
        .s_axi_wready(s_ctrl_axi_wready),
        .s_axi_bresp(s_ctrl_axi_bresp),
        .s_axi_bvalid(s_ctrl_axi_bvalid),
        .s_axi_bready(s_ctrl_axi_bready),
        .s_axi_araddr(s_ctrl_axi_araddr),
        .s_axi_arprot(s_ctrl_axi_arprot),
        .s_axi_arvalid(s_ctrl_axi_arvalid),
        .s_axi_arready(s_ctrl_axi_arready),
        .s_axi_rdata(s_ctrl_axi_rdata),
        .s_axi_rresp(s_ctrl_axi_rresp),
        .s_axi_rvalid(s_ctrl_axi_rvalid),
        .s_axi_rready(s_ctrl_axi_rready),
        .display_init_done(display_init_done),
        .display_frame_busy(display_frame_busy),
        .display_frame_done(display_frame_done),
        .display_frame_start(display_frame_start)
    );

    display_controller #(
        .SCREEN_WIDTH(SCREEN_WIDTH),
        .SCREEN_HEIGHT(SCREEN_HEIGHT)
    ) display_controller_i (
        .clk(s_axi_aclk),
        .rst_n(s_axi_aresetn),
        .frame_start(display_frame_start),
        .frame_busy(display_frame_busy),
        .frame_done(display_frame_done),
        .init_done(display_init_done),
        .fb_rd_addr(fb_rd_addr),
        .fb_rd_data(fb_rd_data),
        .tx_byte(lcd_tx_byte),
        .tx_is_data(lcd_tx_is_data),
        .tx_start(lcd_tx_start),
        .tx_busy(lcd_tx_busy),
        .tx_done(lcd_tx_done),
        .lcd_reset_n(lcd_reset_n)
    );

    lcd_3wire_spi #(
        .CLK_DIVIDER(LCD_CLK_DIVIDER),
        .CS_HIGH_CYCLES(4)
    ) lcd_spi_i (
        .clk(s_axi_aclk),
        .rst_n(s_axi_aresetn),
        .start(lcd_tx_start),
        .is_data(lcd_tx_is_data),
        .tx_byte(lcd_tx_byte),
        .busy(lcd_tx_busy),
        .done(lcd_tx_done),
        .lcd_cs_n(lcd_cs_n),
        .lcd_scl(lcd_scl),
        .lcd_sda(lcd_sda)
    );

endmodule
