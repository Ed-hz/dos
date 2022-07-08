`timescale 1ns/1ps
module mult_tb;
  parameter width = 4;

  reg [width-1:0]a, b;
  wire [2*width-1:0]y;

  mult #(.width(4)) u_mult  (.a(a), .b(b), .y(y));

  initial begin
    a = 0;
    b = 0;
  end

  always #1 a = a + 1;
  always #(1<<width) b = b + 1;

  initial begin
    $monitor("a=%d, b=%d, y=%d", a, b, y);
    #1000;
    $stop;
  end

endmodule
