`timescale 1ns/1ps
module test;
  reg [7:0]memory[0:7];    // 声明有8个8位的存储单元
  integer i;

  initial begin
    // 读取存储器文件init.dat到存储器的给定地址
    $readmemb("init.dat", memory);
    // 显示初始化后的存储器内容
    for(i=0; i<8; i=i+1)
      $display("Memory[%0d]=%b",i, memory[i]);
    #1000;
    $finish(2);  // $finish(n)括号里面带个数字表示会输出一些特征信息，比如仿真时刻，cpu占用时间，一般为0，1，2，数字越大，信息越丰富
  end

endmodule