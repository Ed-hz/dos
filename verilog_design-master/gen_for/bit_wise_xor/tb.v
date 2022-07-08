`timescale 1ns/1ps
module tb();
  reg [3:0]a_in, b_in;
  wire [3:0]out;

  bit_wise_xor u0(.a_in(a_in), .b_in(b_in), .out(out));

  initial begin
    a_in = 4'b0000;
    b_in = 4'b0000;
    #300;
    $stop;
  end

  always #1 a_in = a_in + 1'b1;
  always #1 b_in = b_in - 1'b1;

endmodule