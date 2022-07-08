// 循环生成语句
// 两条N位总线按位异或

module bit_wise_xor (
  a_in, b_in, out
);
  parameter N = 4;
  input [N-1:0]a_in, b_in;
  output [N-1:0] out;

  wire [N-1:0]a_in, b_in;
  wire [N-1:0]out;

  genvar i;  // 该变量只能用在生成块中
  generate
    for (i=0; i<N; i=i+1)
      begin : xor_loop
        xor (out[i], a_in[i], b_in[i]);  // 生成块的本质是使用循环内的一条语句代替多条重复的Verilog语句
      end
  endgenerate
  
endmodule