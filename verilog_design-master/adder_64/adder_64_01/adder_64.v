module adder_64 (
  clk, rst_n, a_in, b_in, carry_in, sum_out, carry_out
);
  input clk, rst_n;
  input [63:0]a_in, b_in;
  input carry_in;
  output [63:0]sum_out;
  output carry_out;

  wire clk, rst_n;
  wire [63:0]a_in, b_in;
  wire carry_in;
  wire [63:0]sum_out;
  wire carry_out;

  // register input
  reg [47:0]a_in_reg0, b_in_reg0;
  reg [31:0]a_in_reg1, b_in_reg1;
  reg [15:0]a_in_reg2, b_in_reg2;

  wire [15:0]sum0, sum1, sum2, sum3;
  wire carry_out0, carry_out1, carry_out2, carry_out3;

  // register sum
  reg [15:0]sum0_reg0, sum0_reg1, sum0_reg2, sum0_reg3;
  reg carry_out0_reg;
  reg [15:0] sum1_reg0, sum1_reg1, sum1_reg2;
  reg carry_out1_reg;
  reg [15:0]sum2_reg0, sum2_reg1;
  reg carry_out2_reg;
  reg [15:0]sum3_reg0;
  reg carry_out3_reg;

  //clk 0
  adder_16 u0(.a_in(a_in[15:0]), .b_in(b_in[15:0]), .carry_in(carry_in), .sum_out(sum0), .carry_out(carry_out0));
  adder_16 u1(.a_in(a_in_reg0[15:0]), .b_in(b_in_reg0[15:0]), .carry_in(carry_out0_reg), .sum_out(sum1), .carry_out(carry_out1));
  adder_16 u2(.a_in(a_in_reg1[15:0]), .b_in(b_in_reg1[15:0]), .carry_in(carry_out1_reg), .sum_out(sum2), .carry_out(carry_out2));
  adder_16 u3(.a_in(a_in_reg2[15:0]), .b_in(b_in_reg2[15:0]), .carry_in(carry_out2_reg), .sum_out(sum3), .carry_out(carry_out3));

  // register input 
  always @(posedge clk, negedge rst_n) begin
    if(!rst_n)
      begin
        a_in_reg0 <= 0;
        a_in_reg1 <= 0;
        a_in_reg2 <= 0;
        b_in_reg0 <= 0;
        b_in_reg1 <= 0;
        b_in_reg2 <= 0;
      end
    else
      begin
        a_in_reg0 <= a_in[63:16];
        a_in_reg1 <= a_in_reg0[47:16];
        a_in_reg2 <= a_in_reg1[31:16];
        b_in_reg0 <= b_in[63:16];
        b_in_reg1 <= b_in_reg0[47:16];
        b_in_reg2 <= b_in_reg1[31:16];
      end
  end
  
  // register sum0 carry_out0
  always @(posedge clk, negedge rst_n)begin
    if(!rst_n)
      begin
        sum0_reg0 <= 0;
        sum0_reg1 <= 0;
        sum0_reg2 <= 0;
        sum0_reg3 <= 0;
      end
    else
      begin
        sum0_reg0 <= sum0;
        sum0_reg1 <= sum0_reg0;
        sum0_reg2 <= sum0_reg1;
        sum0_reg3 <= sum0_reg2;
      end
  end
  always @(posedge clk, negedge rst_n)begin
    if(!rst_n)
      carry_out0_reg <= 0;
    else
      carry_out0_reg <= carry_out0;
  end

  // register sum1, carry_out1
  always @(posedge clk, negedge rst_n) begin
    if(!rst_n)
      begin
        sum1_reg0 <= 0;
        sum1_reg1 <= 0;
        sum1_reg2 <= 0;
      end
      begin
        sum1_reg0 <= sum1;
        sum1_reg1 <= sum1_reg0;
        sum1_reg2 <= sum1_reg1;
      end
  end
  always @(posedge clk, negedge rst_n)begin
    if(!rst_n)
      carry_out1_reg <= 0;
    else
      carry_out1_reg <= carry_out1;
  end

  // register sum2, carry_out2
  always @(posedge clk, negedge rst_n)begin
    if(!rst_n)
      begin
        sum2_reg0 <= 0;
        sum2_reg1 <= 0;
      end
    else 
      begin
        sum2_reg0 <= sum2;
        sum2_reg1 <= sum2_reg0;
      end
  end
  always @(posedge clk, negedge rst_n)begin
    if(!rst_n)
      carry_out2_reg <= 0;
    else
      carry_out2_reg <= carry_out2;
  end

  // register sum3, carry_out3
  always @(posedge clk, negedge rst_n)begin
    if(!rst_n)
        sum3_reg0 <= 0;
    else
        sum3_reg0 <= sum3;
  end
  always @(posedge clk, negedge rst_n)begin
    if(!rst_n)
      carry_out3_reg <= 0;
    else
      carry_out3_reg <= carry_out3;
  end

  assign sum_out = {sum3_reg0, sum2_reg1, sum1_reg2, sum0_reg3};
  assign carry_out = carry_out3_reg;
  
endmodule

// 16 bit adder
module adder_16(a_in, b_in, carry_in, sum_out, carry_out);
  input [15:0]a_in, b_in;
  input carry_in;
  output [15:0]sum_out;
  output carry_out;

  wire [15:0]a_in, b_in;
  wire carry_in;
  wire [15:0]sum_out;
  wire carry_out;

  assign {carry_out, sum_out} = a_in + b_in + carry_in;

endmodule