// 快时钟域的一个脉冲同步到慢时钟域
module pulse_sync(clk_slow, clk_fast, rst_n, pulse_fast, pulse_slow);
  input clk_slow, clk_fast, rst_n;
  input pulse_fast;
  output pulse_slow;

  reg pulse_slow;

  // 先把在快时钟域的一个脉冲展宽，确保其在满时钟域能够接收到
  reg pulse_fast_wide;
  always @(posedge clk_fast, negedge rst_n)begin
    if(!rst_n)
      pulse_fast_wide <= 1'b0;
    else
      if(pulse_fast)
        pulse_fast_wide <= ~pulse_fast_wide;
  end

  // 在慢时钟域打拍
  reg pulse_fast_wide_sync1;
  reg pulse_fast_wide_sync2;
  reg pulse_fast_wide_sync3;
  always @(posedge clk_slow, negedge rst_n)begin
    if(!rst_n)
      begin
        pulse_fast_wide_sync1 <= 1'b0;
        pulse_fast_wide_sync2 <= 1'b0;
        pulse_fast_wide_sync3 <= 1'b0;
      end
    else
      begin
        pulse_fast_wide_sync1 <= pulse_fast_wide;  // 第一拍的亚稳态的概率比较大
        pulse_fast_wide_sync2 <= pulse_fast_wide_sync1;
        pulse_fast_wide_sync3 <= pulse_fast_wide_sync2;
      end
  end

  // 进行边沿检测, 采用寄存器输出
  always @(posedge clk_slow, negedge rst_n)begin
    if(!rst_n)
      pulse_slow <= 1'b0;
    else
      if(pulse_fast_wide_sync2 != pulse_fast_wide_sync3)
        pulse_slow <= 1'b1;
      else
        pulse_slow <= 1'b0;
  end
      
endmodule