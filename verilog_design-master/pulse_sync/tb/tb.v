`timescale 1ns/1ps
module tb;

  localparam PERIOD_FAST = 1;
  localparam PERIOD_SLOW = 5;

  reg clk_fast, clk_slow, rst_n;
  reg pulse_fast;
  wire pulse_slow;

  pulse_sync u0(.clk_fast(clk_fast), .clk_slow(clk_slow), .rst_n(rst_n), .pulse_fast(pulse_fast), .pulse_slow(pulse_slow));

  initial begin
    clk_fast = 1'b1;
    clk_slow = 1'b1;
    rst_n = 1'b0;
    #(PERIOD_SLOW);
    rst_n = 1'b1;
  end
  always #(0.5*PERIOD_FAST) clk_fast = ~clk_fast;
  always #(0.5*PERIOD_SLOW) clk_slow = ~clk_slow;

  initial begin
    pulse_fast = 1'b0;
    #(5*PERIOD_FAST);
    pulse_fast <= 1'b1;
    #(PERIOD_FAST);
    pulse_fast <= 1'b0;
    #(40*PERIOD_FAST);
    pulse_fast <= 1'b1;
    #(PERIOD_FAST);
    pulse_fast <= 1'b0;
  end

endmodule