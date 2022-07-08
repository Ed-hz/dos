// 序列(1011001)�?测器，每次输�?2bit
module seq_check (
  clk, rst_n,
  data_in,
  flag_out
);
  input clk, rst_n;
  input [1:0]data_in;
  output flag_out;

  reg flag_out;

  reg [2:0]state, next_state;
  localparam IDLE = 3'b000;
  localparam S0 = 3'b001;
  localparam S1 = 3'b010;
  localparam S2 = 3'b100;

  // state
  always @(posedge clk or negedge rst_n)begin
    if(!rst_n)
      state <= IDLE;
    else
      state <= next_state; 
  end

  // next_state
  always @(state or data_in)begin
    case(state)
      IDLE: 
        if(data_in == 2'b10)
          next_state = S0;
        else
          next_state = IDLE;
      S0:
        if(data_in == 2'b11)
          next_state = S1;
        else
          if(data_in == 2'b10)
            next_state = S0;
          else
            next_state = IDLE;
      S1:
        if(data_in == 2'b00)
          next_state = S2;
        else 
          if(data_in == 2'b10)
            next_state = S0;
          else
            next_state = IDLE;
      S2:
        if(data_in == 2'b10)
          next_state = S0;
        else
          next_state = IDLE;
      default : next_state = IDLE;
    endcase
  end

  // flag_out
  always @(posedge clk or negedge rst_n)begin
    if(!rst_n)
      flag_out <= 1'b0;
    else 
      if(state == S2 && data_in[1] == 1'b1)
        flag_out <= 1'b1;
      else
        flag_out <= 1'b0;
  end

endmodule