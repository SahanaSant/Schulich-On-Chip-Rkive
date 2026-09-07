`timescale 1ns/1ps
// Tests the subsystem's 21-bit byte address and 20-bit transfer size.
module udma_external_per_top_tb;
  localparam int L2_AWIDTH_NOAL = 21;
  localparam int TRANS_SIZE = 20;
  localparam int WORDS = 48;
  logic  sys_clk_i = '0;
  logic  periph_clk_i = '0;
  logic  rstn_i = '0;
  logic [31:0] cfg_data_i = '0;
  logic [4:0] cfg_addr_i = '0;
  logic  cfg_valid_i = '0;
  logic  cfg_rwn_i = '0;
  logic  cfg_ready_o;
  logic [31:0] cfg_data_o;
  logic [L2_AWIDTH_NOAL-1:0] cfg_rx_startaddr_o;
  logic [TRANS_SIZE-1:0] cfg_rx_size_o;
  logic  cfg_rx_continuous_o;
  logic  cfg_rx_en_o;
  logic  cfg_rx_clr_o;
  logic  cfg_rx_en_i = '0;
  logic  cfg_rx_pending_i = '0;
  logic [L2_AWIDTH_NOAL-1:0] cfg_rx_curr_addr_i = '0;
  logic [TRANS_SIZE-1:0] cfg_rx_bytes_left_i = '0;
  logic [L2_AWIDTH_NOAL-1:0] cfg_tx_startaddr_o;
  logic [TRANS_SIZE-1:0] cfg_tx_size_o;
  logic  cfg_tx_continuous_o;
  logic  cfg_tx_en_o;
  logic  cfg_tx_clr_o;
  logic  cfg_tx_en_i = '0;
  logic  cfg_tx_pending_i = '0;
  logic [L2_AWIDTH_NOAL-1:0] cfg_tx_curr_addr_i = '0;
  logic [TRANS_SIZE-1:0] cfg_tx_bytes_left_i = '0;
  logic  data_tx_req_o;
  logic  data_tx_gnt_i = '0;
  logic [1:0] data_tx_datasize_o;
  logic [31:0] data_tx_i = '0;
  logic  data_tx_valid_i = '0;
  logic  data_tx_ready_o;
  logic [1:0] data_rx_datasize_o;
  logic [31:0] data_rx_o;
  logic  data_rx_valid_o;
  logic  data_rx_ready_i = '0;
  logic [31:0] external_per_status_i = '0;
  logic [31:0] external_per_setup_o;
  logic  data_tx_dc_valid_o;
  logic  data_tx_dc_ready_i = '0;
  logic [31:0] data_tx_dc_o;
  logic  data_rx_dc_valid_i = '0;
  logic  data_rx_dc_ready_o;
  logic [31:0] data_rx_dc_i = '0;
  int sys_half = 25, periph_half = 31;
  int tx_seen = 0, rx_seen = 0, tx_waits = 0, rx_waits = 0;
  int sys_cycles = 0, periph_cycles = 0;
  bit enable_sinks = 0;
  bit tx_stalled = 0, rx_stalled = 0;
  logic [31:0] tx_saved, rx_saved;
  logic [31:0] epoch = 32'h1357_0000;

  udma_external_per_top #(
    .L2_AWIDTH_NOAL(L2_AWIDTH_NOAL), .TRANS_SIZE(TRANS_SIZE)
  ) dut (.*);

  initial begin
    void'($value$plusargs("sys_half=%d", sys_half));
    forever #(sys_half) sys_clk_i = ~sys_clk_i;
  end
  initial begin
    void'($value$plusargs("periph_half=%d", periph_half));
    #3;
    forever #(periph_half) periph_clk_i = ~periph_clk_i;
  end
  initial begin
    #1000000;
    $fatal(1, "Timeout: TX=%0d RX=%0d", tx_seen, rx_seen);
  end

  function automatic logic [31:0] word_at(input int n, input bit rx);
    return epoch ^ (32'h9e37_79b9 * 32'(n + 1)) ^ (rx ? 32'ha5a5_5a5a : 0);
  endfunction

  always @(negedge sys_clk_i) begin
    sys_cycles++;
    data_rx_ready_i = rstn_i && enable_sinks && ((sys_cycles % 7) >= 3);
  end
  always @(negedge periph_clk_i) begin
    periph_cycles++;
    data_tx_dc_ready_i = rstn_i && enable_sinks && ((periph_cycles % 9) >= 4);
  end

  always @(posedge periph_clk_i or negedge rstn_i) begin
    if (!rstn_i) begin
      tx_seen = 0;
      tx_stalled = 0;
    end else begin
      if (tx_stalled && (!data_tx_dc_valid_o || data_tx_dc_o !== tx_saved))
        $fatal(1, "TX changed while backpressured");
      if (data_tx_dc_valid_o && data_tx_dc_ready_i) begin
        if (tx_seen >= WORDS || data_tx_dc_o !== word_at(tx_seen, 0))
          $fatal(1, "TX mismatch at %0d: %h", tx_seen, data_tx_dc_o);
        tx_seen++;
      end
      tx_stalled = data_tx_dc_valid_o && !data_tx_dc_ready_i;
      tx_saved = data_tx_dc_o;
    end
  end
  always @(posedge sys_clk_i or negedge rstn_i) begin
    if (!rstn_i) begin
      rx_seen = 0;
      rx_stalled = 0;
    end else begin
      if (rx_stalled && (!data_rx_valid_o || data_rx_o !== rx_saved))
        $fatal(1, "RX changed while backpressured");
      if (data_rx_valid_o && data_rx_ready_i) begin
        if (rx_seen >= WORDS || data_rx_o !== word_at(rx_seen, 1))
          $fatal(1, "RX mismatch at %0d: %h", rx_seen, data_rx_o);
        rx_seen++;
      end
      rx_stalled = data_rx_valid_o && !data_rx_ready_i;
      rx_saved = data_rx_o;
    end
  end

  task automatic reset_dut;
    @(negedge sys_clk_i);
    rstn_i = 0;
    enable_sinks = 0;
    cfg_valid_i = 0;
    data_tx_gnt_i = 0;
    data_tx_valid_i = 0;
    data_rx_dc_valid_i = 0;
    repeat (6) @(negedge sys_clk_i);
    #1;
    if (data_rx_datasize_o !== 2'b10 || data_tx_datasize_o !== 2'b10)
      $fatal(1, "Reset datasize: RX=%b TX=%b; expected word (10)",
             data_rx_datasize_o, data_tx_datasize_o);
    if (external_per_setup_o !== 0 || cfg_rx_size_o !== 0 ||
        cfg_tx_size_o !== 0 || cfg_rx_startaddr_o !== 0 ||
        cfg_tx_startaddr_o !== 0 || cfg_rx_en_o || cfg_tx_en_o ||
        cfg_rx_clr_o || cfg_tx_clr_o || cfg_rx_continuous_o ||
        cfg_tx_continuous_o || data_rx_valid_o || data_tx_dc_valid_o)
      $fatal(1, "Reset state mismatch");
    rstn_i = 1;
    repeat (5) @(negedge sys_clk_i);
  endtask

  task automatic write_reg(input logic [4:0] addr, input logic [31:0] value);
    @(negedge sys_clk_i);
    cfg_addr_i = addr; cfg_data_i = value; cfg_rwn_i = 0; cfg_valid_i = 1;
    @(posedge sys_clk_i); #1;
    if (!cfg_ready_o) $fatal(1, "Configuration write not acknowledged");
    if (addr == 2 && {cfg_rx_clr_o,cfg_rx_en_o} !== value[5:4])
      $fatal(1, "RX enable/clear pulse mismatch");
    if (addr == 6 && {cfg_tx_clr_o,cfg_tx_en_o} !== value[5:4])
      $fatal(1, "TX enable/clear pulse mismatch");
    @(negedge sys_clk_i); cfg_valid_i = 0;
    @(posedge sys_clk_i); #1;
    if (cfg_rx_en_o || cfg_rx_clr_o || cfg_tx_en_o || cfg_tx_clr_o)
      $fatal(1, "Configuration pulse lasted more than one cycle");
  endtask

  task automatic read_reg(input logic [4:0] addr, input logic [31:0] value);
    @(negedge sys_clk_i);
    cfg_addr_i = addr; cfg_rwn_i = 1; cfg_valid_i = 1;
    #1;
    if (!cfg_ready_o || cfg_data_o !== value)
      $fatal(1, "Register %0d: got %h expected %h", addr, cfg_data_o, value);
    @(negedge sys_clk_i); cfg_valid_i = 0;
  endtask

  task automatic registers;
    write_reg(0, 32'h001a_bcde); write_reg(1, 32'h000d_4321);
    write_reg(4, 32'h0012_3456); write_reg(5, 32'h000e_1234);
    write_reg(2, 32'h35); write_reg(6, 32'h35);
    if (cfg_rx_startaddr_o !== 21'h1a_bcde || cfg_tx_startaddr_o !== 21'h12_3456 ||
        cfg_rx_size_o !== 20'hd4321 || cfg_tx_size_o !== 20'he1234 ||
        data_rx_datasize_o !== 2 || data_tx_datasize_o !== 2)
      $fatal(1, "Address/size/word configuration mismatch");
    cfg_rx_curr_addr_i = 21'h123456; cfg_tx_curr_addr_i = 21'h1abcde;
    cfg_rx_bytes_left_i = 20'h54321; cfg_tx_bytes_left_i = 20'h6789a;
    cfg_rx_en_i = 1; cfg_rx_pending_i = 1;
    cfg_tx_en_i = 1; cfg_tx_pending_i = 1;
    read_reg(0, 32'h123456); read_reg(1, 32'h54321); read_reg(2, 32'h31);
    read_reg(4, 32'h1abcde); read_reg(5, 32'h6789a); read_reg(6, 32'h31);
    external_per_status_i = 32'h89ab_cdef;
    read_reg(8, 32'h89ab_cdef);
    write_reg(9, 32'hfedc_ba98); read_reg(9, 32'hfedc_ba98);
    if (external_per_setup_o !== 32'hfedc_ba98) $fatal(1, "Setup mismatch");
    read_reg(31, 0);
    // Byte and half-word programming must also work, then restore word mode.
    write_reg(2, 0); write_reg(6, 2);
    if (data_rx_datasize_o !== 0 || data_tx_datasize_o !== 1)
      $fatal(1, "Byte/half-word configuration mismatch");
    write_reg(2, 4); write_reg(6, 4);
  endtask

  task automatic send_tx;
    for (int n = 0; n < WORDS; n++) begin
      @(negedge sys_clk_i);
      while (!data_tx_req_o) begin tx_waits++; @(negedge sys_clk_i); end
      data_tx_gnt_i = 1;
      @(negedge sys_clk_i);
      data_tx_gnt_i = 0;
      data_tx_i = word_at(n, 0); data_tx_valid_i = 1;
      do @(posedge sys_clk_i); while (!data_tx_ready_o);
      @(negedge sys_clk_i); data_tx_valid_i = 0;
    end
  endtask
  task automatic send_rx;
    for (int n = 0; n < WORDS; n++) begin
      @(negedge periph_clk_i);
      data_rx_dc_i = word_at(n, 1); data_rx_dc_valid_i = 1;
      @(posedge periph_clk_i);
      while (!data_rx_dc_ready_o) begin rx_waits++; @(posedge periph_clk_i); end
      @(negedge periph_clk_i); data_rx_dc_valid_i = 0;
    end
  endtask

  task automatic transfers;
    tx_waits = 0; rx_waits = 0;
    fork
      send_tx();
      send_rx();
      begin
        repeat (100) @(negedge sys_clk_i);
        if (tx_waits == 0 || rx_waits == 0)
          $fatal(1, "FIFO saturation/backpressure was not exercised");
        enable_sinks = 1;
      end
    join
    wait (tx_seen == WORDS && rx_seen == WORDS);
    repeat (30) @(negedge sys_clk_i);
    if (data_rx_valid_o || data_tx_dc_valid_o) $fatal(1, "Unexpected extra word");
  endtask

  initial begin
    reset_dut();
    registers();
    transfers();
    // Reassert reset after programming byte widths; RX must not retain them.
    write_reg(2, 0); write_reg(6, 0);
    reset_dut();
    epoch = 32'hcaFe_0000;
    registers();
    transfers();
    $display("PASS external peripheral: reset, registers, pulses, TX=96 RX=96, FIFO wraps/backpressure; clocks=%0d/%0d ns",
             2*sys_half, 2*periph_half);
    $finish;
  end
endmodule
