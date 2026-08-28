`timescale 1ns/1ps

module tb_axi_lite_spi_master;

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

    logic spi_cs_n;
    logic spi_sclk;
    logic spi_mosi;
    logic spi_miso = 1'b1;

    logic [7:0] captured_mosi = 8'h00;
    integer spi_edges = 0;

    always #5 clk = ~clk;

    always @(posedge spi_sclk) begin
        captured_mosi = {captured_mosi[6:0], spi_mosi};
        spi_edges = spi_edges + 1;
    end

    axi_lite_spi_master dut (
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
        .spi_cs_n(spi_cs_n),
        .spi_sclk(spi_sclk),
        .spi_mosi(spi_mosi),
        .spi_miso(spi_miso)
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

    initial begin
        #100000;
        $fatal(1, "timeout waiting for AXI SPI test to finish");
    end

    initial begin
        repeat (4) @(posedge clk);
        resetn = 1'b1;
        @(posedge clk);

        if (spi_cs_n !== 1'b1) $fatal(1, "CS was asserted after reset");

        axi_write(6'h08, 32'd2, 4'b0011, response);
        if (response !== 2'b00) $fatal(1, "CLK_DIV write failed");
        axi_read(6'h08, read_value, response);
        if ((response !== 2'b00) || (read_value !== 32'd2)) begin
            $fatal(1, "CLK_DIV readback failed");
        end

        axi_write(6'h0C, 32'h0000_00A5, 4'b0001, response);
        if (response !== 2'b00) $fatal(1, "TX_DATA write failed");

        captured_mosi = 8'h00;
        spi_edges = 0;
        axi_write(6'h00, 32'h0000_0003, 4'b0001, response);
        if (response !== 2'b00) $fatal(1, "CONTROL start failed");
        if (spi_cs_n !== 1'b0) $fatal(1, "CS was not asserted");

        wait (dut.done_sticky);
        if ((spi_edges != 8) || (captured_mosi !== 8'hA5)) begin
            $fatal(1, "SPI transfer sent %02h over %0d edges",
                   captured_mosi, spi_edges);
        end

        axi_read(6'h04, read_value, response);
        if ((response !== 2'b00) || (read_value[2:0] !== 3'b110)) begin
            $fatal(1, "STATUS was %08h, expected RX_VALID and DONE", read_value);
        end
        axi_read(6'h10, read_value, response);
        if ((response !== 2'b00) || (read_value[7:0] !== 8'hFF)) begin
            $fatal(1, "RX_DATA did not contain 0xFF");
        end

        axi_write(6'h00, 32'h0000_0000, 4'b0001, response);
        if ((response !== 2'b00) || (spi_cs_n !== 1'b1)) begin
            $fatal(1, "CS deassertion failed");
        end

        // The engine must also clock bytes while CS is high for SD startup.
        captured_mosi = 8'h00;
        spi_edges = 0;
        axi_write(6'h0C, 32'h0000_00FF, 4'b0001, response);
        axi_write(6'h00, 32'h0000_0001, 4'b0001, response);
        wait (dut.done_sticky);
        if ((spi_cs_n !== 1'b1) || (spi_edges != 8) ||
            (captured_mosi !== 8'hFF)) begin
            $fatal(1, "dummy clocks with CS high failed");
        end

        axi_write(6'h14, 32'h1234_5678, 4'b1111, response);
        if (response !== 2'b10) $fatal(1, "invalid register write was accepted");
        axi_read(6'h14, read_value, response);
        if (response !== 2'b10) $fatal(1, "invalid register read was accepted");

        $display("PASS: AXI4-Lite programmable SPI master");
        $finish;
    end

endmodule
