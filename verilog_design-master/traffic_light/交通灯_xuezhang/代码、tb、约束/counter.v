//if the state was changed, the counter must restart and count simoutaneously
module counter(clk100M,rst,sc,flag,fb,t_30,t_3,count_o);
    input clk100M;
    input rst;
    input sc;
    input flag;
    output reg fb;
    output t_30;//count to 30
    output t_3; //count to 3
    output [4:0] count_o;
    wire clk;
    
    clk100M_1S U1(.clk100M(clk100M),.rst(rst),.sc(sc),.clk1S(clk));//used in FPGA
//    clk_1_to_96 U1(.clk_1(clk100M),.rst(rst),.clk_96(clk));//used to simulation
    reg [4:0] number;
    reg [4:0] count_o;
    wire fb_next;


    always@(flag or t_30 or count_o)
     if(flag)
        number = 5'b00000;
     else 
        if(t_30)
          number = 5'b11110;
        else
          number = count_o + 1'b1;

    always@(posedge clk or negedge rst)
    begin
      if(!rst)
        count_o <= 5'b00000;
      else
        count_o <= number;
    end

    assign t_30 = (count_o == 5'b11110)?1:0;
    assign t_3 = (count_o == 5'b00011)?1:0;
    
    assign fb_next = (flag)?1:0;
    
    always@(posedge clk or negedge rst)
        if(!rst)
            fb <= 0;
        else
            fb <= fb_next;

endmodule


