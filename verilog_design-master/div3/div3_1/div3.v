module div3 (
  clk, rst, clk_out
);
  input clk, rst;
  output clk_out;

  wire clk, rst;
  reg clk_out;

  reg Q;

  // clk_out  register output
  always @ (posedge clk, posedge rst)
    if(rst)
      clk_out <= 0;
    else
      clk_out <= Q;

  // Q 
  always @ (posedge clk, posedge rst)begin
    if(rst)
      Q <= 0;
    else 
      if(clk_out == 1)
        Q <= 0;
      else
        Q <= Q + 1;
  end

endmodule