`timescale 1ns/1ps

module traffic_light_tb;
  reg clk_125M, rst;
  reg c;
  wire [2:0]HL, FL;

  traffic_light  u_traffic_light (
      .clk_125M                ( clk_125M        ),
      .rst                     ( rst             ),
      .c                       ( c               ),

      .HL                      ( HL        [2:0] ),
      .FL                      ( FL        [2:0] )
  );

  initial begin
    clk_125M = 1'b1;
  end

  always #4 clk_125M = ~clk_125M;

  initial begin
    rst = 1'b1;
    #0.5;
    rst = 1'b0;
  end

  initial begin
    c = 0;
    #(10*8*125*100);
    c = 1;
    #(10*8*125*100);
    c = 0;
    #(12.5*8*125*100);
    c = 1;
    #(3*8*125*100);
    #(33*8*125*100);
    c = 0;
    #(3*8*125*100);
    #(40*8*125*100);
    c = 1;
    #(3*8*125*100);
    #(10*8*125*100);
    c = 0;

    #(10*8*125*100);
    $stop;

  end

endmodule