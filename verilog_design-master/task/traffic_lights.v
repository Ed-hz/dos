`timescale  1ns/1ps
module traffic_lights();
  reg clk, red, amber, green;
  parameter on = 1, off = 0, red_tics = 350,
            amber_tics = 30, green_tics = 200;
  
  // 交通灯初始化
  initial red = off;
  initial amber = off;
  initial green = off;

  // 交通灯控制时序
  always begin
    red = on;
    light(red, red_tics);
    green = on;
    light(green, green_tics);
    amber = on;
    light(amber, amber_tics);
  end

  // 定义交通灯开启时间的任务
  task light;
    output color;
    input [31:0]tics;

    begin 
      repeat(tics)
        @(posedge clk);    // 等待tics个时钟的上升沿
      color = off;         // 关灯
    end

  endtask

  // 产生时钟脉冲的always块
  always begin
    #100 clk = 0;
    #100 clk = 1;
  end

endmodule