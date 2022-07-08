module adder(a0, a1, ci, sum, co);
  parameter N = 4;  // 默认总线宽度为4

  // port declaration
  output [N-1 : 0] sum;
  output co;
  input [N-1 : 0] a0, a1;
  input ci;

  // 根据总线的位宽， 调用（实例引用）相应的加法器
  // 参数N在调用（实例引用）时可以重新定义， 调用（实例引用）
  // 不同位宽的加法器是根据不同的N 来决定的
  generate
    case(N)
      // 当N=1 或 2 时分别选用位宽为1位或2位的加法器
      1 : adder_1bit adder1(co, sum, a0, a1, ci);
      2 : adder_2bit adder2(co, sum, a0, a1, ci);
      // 默认情况下选用位宽为N位的超前进位加法器
      default : adder_cla #(N) adder3(co, sum, a0, a1, ci);
    endcase
  endgenerate  // 生成块的结束

endmodule

// 1 bit adder
module adder_1bit(co, sum, a0, a1, ci);
  output co;
  output sum;
  input a0, a1;
  input ci;

  wire co;
  wire sum;
  wire a0, a1, ci;

  assign {co, sum} = a0 + a1 + ci;

endmodule

// 2 bit adder
module adder_2bit(co, sum, a0, a1, ci);
  output [1:0]co;
  output [1:0]sum;
  input [1:0]a0, a1;
  input ci;

  wire temp;

  adder_1bit u0(temp, sum[0], a0, a1, ci);
  adder_1bit u1(co, sum[1], a0, a1, temp);

endmodule

module adder_cla(co, sum, a0, a1, ci);
  parameter N = 4;

  input [N-1:0]a0, a1;
  input ci;
  output [N-1:0]sum;
  output co;

endmodule