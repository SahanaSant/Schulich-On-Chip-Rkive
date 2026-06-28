module cocotb_iverilog_dump();
initial begin
    string dumpfile_path;    if ($value$plusargs("dumpfile_path=%s", dumpfile_path)) begin
        $dumpfile(dumpfile_path);
    end else begin
        $dumpfile("C:\\Users\\sahan\\projects\\SystemVerilog\\Schulich-On-Chip-Rkive\\uart microproject\\test\\sim_build\\uart_tx.fst");
    end
    $dumpvars(0, uart_tx);
end
endmodule
