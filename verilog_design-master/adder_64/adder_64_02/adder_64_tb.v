`timescale 1ns/1ps
module adder_64_tb();
  reg clk, rst_n;
  reg [63:0]a_in, b_in;
  reg carry_in;
  reg din_en;
  wire [63:0]sum_out;
  wire carry_out;
  wire dout_en;

  adder_64 u_adder_64(.clk(clk), .rst_n(rst_n), .a_in(a_in), .b_in(b_in), .carry_in(carry_in), .din_en(din_en), .sum_out(sum_out), .carry_out(carry_out), .dout_en(dout_en));

  //clk
  initial begin
    clk = 1'b1;
  end
  always #0.5 clk = ~clk;

  //rst_n
  initial begin
    rst_n = 1'b0;
    #0.5;
    rst_n = 1'b1;
  end

  // input
  initial begin
    a_in = 64'h0000_0000_0000_0000;
    b_in = 64'h0000_0000_0000_0000;
    carry_in = 1'b0;
    din_en = 1'b0;
    #0.5;
    a_in = 64'b0111111111111111_0000000000000000_1111111111111111_0000000000000000;
    b_in = 64'h0000_ffff_0000_ffff;
    carry_in = 1'b1;
    din_en = 1'b1;
    #1;
    din_en = 1'b0;
    #3;
    din_en = 1'b1;
    a_in = 64'hffff_ffff_0000_0000;
    b_in = 64'h0000_0000_ffff_ffff;
    carry_in = 1'b0;
    #1;
    din_en = 1'b0;
  end

endmodule