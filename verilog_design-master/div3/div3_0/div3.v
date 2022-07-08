module div3(clk, rst, clk_out);
  input clk, rst;
  output clk_out;

  wire clk, rst;
  wire clk_out;
  reg [1:0]Q;

  always @ (posedge clk, posedge rst)begin
    if(rst)
      Q = 2'b00;
    else
      if(Q[1]==1'b1)
        Q = 2'b00;
      else
        Q = Q + 1'b1;
  end

  assign clk_out = Q[1];
    
endmodule