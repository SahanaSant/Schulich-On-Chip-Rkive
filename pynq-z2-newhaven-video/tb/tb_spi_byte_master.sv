`timescale 1ns/1ps

module tb_spi_byte_master;

    logic clk = 1'b0;
    logic resetn = 1'b0;
    logic start = 1'b0;
    logic [7:0] tx_data = 8'h00;
    logic [15:0] clk_divider = 16'd1;
    logic [7:0] rx_data;
    logic busy;
    logic done;
    logic spi_sclk;
    logic spi_mosi;
    logic spi_miso;

    logic [7:0] slave_tx = 8'hFF;
    logic [7:0] captured_mosi = 8'h00;
    integer sampled_edges = 0;
    time previous_edge = 0;
    time expected_half_period = 0;

    always #5 clk = ~clk;

    assign spi_miso = (sampled_edges < 8)
        ? slave_tx[7-sampled_edges]
        : 1'b1;

    always @(posedge spi_sclk) begin
        captured_mosi = {captured_mosi[6:0], spi_mosi};
        sampled_edges = sampled_edges + 1;
    end

    always @(spi_sclk) begin
        if (busy && (previous_edge != 0)) begin
            if (($time - previous_edge) != expected_half_period) begin
                $fatal(1, "SPI half period was %0t, expected %0t",
                       $time - previous_edge, expected_half_period);
            end
        end
        if (busy) previous_edge = $time;
    end

    spi_byte_master dut (
        .clk(clk),
        .resetn(resetn),
        .start(start),
        .tx_data(tx_data),
        .clk_divider(clk_divider),
        .rx_data(rx_data),
        .busy(busy),
        .done(done),
        .spi_sclk(spi_sclk),
        .spi_mosi(spi_mosi),
        .spi_miso(spi_miso)
    );

    task automatic transfer_and_check(
        input logic [7:0] transmitted,
        input logic [7:0] returned,
        input logic [15:0] divider
    );
        begin
            sampled_edges = 0;
            captured_mosi = 8'h00;
            previous_edge = 0;
            expected_half_period = divider * 10ns;
            slave_tx = returned;
            tx_data = transmitted;
            clk_divider = divider;

            @(negedge clk);
            start = 1'b1;
            @(negedge clk);
            start = 1'b0;

            wait (done);
            if (sampled_edges != 8) begin
                $fatal(1, "observed %0d rising edges instead of 8",
                       sampled_edges);
            end
            if (captured_mosi !== transmitted) begin
                $fatal(1, "MOSI sent %02h, expected %02h",
                       captured_mosi, transmitted);
            end
            if (rx_data !== returned) begin
                $fatal(1, "received %02h, expected %02h", rx_data, returned);
            end
            if (spi_sclk !== 1'b0) begin
                $fatal(1, "SCLK did not return low after transfer");
            end
            @(posedge clk);
            @(negedge clk);
            if (done !== 1'b0) begin
                $fatal(1, "done was not a one-cycle pulse");
            end
        end
    endtask

    initial begin
        #100000;
        $fatal(1, "timeout waiting for SPI test to finish");
    end

    initial begin
        repeat (4) @(posedge clk);
        resetn = 1'b1;
        @(posedge clk);

        if (busy || done || spi_sclk || (spi_mosi !== 1'b1)) begin
            $fatal(1, "incorrect idle state after reset");
        end

        transfer_and_check(8'hA5, 8'h3C, 16'd4);
        transfer_and_check(8'h00, 8'hFF, 16'd2);
        transfer_and_check(8'hFF, 8'h81, 16'd1);

        $display("PASS: programmable SPI mode-0 byte master");
        $finish;
    end

endmodule
