// 125M clk -> 1s clk
module div_clk(clk_125M, rst, clk);
  input clk_125M, rst;
  output clk;

  wire clk_125M, rst;
  wire clk;

  wire clk100_1, clk100_2, clk100_3;
  div100 u_div100_1(.clk(clk_125M), .rst(rst), .en(1), .clk100(clk100_1));
  div100 u_div100_2(.clk(clk_125M), .rst(rst), .en(clk100_1), .clk100(clk100_2));
  div100 u_div100_3(.clk(clk_125M), .rst(rst), .en(clk100_2), .clk100(clk100_3));
  div125 u_div125(.clk(clk_125M), .rst(rst), .en(clk100_3), .clk125(clk));


endmodule

module div125(clk, rst, en, clk125);
  input clk, rst;
  input en;
  output clk125;

  wire clk, rst;
  wire en;
  reg clk125;

  reg [6:0]count,count_next;

  always @(posedge clk, posedge rst) begin
    if(rst)
      count <= 0;
    else
      count <= count_next;
  end
  always@(count, en)begin
    if(en)
      if(count==124)
        count_next = 0;
      else
        count_next = count + 1'b1;
    else
      count_next = count;
  end

  always@(posedge clk, posedge rst)begin
    if(rst)
      clk125 <= 0;
    else
      if((count == 124) && (count_next == 0))
        clk125 <= 1'b1;
      else
        clk125 <= 1'b0;
  end
endmodule

module div100(clk, rst, en, clk100);
  input clk, rst;
  input en;
  output clk100;

  wire clk, rst;
  wire en;
  reg clk100;

  reg [6:0]count,count_next;

  always @(posedge clk, posedge rst) begin
    if(rst)
      count <= 0;
    else
      count <= count_next;
  end
  always@(count, en)begin
    if(en)
      if(count==99)
        count_next = 0;
      else
        count_next = count + 1'b1;
    else
      count_next = count;
  end

  always@(posedge clk, posedge rst)begin
    if(rst)
      clk100 <= 0;
    else
      if((count == 99) && (count_next == 0))
        clk100 <= 1'b1;
      else
        clk100 <= 1'b0;
  end
endmodule