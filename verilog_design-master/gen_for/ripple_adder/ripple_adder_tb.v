`timescale 1ns/1ps
module ripple_adder_tb();

  reg [3:0]a_in, b_in;
  reg carry_in;
  wire [3:0]sum_out;
  wire carry_out;

  ripple_adder u0(.a_in(a_in), .b_in(b_in), .carry_in(carry_in), .sum_out(sum_out), .carry_out(carry_out));

  initial begin
    a_in = 4'b0000;
    b_in = 4'b0000;
    carry_in = 1'b0;
  end

  always #1 a_in = a_in + 1'b1;
  always #(1<<4) b_in = b_in + 1'b1;
  always #((1<<4)*(1<<4)) carry_in = carry_in + 1'b1;

  initial begin
    #1000;
    $stop;
  end

endmodule