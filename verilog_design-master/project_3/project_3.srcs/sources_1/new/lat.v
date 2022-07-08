`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/17 01:47:37
// Design Name: 
// Module Name: lat
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


module lat(wr_n, data_in, data_out, rst_n

    );
    input wr_n;
    input [3:0]data_in;
    input rst_n;
    output [3:0]data_out;
    
    reg [3:0]data_out;
    always @(wr_n, rst_n)begin
      if(rst_n == 1'b0)
        data_out = 4'b0000;
      else
        if(wr_n == 1'b0)
          data_out = data_in;
    end
    
endmodule
