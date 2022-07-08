`timescale 1ns/1ps
module shifter();
  // 左/右移位寄存器
  `define LEFT_SHIFT      1'b0
  `define RIGHT_SHIFT     1'b1
  reg [31:0]addr, left_addr, right_addr;
  reg control;

  // 每当新地址出现时就计算右移位和左移位的值
  always @(addr)begin
    // 调用下面定义的具有左右移位功能的函数
    left_addr = shift(addr,  `LEFT_SHIFT);
    right_addr = shift(addr, `RIGHT_SHIFT);
  end

  // 定义移位函数，其输出是一个32位的值
  function [31:0]shift;
    input [31:0]address;
    input control;
    begin
      // 根据控制信号适当地设置输出值
      shift = (control == `LEFT_SHIFT)?(address<<1):(address>>1);
    end
  endfunction

endmodule