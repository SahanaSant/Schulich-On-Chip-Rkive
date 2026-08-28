`timescale 1ns/1ps

module tb_axi_lite_display_control;

    logic clk = 1'b0;
    logic resetn = 1'b0;
    logic [5:0] awaddr = '0;
    logic awvalid = 1'b0;
    logic awready;
    logic [31:0] wdata = '0;
    logic [3:0] wstrb = '0;
    logic wvalid = 1'b0;
    logic wready;
    logic [1:0] bresp;
    logic bvalid;
    logic bready = 1'b0;
    logic [5:0] araddr = '0;
    logic arvalid = 1'b0;
    logic arready;
    logic [31:0] rdata;
    logic [1:0] rresp;
    logic rvalid;
    logic rready = 1'b0;
    logic display_init_done = 1'b0;
    logic display_frame_busy = 1'b0;
    logic display_frame_done = 1'b0;
    logic display_frame_start;

    always #5 clk = ~clk;

    axi_lite_display_control dut (
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
        .display_init_done(display_init_done),
        .display_frame_busy(display_frame_busy),
        .display_frame_done(display_frame_done),
        .display_frame_start(display_frame_start)
    );

    task automatic axi_write(
        input logic [5:0] address,
        input logic [31:0] data,
        input logic [3:0] strobes,
        output logic [1:0] response
    );
        begin
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
            response = bresp;
            @(negedge clk);
            bready = 1'b1;
            @(negedge clk);
            bready = 1'b0;
        end
    endtask

    task automatic axi_read(
        input logic [5:0] address,
        output logic [31:0] data,
        output logic [1:0] response
    );
        begin
            @(negedge clk);
            araddr = address;
            arvalid = 1'b1;
            do @(posedge clk); while (!arready);
            @(negedge clk);
            arvalid = 1'b0;
            wait (rvalid);
            data = rdata;
            response = rresp;
            @(negedge clk);
            rready = 1'b1;
            @(negedge clk);
            rready = 1'b0;
        end
    endtask

    logic [1:0] response;
    logic [31:0] read_value;
    integer start_pulses = 0;

    always @(posedge clk) begin
        if (display_frame_start) start_pulses <= start_pulses + 1;
    end

    initial begin
        #100000;
        $fatal(1, "timeout waiting for display-control test");
    end

    initial begin
        repeat (4) @(posedge clk);
        resetn = 1'b1;

        axi_read(6'h04, read_value, response);
        if ((response !== 2'b00) || (read_value[3:0] !== 4'b0000))
            $fatal(1, "unexpected reset status %08h", read_value);

        // A frame cannot start until the LCD initialization sequence finishes.
        axi_write(6'h00, 32'h1, 4'b0001, response);
        if (response !== 2'b10) $fatal(1, "early START was accepted");
        axi_read(6'h04, read_value, response);
        if ((response !== 2'b00) || !read_value[3])
            $fatal(1, "early START did not set ERROR");

        // Clear the sticky status bits, then issue a legal one-cycle request.
        axi_write(6'h00, 32'h2, 4'b0001, response);
        if (response !== 2'b00) $fatal(1, "CLEAR_STATUS failed");
        display_init_done = 1'b1;
        axi_write(6'h00, 32'h1, 4'b0001, response);
        if ((response !== 2'b00) || (start_pulses != 1))
            $fatal(1, "legal START did not produce exactly one pulse");

        display_frame_busy = 1'b1;
        axi_read(6'h04, read_value, response);
        if ((response !== 2'b00) || (read_value[3:0] !== 4'b0101))
            $fatal(1, "busy/init status was %08h", read_value);

        axi_write(6'h00, 32'h1, 4'b0001, response);
        if (response !== 2'b10) $fatal(1, "busy START was accepted");

        display_frame_busy = 1'b0;
        @(negedge clk);
        display_frame_done = 1'b1;
        @(negedge clk);
        display_frame_done = 1'b0;
        axi_read(6'h04, read_value, response);
        if ((response !== 2'b00) || (read_value[3:0] !== 4'b1110))
            $fatal(1, "sticky done/error status was %08h", read_value);

        axi_write(6'h00, 32'h2, 4'b0001, response);
        axi_read(6'h04, read_value, response);
        if ((response !== 2'b00) || (read_value[3:0] !== 4'b0100))
            $fatal(1, "status did not clear: %08h", read_value);

        axi_read(6'h08, read_value, response);
        if (response !== 2'b10) $fatal(1, "invalid read did not SLVERR");
        axi_write(6'h04, 32'h0, 4'b0001, response);
        if (response !== 2'b10) $fatal(1, "invalid write did not SLVERR");

        $display("PASS: AXI4-Lite display control/status peripheral");
        $finish;
    end

endmodule
