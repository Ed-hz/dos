`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/18 13:39:58
// Design Name: 
// Module Name: counter_all_tb
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


module counter_all_tb();//220ms
reg clk100M;
reg rst;
reg sc;
wire t_30;
wire t_3;
wire [4:0] count_o;

counter U(clk100M,rst,sc,t_30,t_3,count_o);

    initial 
        begin
            clk100M = 0; rst = 1;sc = 0;
        end
    always#1 clk100M = ~clk100M;
    
    initial
        begin
            #100 rst = 0;
            #100 rst = 1;
            #200 sc = 1;
            #20 sc = 0;
            #220000000 sc = 1;
            #200 sc = 0;
        end
        
endmodule
