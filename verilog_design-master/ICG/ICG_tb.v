`timescale 1ns/1ps
module ICG_tb();
  reg clk_in, en;
  wire clk_out;

  ICG u_ICG(.clk_in(clk_in), .en(en), .clk_out(clk_out));

  // clk_in
  initial begin
    clk_in = 1'b1;
  end
  always #0.5 clk_in = ~clk_in;

  // en
  initial begin
    en = 1'b0;
    #0.7;
    en = 1'b1;
    #10;
    en = 1'b0;
    #20;
    en = 1'b1;
    
  end

endmodule