`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/18 13:31:13
// Design Name: 
// Module Name: counter_1024_tb
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


module counter_1024_tb();
reg clk_1;
reg rst;
reg sc;
wire clk_1024;

    clk_1_to_1024 U1(clk_1,rst,sc,clk_1024);
    
    initial 
        begin
            clk_1 = 0; rst = 1;sc = 0;
        end
    always#1 clk_1 = ~clk_1;
    
    initial
        begin
            #100 rst = 0;
            #100 rst = 1;
            #200 sc = 1;
            #20 sc = 0;
        end
            
endmodule
