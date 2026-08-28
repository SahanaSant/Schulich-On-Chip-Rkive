`timescale 1ns/1ps

module tb_lcd_3wire_spi;

    logic clk = 1'b0;
    logic rst_n = 1'b0;
    logic start = 1'b0;
    logic is_data = 1'b0;
    logic [7:0] tx_byte = 8'd0;
    logic busy;
    logic done;
    logic lcd_cs_n;
    logic lcd_scl;
    logic lcd_sda;

    logic [8:0] captured_word = 9'd0;
    integer captured_bits = 0;
    integer total_rising_edges = 0;

    always #5 clk = ~clk;

    lcd_3wire_spi #(
        .CLK_DIVIDER(2),
        .CS_HIGH_CYCLES(4)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .is_data(is_data),
        .tx_byte(tx_byte),
        .busy(busy),
        .done(done),
        .lcd_cs_n(lcd_cs_n),
        .lcd_scl(lcd_scl),
        .lcd_sda(lcd_sda)
    );

    always @(posedge lcd_scl) begin
        if (!lcd_cs_n) begin
            captured_word = {captured_word[7:0], lcd_sda};
            captured_bits = captured_bits + 1;
            total_rising_edges = total_rising_edges + 1;
        end
    end

    task automatic send_and_check(
        input logic expected_is_data,
        input logic [7:0] expected_byte
    );
        begin
            captured_word = 9'd0;
            captured_bits = 0;
            @(negedge clk);
            is_data = expected_is_data;
            tx_byte = expected_byte;
            start = 1'b1;
            @(negedge clk);
            start = 1'b0;
            wait (done);
            if (captured_bits != 9) begin
                $fatal(1, "Expected 9 clock edges, got %0d", captured_bits);
            end
            if (captured_word !== {expected_is_data, expected_byte}) begin
                $fatal(1, "Expected packet %03h, got %03h",
                       {expected_is_data, expected_byte}, captured_word);
            end
            if (!lcd_cs_n || lcd_scl) begin
                $fatal(1, "LCD bus did not return to idle");
            end
        end
    endtask

    initial begin
        repeat (4) @(posedge clk);
        rst_n = 1'b1;
        repeat (2) @(posedge clk);

        send_and_check(1'b0, 8'hA5);
        send_and_check(1'b1, 8'h5A);

        if (total_rising_edges != 18) begin
            $fatal(1, "Unexpected total clock count: %0d", total_rising_edges);
        end
        $display("PASS: ST7789 3-wire 9-bit SPI transmitter");
        $finish;
    end

    initial begin
        #100000;
        $fatal(1, "Watchdog timeout");
    end

endmodule
