module ICG(en, clk_in, clk_out);
  input en;
  input clk_in;
  output clk_out;

  wire en;
  wire clk_in;
  wire clk_out;

  reg Q;
  // latch
  always @ (en, clk_in)begin
    if(!clk_in)
      Q = en;
    else
      Q = Q;
  end

  // output 
  assign clk_out = Q & clk_in;
  
endmodule