`timescale 1ns/1ps
module half_adder_tb();
  reg a_in, b_in;
  wire sum_out, carry_out;
  
  integer score=0;

  half_adder_0 u0(.a_in(a_in), .b_in(b_in), .sum_out(sum_out), .carry_out(carry_out));
  // half_adder_1 u0(.a_in(a_in), .b_in(b_in), .sum_out(sum_out), .carry_out(carry_out));
  // half_adder_2 u0(.a_in(a_in), .b_in(b_in), .sum_out(sum_out), .carry_out(carry_out));


  initial begin
    a_in = 1'b0; b_in = 1'b0;
    #5;
    a_in = 1'b0; b_in = 1'b1;
    #5;
    a_in = 1'b1; b_in = 1'b0;
    #5;
    a_in = 1'b1; b_in = 1'b1;
  end

  initial begin
    #1;
    if (sum_out==1'b0 && carry_out==1'b0)
      score = score + 1;
    else
      $display("ERROR: time=%d, a_in=%b, b_in=%b, sum_out=%b, carry_out=%b\n", $time, a_in, b_in, sum_out, carry_out);
    #5;
    if (sum_out==1'b1 && carry_out==1'b0)
      score = score + 1;
    else
      $display("ERROR: time==%d, a_in=%b, b_in=%b, sum_out=%b, carry_out=%b\n", $time, a_in, b_in, sum_out, carry_out);
    #5;
    if (sum_out==1'b1 && carry_out==1'b0)
      score = score + 1;
    else
      $display("ERROR: time==%d, a_in=%b, b_in=%b, sum_out=%b, carry_out=%b\n", $time, a_in, b_in, sum_out, carry_out);
    #5;
    if (sum_out==1'b0 && carry_out==1'b1)
      score = score + 1;
    else
      $display("ERROR: times==%d, a_in=%b, b_in=%b, sum_out=%b, carry_out=%b\n", $time, a_in, b_in, sum_out, carry_out);
    #10;
    $display ("\t score = %d\n", score);
    if (score == 4)
      $display("\tTEST PASSED\n");
    else
      $display("\tTESE FAILED\n");
  end

  // watch dog
  initial begin
    #1000;
    $display ($time, " TIMEOUT, Terminate Simulation\n");
    $finish;
  end
endmodule