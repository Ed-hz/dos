`timescale 1ns/1ps
module div3_tb();
  reg clk, rst;
  wire clk_out;

  div3 u_div3(.clk(clk), .rst(rst), .clk_out(clk_out));

  initial begin
    clk = 1'b1;
  end
  always #0.5 clk = ~clk;

  initial begin
    rst = 1'b1;
    #0.5;
    rst = 1'b0;
  end
  
endmodule