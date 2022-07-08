module timer(clk, rst, sc, tl, ts, fb);
  input clk, rst;
  input sc;  // time_begin
  output tl, ts; 
  output fb;

  wire clk, rst;
  wire sc;
  reg tl, ts;
  reg fb;


  reg [4:0]t;
  reg [4:0]t_next;
  always @(posedge clk, posedge rst) begin
    if(rst)
      t <= 0;
    else
      t <= t_next;
  end
  always @(t or sc)begin
    if(sc)
      t_next = 0;
    else
      if(t>=29)
        t_next = t;
      else
        t_next = t + 1'b1;
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

  always @(posedge clk, posedge rst)begin
    if(rst)
      fb <= 0;
    else
      fb <= sc;
  end

endmodule