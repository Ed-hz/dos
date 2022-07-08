module adder_64(clk, rst_n, a_in, b_in, carry_in, din_en, sum_out, carry_out, dout_en);
  input clk, rst_n;
  input [63:0]a_in, b_in;
  input carry_in;
  input din_en;
  output [63:0]sum_out;
  output carry_out;
  output dout_en;

  wire clk, rst_n;
  wire [63:0]a_in, b_in;
  wire carry_in;
  wire din_en;
  wire [63:0]sum_out;
  wire carry_out;
  reg dout_en;

  // for adder_16
  reg [15:0]a, b;
  reg ci;
  wire [15:0]sum;
  wire co;
  adder_16 u_adder_16(.a_in(a), .b_in(b), .carry_in(ci), .sum_out(sum), .carry_out(co));

  // register output
  reg [15:0]sum0_reg, sum1_reg, sum2_reg, sum3_reg;
  reg co_reg;
  always @(posedge clk, negedge rst_n)begin
    if(!rst_n)
      begin
        sum0_reg <= 0;
        sum1_reg <= 0;
        sum2_reg <= 0;
        sum3_reg <= 0;
      end
    else
      begin
        sum0_reg <= sum;
        sum1_reg <= sum0_reg;
        sum2_reg <= sum1_reg;
        sum3_reg <= sum2_reg;
      end
  end
  always @(posedge clk, negedge rst_n)begin
    if(!rst_n)
      co_reg <= 0;
    else
      co_reg <= co;
  end 

  //register input
  reg [47:0]a_in_reg, b_in_reg;
  always@(posedge clk, negedge rst_n)begin
    if(!rst_n)
      begin
        a_in_reg <= 0;
        b_in_reg <= 0;
      end
    else
      if(din_en)
        begin
          a_in_reg <= a_in[63:16];
          b_in_reg <= b_in[63:16];
        end
      else
        begin
          a_in_reg <= a_in_reg;
          b_in_reg <= b_in_reg;
        end
  end

  // for count
  reg [1:0]count;
  always @(posedge clk, negedge rst_n)begin
    if(!rst_n)
      count <= 0;
    else
      if(din_en || count>=1)
        count <= count + 1'b1;
      else
        count <= count;
  end
      
  // mux
  always @(count, a_in, b_in, a_in_reg, b_in_reg)begin
    case(count)
      2'b00: begin a = a_in[15:0]; b = b_in[15:0]; ci = carry_in; end
      2'b01: begin a = a_in_reg[15:0]; b = b_in_reg[15:0]; ci = co_reg; end 
      2'b10: begin a = a_in_reg[31:16]; b = b_in_reg[31:16]; ci = co_reg; end
      2'b11: begin a = a_in_reg[47:32]; b = b_in_reg[47:32]; ci = co_reg; end
    endcase
  end
  
  // dout_en
  always @(posedge clk, negedge rst_n)begin
    if(!rst_n)
      dout_en <= 0;
    else
      if(count == 2'b11)
        dout_en <= 1'b1;
      else
        dout_en <= 1'b0;
  end
  assign sum_out = {sum3_reg, sum2_reg, sum1_reg, sum0_reg};
  assign carry_out = co_reg;
  
endmodule

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