module top_tb();
    reg clk_in1,rst,c;
    wire [2:0] fl;
    wire [2:0] hl;
    //wire [7:0] LED_l,LED_h,sel;
    
    TOP U1(clk_in1,rst,c,fl,hl);//,LED_l,LED_h,sel);

    initial 
        begin
            clk_in1 = 0; rst = 1;c = 0;
        end
    always#2.5 clk_in1 = ~clk_in1;

    initial
        begin
            #50 rst = 0;
            #50 rst = 1;
            #50  c=1;
            #15000 c = 0;
            #5000 c = 1;
            #3600 c = 0;
            //total run 3.5us
        end

endmodule
