// 使用门级符号
module half_adder_1(a_in, b_in, sum_out, carry_out);
  input a_in, b_in;
  output sum_out, carry_out;

  wire a_in, b_in;
  wire sum_out, carry_out;

  assign sum_out = a_in ^ b_in;
  assign carry_out = a_in & b_in;

endmodule