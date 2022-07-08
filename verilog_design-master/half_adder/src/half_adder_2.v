// 使用门级原语
module half_adder_2(a_in, b_in, sum_out, carry_out);
  input a_in, b_in;
  output sum_out, carry_out;

  wire a_in, b_in;
  wire sum_out, carry_out;

  xor (sum_out, a_in, b_in);
  and (carry_out, a_in, b_in);
  
endmodule