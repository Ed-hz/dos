`timescale 1ns/1ps
module disp;
  reg [31:0]rval;
  pulldown(pd);
  initial begin
    #10;
    rval = 101;
    $display ("rval=%h hex %d decimal", rval, rval);        // 分别以十六进制和十进制格式输出rval
    $display ("rval=%o otal %b binary", rval, rval);        // 分别以八进制和二进制格式输出rval
    $display ("rval has %c ascii character value", rval);   // 以ASCII字符形式输出rval
    $display ("pd strength value is %v", pd);               // 显示pd的强度
    $display ("current scope is %m");                       // 显示当前所在的scope
    $display ("%s is ascii value for 101", 101);            // 显示101所代表的字符串
    $display ("simulation time is %t", $time);              // 显示当前的仿真时间
  end

endmodule