`timescale 1ns/1ps

module tb_display_controller;

    logic clk = 1'b0;
    logic rst_n = 1'b0;
    logic frame_start = 1'b0;
    logic frame_busy;
    logic frame_done;
    logic init_done;
    logic [16:0] fb_rd_addr;
    logic [15:0] fb_rd_data;
    logic [7:0] tx_byte;
    logic tx_is_data;
    logic tx_start;
    logic tx_busy;
    logic tx_done;
    logic lcd_reset_n;
    logic lcd_cs_n;
    logic lcd_scl;
    logic lcd_sda;

    logic [15:0] memory [0:3];
    logic [8:0] packet_shift = 9'd0;
    logic [8:0] packets [0:100];
    integer packet_bits = 0;
    integer packet_count = 0;

    always #5 clk = ~clk;

    always_ff @(posedge clk) begin
        fb_rd_data <= memory[fb_rd_addr];
    end

    display_controller #(
        .SCREEN_WIDTH(2),
        .SCREEN_HEIGHT(2),
        .RESET_LOW_CYCLES(3),
        .RESET_HIGH_CYCLES(4),
        .SLEEP_OUT_WAIT_CYCLES(5),
        .SHORT_WAIT_CYCLES(3)
    ) controller_i (
        .clk(clk),
        .rst_n(rst_n),
        .frame_start(frame_start),
        .frame_busy(frame_busy),
        .frame_done(frame_done),
        .init_done(init_done),
        .fb_rd_addr(fb_rd_addr),
        .fb_rd_data(fb_rd_data),
        .tx_byte(tx_byte),
        .tx_is_data(tx_is_data),
        .tx_start(tx_start),
        .tx_busy(tx_busy),
        .tx_done(tx_done),
        .lcd_reset_n(lcd_reset_n)
    );

    lcd_3wire_spi #(
        .CLK_DIVIDER(1),
        .CS_HIGH_CYCLES(2)
    ) transmitter_i (
        .clk(clk),
        .rst_n(rst_n),
        .start(tx_start),
        .is_data(tx_is_data),
        .tx_byte(tx_byte),
        .busy(tx_busy),
        .done(tx_done),
        .lcd_cs_n(lcd_cs_n),
        .lcd_scl(lcd_scl),
        .lcd_sda(lcd_sda)
    );

    always @(negedge lcd_cs_n) begin
        packet_shift = 9'd0;
        packet_bits = 0;
    end

    always @(posedge lcd_scl) begin
        if (!lcd_cs_n) begin
            packet_shift = {packet_shift[7:0], lcd_sda};
            packet_bits = packet_bits + 1;
        end
    end

    always @(posedge lcd_cs_n) begin
        if (packet_bits == 9) begin
            packets[packet_count] = packet_shift;
            packet_count = packet_count + 1;
        end
    end

    task automatic expect_packet(input integer index,
                                 input logic is_data,
                                 input logic [7:0] value);
        begin
            if (packets[index] !== {is_data, value}) begin
                $fatal(1, "Packet %0d expected %03h, got %03h",
                       index, {is_data, value}, packets[index]);
            end
        end
    endtask

    initial begin
        memory[0] = 16'hF800;
        memory[1] = 16'h07E0;
        memory[2] = 16'h001F;
        memory[3] = 16'hFFFF;

        repeat (4) @(posedge clk);
        rst_n = 1'b1;
        wait (init_done);
        @(posedge clk);

        if (packet_count != 72) begin
            $fatal(1, "Expected 72 initialization packets, got %0d",
                   packet_count);
        end
        expect_packet(0,  1'b0, 8'h28);
        expect_packet(1,  1'b0, 8'h11);
        expect_packet(2,  1'b0, 8'h36);
        expect_packet(3,  1'b1, 8'h88);
        expect_packet(4,  1'b0, 8'h3A);
        expect_packet(5,  1'b1, 8'h55);
        expect_packet(60, 1'b0, 8'h2A);
        expect_packet(64, 1'b1, 8'hEF);
        expect_packet(65, 1'b0, 8'h2B);
        expect_packet(69, 1'b1, 8'h3F);
        expect_packet(70, 1'b0, 8'h21);
        expect_packet(71, 1'b0, 8'h29);

        @(negedge clk);
        frame_start = 1'b1;
        @(negedge clk);
        frame_start = 1'b0;
        wait (frame_done);
        @(posedge clk);

        if (packet_count != 81) begin
            $fatal(1, "Expected 81 total packets, got %0d", packet_count);
        end
        expect_packet(72, 1'b0, 8'h2C);
        expect_packet(73, 1'b1, 8'hF8);
        expect_packet(74, 1'b1, 8'h00);
        expect_packet(75, 1'b1, 8'h07);
        expect_packet(76, 1'b1, 8'hE0);
        expect_packet(77, 1'b1, 8'h00);
        expect_packet(78, 1'b1, 8'h1F);
        expect_packet(79, 1'b1, 8'hFF);
        expect_packet(80, 1'b1, 8'hFF);

        if (frame_busy) begin
            $fatal(1, "Frame busy remained asserted after completion");
        end
        $display("PASS: Newhaven/ST7789 initialization and framebuffer scanout");
        $finish;
    end

    initial begin
        #1000000;
        $fatal(1, "Watchdog timeout");
    end

endmodule
