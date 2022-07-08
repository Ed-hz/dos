module multiplier(product, a0, a1);
  parameter a0_width = 8;
  parameter a1_width = 8;
  localparam product_width = a0_width + a1_width;

  input [a0_width-1:0]a0;
  input [a1_width-1:0]a1;
  output [product_width-1:0]product;

  wire [a0_width-1:0]a;
  wire [a1_width-1:0]a1;
  wire [product_width-1:0]product;

  /* 有条件地调用(实例引用)不同类型的乘法器
      根据参数a0_width 和 a1_width的值，在调用时引用相对应的乘法器举例 */
  generate 
    if(a0_width < 8  || a1_width < 8)
      cal_multiplier #(a0_width, a1_width) m0(product, a0, a1);
    else
      tree_multiplier #(a0_width, a1_width) m1(product, a0, a1);
  endgenerate // 生成块的结束

endmodule

module cal_multiplier(product, a0, a1);

  parameter a0_width = 4;
  parameter a1_width = 4;
  localparam product_width = a0_width + a1_width;

  output [product_width-1:0]product;
  input [a0_width-1:0]a0;
  input [a1_width-1:0]a1;

  wire [a0_width-1:0]a0;
  wire [a1_width-1:0]a1;
  wire [product_width-1:0]product;

endmodule

module tree_multiplier(product, a0, a1);

  parameter a0_width = 8;
  parameter a1_width = 8;
  localparam product_width = a0_width + a1_width;

  input [a0_width-1:0]a0;
  input [a1_width-1:0]a1;
  output [product_width-1:0]product;

  wire [a0_width-1:0]a0;
  wire [a1_width-1:0]a1;

endmodule