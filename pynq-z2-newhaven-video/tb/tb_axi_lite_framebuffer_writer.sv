`timescale 1ns/1ps

module tb_axi_lite_framebuffer_writer;

    localparam int AXI_ADDR_WIDTH = 18;
    localparam int FB_ADDR_WIDTH = 17;
    localparam int PIXEL_COUNT = 76800;

    logic clk = 1'b0;
    logic resetn = 1'b0;

    logic [AXI_ADDR_WIDTH-1:0] awaddr = '0;
    logic awvalid = 1'b0;
    logic awready;
    logic [31:0] wdata = '0;
    logic [3:0] wstrb = '0;
    logic wvalid = 1'b0;
    logic wready;
    logic [1:0] bresp;
    logic bvalid;
    logic bready = 1'b0;

    logic [AXI_ADDR_WIDTH-1:0] araddr = '0;
    logic arvalid = 1'b0;
    logic arready;
    logic [31:0] rdata;
    logic [1:0] rresp;
    logic rvalid;
    logic rready = 1'b0;

    logic fb_wr_clk;
    logic fb_wr_en;
    logic [FB_ADDR_WIDTH-1:0] fb_wr_addr;
    logic [15:0] fb_wr_data;

    logic [FB_ADDR_WIDTH-1:0] rd_addr = '0;
    logic [15:0] rd_data;

    always #5 clk = ~clk;

    axi_lite_framebuffer_writer #(
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),
        .FB_ADDR_WIDTH(FB_ADDR_WIDTH),
        .PIXEL_COUNT(PIXEL_COUNT)
    ) dut (
        .s_axi_aclk(clk),
        .s_axi_aresetn(resetn),
        .s_axi_awaddr(awaddr),
        .s_axi_awprot(3'b000),
        .s_axi_awvalid(awvalid),
        .s_axi_awready(awready),
        .s_axi_wdata(wdata),
        .s_axi_wstrb(wstrb),
        .s_axi_wvalid(wvalid),
        .s_axi_wready(wready),
        .s_axi_bresp(bresp),
        .s_axi_bvalid(bvalid),
        .s_axi_bready(bready),
        .s_axi_araddr(araddr),
        .s_axi_arprot(3'b000),
        .s_axi_arvalid(arvalid),
        .s_axi_arready(arready),
        .s_axi_rdata(rdata),
        .s_axi_rresp(rresp),
        .s_axi_rvalid(rvalid),
        .s_axi_rready(rready),
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
        .rd_clk(clk),
        .rd_addr(rd_addr),
        .rd_data(rd_data)
    );

    task automatic axi_write(
        input logic [AXI_ADDR_WIDTH-1:0] address,
        input logic [31:0] data,
        input logic [3:0] strobes,
        output logic [1:0] response
    );
        begin
            $display("AXI write start: addr=%0d data=%08h strb=%b time=%0t",
                     address, data, strobes, $time);
            @(negedge clk);
            awaddr = address;
            awvalid = 1'b1;
            wdata = data;
            wstrb = strobes;
            wvalid = 1'b1;

            do @(posedge clk); while (!(awready && wready));
            @(negedge clk);
            awvalid = 1'b0;
            wvalid = 1'b0;

            wait (bvalid);
            $display("AXI response: %b time=%0t", bresp, $time);
            response = bresp;
            @(negedge clk);
            bready = 1'b1;
            @(negedge clk);
            bready = 1'b0;
        end
    endtask

    task automatic check_pixel(
        input logic [FB_ADDR_WIDTH-1:0] address,
        input logic [15:0] expected
    );
        begin
            @(negedge clk);
            rd_addr = address;
            @(negedge clk);
            if (rd_data !== expected) begin
                $fatal(1, "pixel %0d was %04h, expected %04h",
                       address, rd_data, expected);
            end
        end
    endtask

    logic [1:0] response;

    initial begin
        #100000;
        $fatal(1, "timeout waiting for AXI4-Lite test to finish");
    end

    initial begin
        repeat (4) @(posedge clk);
        resetn = 1'b1;
        $display("reset released at %0t", $time);

        axi_write(18'd0, 32'h0000_F800, 4'b0011, response);
        if (response !== 2'b00) $fatal(1, "lower-half write failed");
        check_pixel(17'd0, 16'hF800);

        axi_write(18'd2, 32'h07E0_0000, 4'b1100, response);
        if (response !== 2'b00) $fatal(1, "upper-half write failed");
        check_pixel(17'd1, 16'h07E0);

        axi_write(18'd4, 32'hFFE0_001F, 4'b1111, response);
        if (response !== 2'b00) $fatal(1, "two-pixel write failed");
        check_pixel(17'd2, 16'h001F);
        check_pixel(17'd3, 16'hFFE0);

        // Address and data are allowed to arrive on different AXI cycles.
        @(negedge clk);
        awaddr = 18'd8;
        awvalid = 1'b1;
        do @(posedge clk); while (!awready);
        @(negedge clk);
        awvalid = 1'b0;
        repeat (2) @(posedge clk);
        @(negedge clk);
        wdata = 32'h0000_FFFF;
        wstrb = 4'b0011;
        wvalid = 1'b1;
        do @(posedge clk); while (!wready);
        @(negedge clk);
        wvalid = 1'b0;
        wait (bvalid);
        if (bresp !== 2'b00) $fatal(1, "split-channel write failed");
        @(negedge clk);
        bready = 1'b1;
        @(negedge clk);
        bready = 1'b0;
        check_pixel(17'd4, 16'hFFFF);

        axi_write(18'd1, 32'h0000_1234, 4'b0011, response);
        if (response !== 2'b10) $fatal(1, "unaligned write was accepted");

        axi_write(PIXEL_COUNT * 2, 32'h0000_1234, 4'b0011, response);
        if (response !== 2'b10) $fatal(1, "out-of-range write was accepted");

        @(negedge clk);
        araddr = 18'd0;
        arvalid = 1'b1;
        do @(posedge clk); while (!arready);
        @(negedge clk);
        arvalid = 1'b0;
        wait (rvalid);
        if ((rresp !== 2'b10) || (rdata !== 32'd0)) begin
            $fatal(1, "unsupported read did not return SLVERR");
        end
        @(negedge clk);
        rready = 1'b1;
        @(negedge clk);
        rready = 1'b0;

        $display("PASS: AXI4-Lite framebuffer writer");
        $finish;
    end

endmodule
