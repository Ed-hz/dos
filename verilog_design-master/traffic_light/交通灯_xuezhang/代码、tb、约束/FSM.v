module FSM(clk,rst,fb,flag,c,t_30,t_3,sc,fl,hl);
    input clk;
    input rst;
    input fb;
    input c; //means there's a car waitting to pass in low speed road
    input t_30;
    input t_3;
    output reg sc;
    output reg [2:0] fl;//3 lights in low speed road ,FL[2]:red,FL[1]:yellow,FL[0]:green
    output reg [2:0] hl;//3 lights in hign speed road ,HL[2]:red,HL[1]:yellow,HL[0]:green
    output reg flag;
    reg [1:0] state,ns; //gray code
    reg flag_next;



    always@(c or state or t_30 or t_3) //ns means geneorate next state    
        case(state)
            2'b00:  if(t_30 & c)                       
                        ns = 2'b01;                        
                    else                        
                        ns = 2'b00;                        
            2'b01:  if(t_3)                       
                        ns = 2'b11;                     
                    else                        
                        ns = 2'b01;                      
            2'b11:  if(t_30 | (~c))                       
                        ns = 2'b10;                       
                    else                        
                        ns = 2'b11;                       
            2'b10:  if(t_3)                       
                        ns = 2'b00;                       
                    else                        
                        ns = 2'b10;                       
          endcase
    

    always@(posedge clk or negedge rst)
    begin
        if(!rst)
            state <= 2'b00;
        else
            state <= ns;
    end
    
    always@(state)
    case(state)
    2'b00:begin 
         fl = 3'b100;
         hl = 3'b001;
       end
    2'b01:begin
         fl = 3'b010;
         hl = 3'b001;
       end
    2'b11:begin
         fl = 3'b001;
         hl = 3'b100;
       end
    2'b10:begin
         fl = 3'b001;
         hl = 3'b010;
       end
    endcase
   
    always@(ns or state) //ns means geneorate count-start signal
        if(state == ns)
            sc = 0;
        else 
            sc = 1;
            
    always@(fb or sc or flag)
        if(fb)
            flag_next = 0;
        else
            if(sc)
                flag_next = 1;
            else
                flag_next = flag;     
                       
    always@(posedge clk or negedge rst)
        if(!rst)
            flag <= 0;
        else
            flag <= flag_next;
            


endmodule