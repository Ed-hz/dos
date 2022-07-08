// 直接使用加号
module full_adder_0(a_in, b_in, carry_in, sum_out, carry_out);
  input a_in, b_in;
  input carry_in;
  output sum_out;
  output carry_out;

  wire a_in, b_in;
  wire carry_in;
  wire sum_out;
  wire carry_out;

  assign {carry_out, sum_out} = a_in + b_in + carry_in;
  
endmodule