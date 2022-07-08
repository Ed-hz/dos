`timescale 1ns/1ps
// 显示层次信息
module M();
  initial $display ("Displaying in %m");  // 显示任务中的%m选项无需参数
endmodule

//调用模块M
module top;
  M m1();
  M m2();
  M m3();   

endmodule
