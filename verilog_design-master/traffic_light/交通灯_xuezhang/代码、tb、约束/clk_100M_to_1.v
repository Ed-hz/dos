module clk100M_1S(clk100M,rst,sc,clk1S);
input clk100M;
input rst;
input sc;
output clk1S;

wire clk100K,clk100;

    clk_1_to_1K U1(.clk_1(clk100M),.rst(rst),.sc(sc),.clk_1024(clk100K));
    clk_1K_to_1M U2(.clk_1(clk100K),.rst(rst),.clk_1024(clk100));
    clk_1_to_96 U3(.clk_1(clk100),.rst(rst),.clk_96(clk1S));


endmodule

module clk_1_to_96(clk_1,rst,clk_96);
input clk_1;
input rst;
output clk_96;

reg [6:0] counter;
reg [6:0] next_count;

    always@(*)
        next_count = counter + 1'b1;

    always@(posedge clk_1 or negedge rst)
    begin
      if(!rst)
        counter <= 7'b0;
      else
        if(clk_96)
          counter <= 7'b0;
        else
          counter <= next_count;
    end

    assign clk_96 = (counter==7'b1100000)?1'b1:1'b0;

endmodule

module clk_1_to_1K(clk_1,rst,sc,clk_1024);//count clk 1024
input clk_1;
input rst;
input sc;
output clk_1024;

reg [9:0] counter;
reg [9:0] next_count;
    
    always@(sc or counter)
        if(sc)
            next_count = 10'b0;
         else
            next_count = counter + 1'b1;
    
    always@(posedge clk_1 or negedge rst)
        if(!rst)
            counter <= 0;
        else
            counter <= next_count;
            
    assign clk_1024 = counter[9];
    
endmodule


module clk_1K_to_1M(clk_1,rst,clk_1024);//count clk 1024
input clk_1;
input rst;
output clk_1024;

reg [9:0] counter;
reg [9:0] next_count;
    
    always@(counter)
        next_count = counter + 1'b1;
    
    always@(posedge clk_1 or negedge rst)
        if(!rst)
            counter <= 0;
        else
            counter <= next_count;
            
    assign clk_1024 = counter[9];
    
endmodule