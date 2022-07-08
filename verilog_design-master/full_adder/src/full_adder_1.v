// 使用半加器来构造全加器
module full_adder_1(a_in, b_in, carry_in, sum_out, carry_out);
  input a_in, b_in;
  input carry_in;
  output sum_out;
  output carry_out;

  wire a_in, b_in;
  wire carry_in;
  wire sum_out;
  wire carry_out;
  
  wire temp0, temp1, temp2;
  half_adder u0(.a_in(a_in), .b_in(b_in), .sum_out(temp0), .carry_out(temp1));
  half_adder u1(.a_in(temp0), .b_in(carry_in), .sum_out(sum_out), .carry_out(temp2));

  assign carry_out = temp1 || temp2;

endmodule

// 半加器
module half_adder(a_in, b_in, sum_out, carry_out);
  input a_in, b_in;
  output sum_out, carry_out;

  wire a_in, b_in;
  wire sum_out, carry_out;

  assign {carry_out, sum_out} = a_in + b_in;

endmodule
