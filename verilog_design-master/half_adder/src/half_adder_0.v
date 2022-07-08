// 直接使用综合工具中的加法器，使用+号
module half_adder_0(a_in, b_in, sum_out, carry_out);
  input a_in, b_in;
  output sum_out, carry_out;

  wire a_in, b_in;
  wire sum_out, carry_out;

  assign {carry_out, sum_out} = a_in + b_in;

endmodule
