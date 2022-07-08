module ripple_adder
 #(parameter N=4)
(a_in, b_in, carry_in, sum_out, carry_out);
  input [N-1:0] a_in, b_in;
  input carry_in;
  output [N-1:0]sum_out;
  output carry_out;

  wire [N-1:0]a_in, b_in;
  wire carry_in;
  wire [N-1:0]sum_out;
  wire carry_out;

  wire [N:0]carry;
  assign carry[0] = carry_in;

  genvar i;
  generate
    for (i=0; i<N; i=i+1)
      begin : add_loop
        wire temp1, temp2, temp3;
        // sum_out = a ^ b ^ ci
        xor (temp1, a_in[i], b_in[i]);
        xor (sum_out[i], carry[i], temp1);
        // carry_out = a&b | b&ci | a&ci
        and  (temp2, a_in[i], b_in[i]);
        and  (temp3, temp1, carry[i]);
        or   (carry[i+1], temp2, temp3);
      end
  endgenerate

  assign carry_out = carry[N];

endmodule