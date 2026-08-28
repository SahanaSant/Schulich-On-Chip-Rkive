module display_controller #(
    parameter int SCREEN_WIDTH = 240,
    parameter int SCREEN_HEIGHT = 320,
    parameter int RESET_LOW_CYCLES = 25_000_000,
    parameter int RESET_HIGH_CYCLES = 25_000_000,
    parameter int SLEEP_OUT_WAIT_CYCLES = 10_000_000,
    parameter int SHORT_WAIT_CYCLES = 1_000_000
) (
    input  logic        clk,
    input  logic        rst_n,

    input  logic        frame_start,
    output logic        frame_busy,
    output logic        frame_done,
    output logic        init_done,

    output logic [16:0] fb_rd_addr,
    input  logic [15:0] fb_rd_data,

    output logic [7:0]  tx_byte,
    output logic        tx_is_data,
    output logic        tx_start,
    input  logic        tx_busy,
    input  logic        tx_done,

    output logic        lcd_reset_n
);

    timeunit 1ns;
    timeprecision 1ps;

    localparam int PIXEL_COUNT = SCREEN_WIDTH * SCREEN_HEIGHT;
    localparam int LAST_INIT_WORD = 71;

    typedef enum logic [3:0] {
        ST_RESET_LOW,
        ST_RESET_HIGH,
        ST_INIT_SEND,
        ST_INIT_WAIT,
        ST_DELAY,
        ST_IDLE,
        ST_RAMWR_SEND,
        ST_RAMWR_WAIT,
        ST_FB_WAIT_1,
        ST_FB_WAIT_2,
        ST_PIXEL_HI_SEND,
        ST_PIXEL_HI_WAIT,
        ST_PIXEL_LO_SEND,
        ST_PIXEL_LO_WAIT
    } state_t;

    state_t state;
    logic [31:0] wait_count;
    logic [31:0] delay_target;
    state_t delay_next_state;
    logic [6:0] init_index;
    logic [16:0] pixel_index;
    logic [15:0] pixel_latched;
    logic [8:0] selected_word;

    function automatic logic [8:0] init_word(input logic [6:0] index);
        begin
            case (index)
                7'd0:  init_word = {1'b0, 8'h28}; // Display off
                7'd1:  init_word = {1'b0, 8'h11}; // Sleep out
                7'd2:  init_word = {1'b0, 8'h36}; // MADCTL
                7'd3:  init_word = {1'b1, 8'h88};
                7'd4:  init_word = {1'b0, 8'h3A}; // RGB565
                7'd5:  init_word = {1'b1, 8'h55};
                7'd6:  init_word = {1'b0, 8'hB2}; // Porch control
                7'd7:  init_word = {1'b1, 8'h0C};
                7'd8:  init_word = {1'b1, 8'h0C};
                7'd9:  init_word = {1'b1, 8'h00};
                7'd10: init_word = {1'b1, 8'h33};
                7'd11: init_word = {1'b1, 8'h33};
                7'd12: init_word = {1'b0, 8'hB7}; // Gate control
                7'd13: init_word = {1'b1, 8'h35};
                7'd14: init_word = {1'b0, 8'hBB}; // VCOM
                7'd15: init_word = {1'b1, 8'h2B};
                7'd16: init_word = {1'b0, 8'hC0}; // LCM control
                7'd17: init_word = {1'b1, 8'h2C};
                7'd18: init_word = {1'b0, 8'hC2}; // VDV/VRH enable
                7'd19: init_word = {1'b1, 8'h01};
                7'd20: init_word = {1'b1, 8'hFF};
                7'd21: init_word = {1'b0, 8'hC3}; // VRH set
                7'd22: init_word = {1'b1, 8'h11};
                7'd23: init_word = {1'b0, 8'hC4}; // VDV set
                7'd24: init_word = {1'b1, 8'h20};
                7'd25: init_word = {1'b0, 8'hC6}; // Frame rate
                7'd26: init_word = {1'b1, 8'h0F};
                7'd27: init_word = {1'b0, 8'hD0}; // Power control
                7'd28: init_word = {1'b1, 8'hA4};
                7'd29: init_word = {1'b1, 8'hA1};
                7'd30: init_word = {1'b0, 8'hE0}; // Positive gamma
                7'd31: init_word = {1'b1, 8'hD0};
                7'd32: init_word = {1'b1, 8'h00};
                7'd33: init_word = {1'b1, 8'h05};
                7'd34: init_word = {1'b1, 8'h0E};
                7'd35: init_word = {1'b1, 8'h15};
                7'd36: init_word = {1'b1, 8'h0D};
                7'd37: init_word = {1'b1, 8'h37};
                7'd38: init_word = {1'b1, 8'h43};
                7'd39: init_word = {1'b1, 8'h47};
                7'd40: init_word = {1'b1, 8'h09};
                7'd41: init_word = {1'b1, 8'h15};
                7'd42: init_word = {1'b1, 8'h12};
                7'd43: init_word = {1'b1, 8'h16};
                7'd44: init_word = {1'b1, 8'h19};
                7'd45: init_word = {1'b0, 8'hE1}; // Negative gamma
                7'd46: init_word = {1'b1, 8'hD0};
                7'd47: init_word = {1'b1, 8'h00};
                7'd48: init_word = {1'b1, 8'h05};
                7'd49: init_word = {1'b1, 8'h0D};
                7'd50: init_word = {1'b1, 8'h0C};
                7'd51: init_word = {1'b1, 8'h06};
                7'd52: init_word = {1'b1, 8'h2D};
                7'd53: init_word = {1'b1, 8'h44};
                7'd54: init_word = {1'b1, 8'h40};
                7'd55: init_word = {1'b1, 8'h0E};
                7'd56: init_word = {1'b1, 8'h1C};
                7'd57: init_word = {1'b1, 8'h18};
                7'd58: init_word = {1'b1, 8'h16};
                7'd59: init_word = {1'b1, 8'h19};
                7'd60: init_word = {1'b0, 8'h2A}; // Columns 0..239
                7'd61: init_word = {1'b1, 8'h00};
                7'd62: init_word = {1'b1, 8'h00};
                7'd63: init_word = {1'b1, 8'h00};
                7'd64: init_word = {1'b1, 8'hEF};
                7'd65: init_word = {1'b0, 8'h2B}; // Rows 0..319
                7'd66: init_word = {1'b1, 8'h00};
                7'd67: init_word = {1'b1, 8'h00};
                7'd68: init_word = {1'b1, 8'h01};
                7'd69: init_word = {1'b1, 8'h3F};
                7'd70: init_word = {1'b0, 8'h21}; // Inversion on for IPS
                7'd71: init_word = {1'b0, 8'h29}; // Display on
                default: init_word = 9'd0;
            endcase
        end
    endfunction

    always_comb begin
        selected_word = init_word(init_index);
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= ST_RESET_LOW;
            wait_count <= 32'd0;
            delay_target <= 32'd0;
            delay_next_state <= ST_RESET_LOW;
            init_index <= 7'd0;
            pixel_index <= 17'd0;
            pixel_latched <= 16'd0;
            fb_rd_addr <= 17'd0;
            tx_byte <= 8'd0;
            tx_is_data <= 1'b0;
            tx_start <= 1'b0;
            lcd_reset_n <= 1'b0;
            init_done <= 1'b0;
            frame_busy <= 1'b0;
            frame_done <= 1'b0;
        end else begin
            tx_start <= 1'b0;
            frame_done <= 1'b0;

            case (state)
                ST_RESET_LOW: begin
                    lcd_reset_n <= 1'b0;
                    if (wait_count == RESET_LOW_CYCLES - 1) begin
                        wait_count <= 32'd0;
                        lcd_reset_n <= 1'b1;
                        state <= ST_RESET_HIGH;
                    end else begin
                        wait_count <= wait_count + 1'b1;
                    end
                end

                ST_RESET_HIGH: begin
                    if (wait_count == RESET_HIGH_CYCLES - 1) begin
                        wait_count <= 32'd0;
                        init_index <= 7'd0;
                        state <= ST_INIT_SEND;
                    end else begin
                        wait_count <= wait_count + 1'b1;
                    end
                end

                ST_INIT_SEND: begin
                    if (!tx_busy) begin
                        tx_is_data <= selected_word[8];
                        tx_byte <= selected_word[7:0];
                        tx_start <= 1'b1;
                        state <= ST_INIT_WAIT;
                    end
                end

                ST_INIT_WAIT: begin
                    if (tx_done) begin
                        if (init_index == 7'd1) begin
                            delay_target <= SLEEP_OUT_WAIT_CYCLES;
                            delay_next_state <= ST_INIT_SEND;
                            init_index <= 7'd2;
                            wait_count <= 32'd0;
                            state <= ST_DELAY;
                        end else if (init_index == 7'd69) begin
                            delay_target <= SHORT_WAIT_CYCLES;
                            delay_next_state <= ST_INIT_SEND;
                            init_index <= 7'd70;
                            wait_count <= 32'd0;
                            state <= ST_DELAY;
                        end else if (init_index == LAST_INIT_WORD) begin
                            delay_target <= SHORT_WAIT_CYCLES;
                            delay_next_state <= ST_IDLE;
                            wait_count <= 32'd0;
                            state <= ST_DELAY;
                        end else begin
                            init_index <= init_index + 1'b1;
                            state <= ST_INIT_SEND;
                        end
                    end
                end

                ST_DELAY: begin
                    if (wait_count == delay_target - 1) begin
                        wait_count <= 32'd0;
                        if (delay_next_state == ST_IDLE) begin
                            init_done <= 1'b1;
                        end
                        state <= delay_next_state;
                    end else begin
                        wait_count <= wait_count + 1'b1;
                    end
                end

                ST_IDLE: begin
                    frame_busy <= 1'b0;
                    if (frame_start) begin
                        frame_busy <= 1'b1;
                        pixel_index <= 17'd0;
                        fb_rd_addr <= 17'd0;
                        state <= ST_RAMWR_SEND;
                    end
                end

                ST_RAMWR_SEND: begin
                    if (!tx_busy) begin
                        tx_is_data <= 1'b0;
                        tx_byte <= 8'h2C;
                        tx_start <= 1'b1;
                        state <= ST_RAMWR_WAIT;
                    end
                end

                ST_RAMWR_WAIT: begin
                    if (tx_done) begin
                        state <= ST_FB_WAIT_1;
                    end
                end

                ST_FB_WAIT_1: state <= ST_FB_WAIT_2;

                ST_FB_WAIT_2: begin
                    pixel_latched <= fb_rd_data;
                    state <= ST_PIXEL_HI_SEND;
                end

                ST_PIXEL_HI_SEND: begin
                    if (!tx_busy) begin
                        tx_is_data <= 1'b1;
                        tx_byte <= pixel_latched[15:8];
                        tx_start <= 1'b1;
                        state <= ST_PIXEL_HI_WAIT;
                    end
                end

                ST_PIXEL_HI_WAIT: begin
                    if (tx_done) begin
                        state <= ST_PIXEL_LO_SEND;
                    end
                end

                ST_PIXEL_LO_SEND: begin
                    if (!tx_busy) begin
                        tx_is_data <= 1'b1;
                        tx_byte <= pixel_latched[7:0];
                        tx_start <= 1'b1;
                        state <= ST_PIXEL_LO_WAIT;
                    end
                end

                ST_PIXEL_LO_WAIT: begin
                    if (tx_done) begin
                        if (pixel_index == PIXEL_COUNT - 1) begin
                            frame_busy <= 1'b0;
                            frame_done <= 1'b1;
                            state <= ST_IDLE;
                        end else begin
                            pixel_index <= pixel_index + 1'b1;
                            fb_rd_addr <= fb_rd_addr + 1'b1;
                            state <= ST_FB_WAIT_1;
                        end
                    end
                end

                default: state <= ST_RESET_LOW;
            endcase
        end
    end

endmodule
