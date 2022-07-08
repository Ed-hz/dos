module timer(clk, rst, sc, tl, ts);
  input clk, rst;
  input sc;  // time_begin
  output tl, ts; 

  wire clk, rst;
  wire sc;
  reg tl, ts;

  reg [4:0]t;

  always @(posedge clk, posedge rst) begin
    if(rst)
      t <= 5'b0_0000;
    else
      if(sc)
        t <= 0;
      else
        if(t>=29)
          t <= t;
        else
          t <= t + 1'b1;
  end

  always @(t) begin
    if(t==29)
      tl = 1;
    else
      tl = 0;
  end

  always @(t) begin
    if(t==2)
      ts = 1;
    else
      ts = 0;
  end

endmodule