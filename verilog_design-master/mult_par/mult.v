module mult(a, b, y);
  parameter width = 4;

  input [width-1:0]a, b;
  output [2*width-1:0]y;
  wire [width-1:0]a, b;
  wire [2*width-1:0]y;

  wire [width-1:0]temp1[width-1:0];
  genvar i, j;
  generate
    for(i=0; i<width; i=i+1)
      for(j=0; j<width; j=j+1)
        assign temp1[i][j] = a[i] & b[j];
  endgenerate

  reg [width:0]temp2[width-1:0];
  always @(temp1)begin : add_part
    integer i;
    for(i=0; i<width; i=i+1)
      if(i == 0)
        temp2[i] = temp1[i];
      else
        temp2[i] = temp2[i-1][width:1] + temp1[i];
  end

  generate
    for(i=0; i<width; i=i+1)
      if(i<width-1)
        assign y[i] = temp2[i][0];
      else
        assign y[2*width-1:width-1] = temp2[i];
  endgenerate

endmodule