`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/18 13:56:19
// Design Name: 
// Module Name: FSM_tb
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


module FSM_tb();
reg clk;
reg rst;
reg c;
reg t_30;
reg t_3;
wire sc;
wire [2:0] fl;
wire [2:0] hl;

FSM U1(clk,rst,c,t_30,t_3,sc,fl,hl);

    initial 
        begin
            clk = 0; rst = 1;c = 0; t_30 = 0; t_3 = 0;
        end
    always#1 clk = ~clk;
    
    initial
        begin
            #100 rst = 0;
            #100 rst = 1;//state = 00;
            #25 t_30 = 1;
            #20 c = 1;//state = 01;
            #5 t_30 = 0;
            #30 t_3 = 1;//state = 11;
            #5 t_3 = 0;
            #30 t_30 = 1;//state = 10;
            #5 t_30 = 0;
            #30 t_3 = 1;//state = 00;
            #5 t_3 = 0;
            #20 t_30 = 1;c = 1;//state = 01;
            #5 t_30 = 0;c = 0;
            #30 t_3 = 1;//state = 11; 10
            #3 t_3 = 0;
            #30 t_3 = 1;//state = 00
            #5 t_3 = 0;
        end
endmodule
