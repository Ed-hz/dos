`timescale 1ns/1ps
module adder_64_tb();
  reg clk, rst_n;
  reg [63:0]a_in, b_in;
  reg carry_in;
  wire [63:0]sum_out;
  wire carry_out;

  adder_64 u_adder_64(.clk(clk), .rst_n(rst_n), .a_in(a_in), .b_in(b_in), .carry_in(carry_in), .sum_out(sum_out), .carry_out(carry_out));

  initial begin
    clk = 1'b1;
  end
  always #0.5 clk = ~clk;

  // rst_n
  initial begin
    rst_n = 1'b0;
    #0.5;
    rst_n = 1'b1;
  end

  // a_in, b_in, carry_in
  initial begin
    a_in = 64'b0000000000000000_1111111100000000_1111111111111111_0000000011111111;
    b_in = 64'b0000000000000000_0000000011111111_0000000000000000_1111111100000000;
    carry_in = 1'b0;
    #30.5;
    a_in = 64'b1111111111111111_1111111111111111_1111111111111111_1111111111111111;
    b_in = 64'b0000000000000000_0000000000000000_0000000000000000_0000000000000000;
    carry_in = 1'b0;
    #30;
    a_in = 64'b1111111111111111_1111111111111111_1111111111111111_1111111111111111;
    b_in = 64'b0000000000000000_0000000000000000_0000000000000000_0000000000000000;
    carry_in = 1'b1;
  end
  

endmodule