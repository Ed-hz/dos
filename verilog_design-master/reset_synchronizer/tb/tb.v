`timescale 1ns/1ps
module tb;
  reg clk;
  reg async_reset_n;
  wire sync_reset_n;

  reset_synchronizer u0 (.clk(clk), .async_reset_n(async_reset_n), .sync_reset_n(sync_reset_n));

  initial begin
      clk = 1'b0;
  end
  always #5 clk = ~clk;

  initial begin
      async_reset_n = 1'b0;
      #10;
      async_reset_n = 1'b1;
      #70;
      async_reset_n = 1'b0;
      #10;
      async_reset_n = 1'b1;
      #100;
      $stop;
  end

endmodule