module seq_check(clk, rst_n, data_in, flag_out);
  input clk, rst_n;
  input data_in;
  output flag_out;

  reg flag_out;

  reg [1:0] state, next_state;

  localparam IDLE = 2'b00;
  localparam S0 = 2'b01;
  localparam S1 = 2'b10;
  localparam S2 = 2'b11;

  // state
  always @(posedge clk, negedge rst_n)begin
    if(!rst_n)
      state <= IDLE;
    else
      state <= next_state;
  end

  // next_state
  always @(state, data_in)begin
    case(state)
      IDLE : 
        if(data_in == 1'b1)
          next_state = S0;
        else
          next_state = IDLE;
      S0:
        if(data_in == 1'b1)
          next_state = S1;
        else
          next_state = IDLE;
      S1:
        if(data_in == 1'b0)
          next_state = S2;
        else
          next_state = S1;
      S2:
        if(data_in == 1'b1)
          next_state = S0;
        else
          next_state = IDLE;
    endcase
  end

  // flag_out
  always @(posedge clk, negedge rst_n)begin
    if(!rst_n)
      flag_out <= 1'b0;
    else
      if(state == S2 && data_in == 1'b1)
        flag_out <= 1'b1;
      else
        flag_out <= 1'b0;
  end
        
endmodule