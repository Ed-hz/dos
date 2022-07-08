`timescale  1ns/1ps
module full_adder_tb();
  integer score = 0;

  reg a_in, b_in;
  reg carry_in;
  wire sum_out;
  wire carry_out;

  full_adder_2 u0(.a_in(a_in), .b_in(b_in), .carry_in(carry_in), .sum_out(sum_out), .carry_out(carry_out));

  initial begin
    a_in = 1'b0; b_in = 1'b0; carry_in = 1'b0;
    #10;
    a_in = 1'b0; b_in = 1'b0; carry_in = 1'b1;
    #10;
    a_in = 1'b0; b_in = 1'b1; carry_in = 1'b0;
    #10;
    a_in = 1'b0; b_in = 1'b1; carry_in = 1'b1;
    #10;
    a_in = 1'b1; b_in = 1'b0; carry_in = 1'b0;
    #10;
    a_in = 1'b1; b_in = 1'b0; carry_in = 1'b1;
    #10;
    a_in = 1'b1; b_in = 1'b1; carry_in = 1'b0;
    #10;
    a_in = 1'b1; b_in = 1'b1; carry_in = 1'b1;
  end

  initial begin
    #5;
    if (sum_out == 1'b0 && carry_out == 1'b0)
      score = score + 1;
    else
      $display ("\ta_in=%b, b_in=%b, carry_in=%b, sum_out=%b, carry_out=%b\n", a_in, b_in, carry_in, sum_out, carry_out);
    #10;
    if (sum_out == 1'b1 && carry_out == 1'b0)
      score = score + 1;
    else
      $display ("\ta_in=%b, b_in=%b, carry_in=%b, sum_out=%b, carry_out=%b\n", a_in, b_in, carry_in, sum_out, carry_out);
    #10;
    if (sum_out == 1'b1 && carry_out == 1'b0)
      score = score + 1;
    else
      $display ("\ta_in=%b, b_in=%b, carry_in=%b, sum_out=%b, carry_out=%b\n", a_in, b_in, carry_in, sum_out, carry_out);
    #10;
    if (sum_out == 1'b0 && carry_out == 1'b1)
      score = score + 1;
    else
      $display ("\ta_in=%b, b_in=%b, carry_in=%b, sum_out=%b, carry_out=%b\n", a_in, b_in, carry_in, sum_out, carry_out);
    #10;
    if (sum_out == 1'b1 && carry_out == 1'b0)
      score = score + 1;
    else
      $display ("\ta_in=%b, b_in=%b, carry_in=%b, sum_out=%b, carry_out=%b\n", a_in, b_in, carry_in, sum_out, carry_out);
    #10;
    if (sum_out == 1'b0 && carry_out == 1'b1)
      score = score + 1;
    else
      $display ("\ta_in=%b, b_in=%b, carry_in=%b, sum_out=%b, carry_out=%b\n", a_in, b_in, carry_in, sum_out, carry_out);
    #10;
    if (sum_out == 1'b0 && carry_out == 1'b1)
      score = score + 1;
    else
      $display ("\ta_in=%b, b_in=%b, carry_in=%b, sum_out=%b, carry_out=%b\n", a_in, b_in, carry_in, sum_out, carry_out);
    #10;
    if (sum_out == 1'b1 && carry_out == 1'b1)
      score = score + 1;
    else
      $display ("\ta_in=%b, b_in=%b, carry_in=%b, sum_out=%b, carry_out=%b\n", a_in, b_in, carry_in, sum_out, carry_out);
    #10;
    if (score == 8)
      $display ("\t TEST PASSED\n");
    else
      $display ("\t TEST FAILED\n");
    #10;
    $finish;
  end
  
endmodule