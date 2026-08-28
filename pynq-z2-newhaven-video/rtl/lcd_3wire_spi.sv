module lcd_3wire_spi #(
    parameter int DIV_WIDTH = 16,
    parameter int CLK_DIVIDER = 2,
    parameter int CS_HIGH_CYCLES = 4
) (
    input  logic                     clk,
    input  logic                     rst_n,
    input  logic                     start,
    input  logic                     is_data,
    input  logic [7:0]               tx_byte,
    output logic                     busy,
    output logic                     done,
    output logic                     lcd_cs_n,
    output logic                     lcd_scl,
    output logic                     lcd_sda
);

    timeunit 1ns;
    timeprecision 1ps;

    typedef enum logic [1:0] {TX_IDLE, TX_BITS, TX_CS_HIGH} tx_state_t;
    tx_state_t state;
    logic [8:0] shift_register;
    logic [3:0] bit_index;
    logic [DIV_WIDTH-1:0] divider_count;
    logic [15:0] cs_high_count;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= TX_IDLE;
            shift_register <= 9'd0;
            bit_index <= 4'd0;
            divider_count <= '0;
            cs_high_count <= 16'd0;
            busy <= 1'b0;
            done <= 1'b0;
            lcd_cs_n <= 1'b1;
            lcd_scl <= 1'b0;
            lcd_sda <= 1'b0;
        end else begin
            done <= 1'b0;

            case (state)
                TX_IDLE: begin
                    busy <= 1'b0;
                    lcd_cs_n <= 1'b1;
                    lcd_scl <= 1'b0;
                    if (start) begin
                        shift_register <= {is_data, tx_byte};
                        bit_index <= 4'd8;
                        divider_count <= CLK_DIVIDER - 1;
                        busy <= 1'b1;
                        lcd_cs_n <= 1'b0;
                        lcd_sda <= is_data;
                        state <= TX_BITS;
                    end
                end

                TX_BITS: begin
                    if (divider_count != 0) begin
                        divider_count <= divider_count - 1'b1;
                    end else begin
                        divider_count <= CLK_DIVIDER - 1;
                        if (!lcd_scl) begin
                            lcd_scl <= 1'b1;
                        end else begin
                            lcd_scl <= 1'b0;
                            if (bit_index == 0) begin
                                lcd_cs_n <= 1'b1;
                                cs_high_count <= CS_HIGH_CYCLES - 1;
                                state <= TX_CS_HIGH;
                            end else begin
                                bit_index <= bit_index - 1'b1;
                                lcd_sda <= shift_register[bit_index - 1'b1];
                            end
                        end
                    end
                end

                TX_CS_HIGH: begin
                    if (cs_high_count == 0) begin
                        busy <= 1'b0;
                        done <= 1'b1;
                        state <= TX_IDLE;
                    end else begin
                        cs_high_count <= cs_high_count - 1'b1;
                    end
                end

                default: state <= TX_IDLE;
            endcase
        end
    end

endmodule
