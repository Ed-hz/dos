// 使用与非门来构造全加器
module full_adder_2(a_in, b_in, carry_in, sum_out, carry_out);
  input a_in, b_in;
  input carry_in;
  output sum_out;
  output carry_out;

  wire a_in, b_in;
  wire carry_in;
  wire sum_out;
  wire carry_out;

  wire temp0, temp1, temp2;
  assign temp0 = a_in ^ b_in;
  assign sum_out = temp0 ^ carry_in;

  // assign temp1 = a_in & b_in;
  // assign temp2 = a_in & carry_in;
  // assign temp3 = b_in & carry_in;
  // assign carry_out = temp1 || temp2 || temp3;

  assign temp1 = a_in & b_in;
  assign temp2 = temp0 & carry_in;
  assign carry_out = temp1 || temp2;

endmodule