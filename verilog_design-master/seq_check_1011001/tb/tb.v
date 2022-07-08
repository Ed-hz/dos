`timescale 1ns/1ps
module tb;
  reg clk, rst_n;
  reg [1:0]data_in;
  wire flag_out;

  seq_check u0(.clk(clk), .rst_n(rst_n), .data_in(data_in), .flag_out(flag_out));

  initial begin
    clk = 1'b1;
    rst_n = 1'b0;
    #1000;
    rst_n = 1'b1;
  end
  always #5 clk = ~clk;

  initial begin
    data_in <= 2'b00;
    #1000;
    #10;
    data_in <= 2'b10;
    #10;
    data_in <= 2'b11;
    #10;
    data_in <= 2'b00;
    #10;
    data_in <= 2'b11;
    #10;
    data_in <= 2'b10;
    #10;
    data_in <= 2'b11;
    #10;
    data_in <= 2'b00;
    #10;
    data_in <= 2'b10;
    #10;
    data_in <= 2'b11;
    #10;
    data_in <= 2'b00;
    #10;
    data_in <= 2'b11;
    #10;
    repeat (100) begin data_in = $random; #10; end
    $stop;
  end
  
endmodule