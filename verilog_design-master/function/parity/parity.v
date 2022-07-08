`timescale 1ns/1ps
module parity;
  reg [31:0]addr;
  reg parity;
  initial begin
    addr = 32'h3456_789a;
    #10 addr = 32'hc4c6_78ff;
    #10 addr = 32'hff56_ff9a;
    #10 addr = 32'h3faa_aaaa;
  end

  // 每当地址发生变化， 计算新的偶校验位
  always @(addr)begin
    parity = calc_parity(addr);  // 第一次启动校验位计算函数 cal_parity
    $display("Parity calculated = %b", calc_parity(addr));  // 第二次启动校验位计算函数calc_parity
  end

  // 定义偶校验计算函数
  // 偶校验，如果1的个数是奇数的话，结果为1
  function calc_parity;  // 如果没说位数，默认返回为1bit
    input [31:0]address;
    begin
      // 适当地设置输出值， 使用隐含的内部寄存器 calc_parity
      calc_parity = ^address;  // 返回所有地址位的异或值
    end
  endfunction

endmodule