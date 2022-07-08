`timescale 1ns/1ps
module traffic_light (
  clk_125M, rst, c, HL, FL, 
);
  input clk_125M, rst;
  input c;
  output [2:0]HL, FL;

  wire clk_125M, rst;
  wire c;
  wire [2:0]HL, FL;

  wire tl, ts;
  wire sc, fb;
  wire clk;
  div_clk  u_div_clk (
      .clk_125M                ( clk_125M   ),
      .rst                     ( rst        ),

      .clk                     ( clk        )
  );

  FSM  u_FSM (
      .clk                     ( clk_125M        ),
      .rst                     ( rst        ),
      .tl                      ( tl         ),
      .ts                      ( ts         ),
      .c                       ( c          ),
      .fb                      ( fb         ),

      .FL                      ( FL   [2:0] ),
      .HL                      ( HL   [2:0] ),
      .sc                      ( sc         )
  );

  timer  u_timer (
      .clk                     ( clk   ),
      .rst                     ( rst   ),
      .sc                      ( sc    ),

      .tl                      ( tl    ),
      .ts                      ( ts    ),
      .fb                      ( fb    )
  );
  
endmodule