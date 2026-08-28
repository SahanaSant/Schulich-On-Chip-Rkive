module spi_byte_master #(
    parameter int DIV_WIDTH = 16
) (
    input  logic                 clk,
    input  logic                 resetn,

    input  logic                 start,
    input  logic [7:0]           tx_data,
    input  logic [DIV_WIDTH-1:0] clk_divider,

    output logic [7:0]           rx_data,
    output logic                 busy,
    output logic                 done,

    output logic                 spi_sclk,
    output logic                 spi_mosi,
    input  logic                 spi_miso
);

    timeunit 1ns;
    timeprecision 1ps;

    logic [DIV_WIDTH-1:0] divider_count;
    logic [DIV_WIDTH-1:0] divider_latched;
    logic [7:0] tx_shift;
    logic [7:0] rx_shift;
    logic [3:0] sampled_bits;

    always_ff @(posedge clk) begin
        if (!resetn) begin
            divider_count <= '0;
            divider_latched <= {{(DIV_WIDTH-1){1'b0}}, 1'b1};
            tx_shift <= 8'hFF;
            rx_shift <= 8'h00;
            sampled_bits <= 4'd0;
            rx_data <= 8'h00;
            busy <= 1'b0;
            done <= 1'b0;
            spi_sclk <= 1'b0;
            spi_mosi <= 1'b1;
        end else begin
            done <= 1'b0;

            if (!busy) begin
                spi_sclk <= 1'b0;
                spi_mosi <= 1'b1;

                if (start) begin
                    divider_latched <=
                        (clk_divider == '0)
                            ? {{(DIV_WIDTH-1){1'b0}}, 1'b1}
                            : clk_divider;
                    divider_count <=
                        (clk_divider <= 1)
                            ? '0
                            : clk_divider - 1'b1;
                    tx_shift <= tx_data;
                    rx_shift <= 8'h00;
                    sampled_bits <= 4'd0;
                    spi_mosi <= tx_data[7];
                    busy <= 1'b1;
                end
            end else if (divider_count != '0) begin
                divider_count <= divider_count - 1'b1;
            end else begin
                divider_count <= divider_latched - 1'b1;

                if (!spi_sclk) begin
                    // SPI mode 0 samples input on the rising clock edge.
                    spi_sclk <= 1'b1;
                    rx_shift <= {rx_shift[6:0], spi_miso};
                    sampled_bits <= sampled_bits + 1'b1;
                end else begin
                    // SPI mode 0 changes output on the falling clock edge.
                    spi_sclk <= 1'b0;
                    if (sampled_bits == 4'd8) begin
                        rx_data <= rx_shift;
                        busy <= 1'b0;
                        done <= 1'b1;
                        spi_mosi <= 1'b1;
                    end else begin
                        tx_shift <= {tx_shift[6:0], 1'b0};
                        spi_mosi <= tx_shift[6];
                    end
                end
            end
        end
    end

endmodule
