`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/02 11:36:44
// Design Name: 
// Module Name: TOP
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

//this module head used in FPGA
//module TOP(clk_in1p,clk_in1n,rst,c,fl,hl);//,LED_l,LED_h,sel);
//    input clk_in1p,clk_in1n,rst,c;
//    output [2:0] hl;
//    output [2:0] fl;


//this module head used for simulation
module TOP(clk125M,rst,c,fl,hl);
    input clk125M,rst,c;
    output [2:0] hl;    //output [7:0] LED_l;
    output [2:0] fl;    //output [7:0] LED_h;
    //output [7:0] sel;

    
    wire clk,t_30,t_3,sc,fb,flag,clk100M;
    wire [4:0] count;    
    

   // this module only used in FPGA
     clk_wiz_0 inst
  (
  // Clock out ports  
  .clk_out1(clk100M),
 // Clock in ports
  .clk_in1(clk125M)
  );

    FSM U2(.clk(clk100M),.rst(rst),.fb(fb),.flag(flag),.c(c),.t_30(t_30),.t_3(t_3),.sc(sc),.fl(fl),.hl(hl));
    counter U3(.clk100M(clk100M),.rst(rst),.sc(sc),.fb(fb),.flag(flag),.t_30(t_30),.t_3(t_3),.count_o(count));
    //LED U4(.clk(clk_in1),.count(count),.LED_l(LED_l),.LED_h(LED_h),.sel(sel));

endmodule
