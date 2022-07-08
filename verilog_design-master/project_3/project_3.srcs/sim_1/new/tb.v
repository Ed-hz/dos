`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/17 01:49:51
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb(

    );
    reg rst_n, wr_n;
    reg [3:0]data_in;
    wire [3:0]data_out;
    
    lat u0(.rst_n(rst_n), .data_in(data_in), .wr_n(wr_n), .data_out(data_out));
    
    initial begin
      rst_n = 1'b0;
      wr_n = 1'b1;
      data_in = 4'b1111;
      #1000;
      rst_n = 1'b1;
      #5;
      wr_n = 1'b0;
      data_in = 4'b1010;
      #5;
      wr_n = 1'b1;
      #5;
      data_in = 4'b0011;
    end
    
endmodule
