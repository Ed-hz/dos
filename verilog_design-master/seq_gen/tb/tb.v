`timescale 1ns / 1ps
module tb;
  reg clk, rst_n;
  wire seq_out;

  seq_gen u0(.clk(clk), .rst_n(rst_n), .seq_out(seq_out));

  initial begin
    clk = 1'b0;
  end
  always #5 clk = ~clk;

  initial begin
    rst_n = 1'b0;
    #10;
    rst_n = 1'b1;
  end
  
endmodule