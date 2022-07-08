module FSM(clk, rst, tl, ts, c, FL, HL, sc);
  input clk, rst;
  input tl, ts; // time
  input c; // Farmroad car
  output [2:0]FL, HL;
  output sc;

  wire clk, rst;
  wire tl, ts;
  wire c;
  reg [2:0]FL, HL;
  wire sc;

  //FSM
  reg [1:0]state, state_next;
  localparam [1:0]S0 = 2'b00; //HL_green, FL_red
  localparam [1:0]S1 = 2'b01; //HL_yellow, FL_red
  localparam [1:0]S2 = 2'b10; //HL_red, FL_green
  localparam [1:0]S3 = 2'b11; //HL_red, FL_yellow
  always @(posedge clk, posedge rst) begin
    if(rst)
      state <= S0;
    else
      state <= state_next;
  end
  always @(state, tl, ts, c) begin
    case(state)
      S0:
        if(tl && c)
          state_next = S1;
        else
          state_next = S0;
      S1:
        if(ts)
          state_next = S2;
        else
          state_next = S1;
      S2:
        if((~tl) && c)
          state_next = S2;
        else
          state_next = S3;
      S3:
        if(ts)
          state_next = S0;
        else
          state_next = S3;
    endcase
  end

  always @(state) begin
    case(state)
      S0:
        begin
          HL = 3'b001;
          FL = 3'b100;
        end
      S1:
        begin
          HL = 3'b010;
          FL = 3'b100;
        end
      S2:
        begin
          HL = 3'b100;
          FL = 3'b001;
        end
      S3:
        begin
          HL = 3'b100;
          FL = 3'b010;
        end
    endcase
  end

  assign sc = (state != state_next)?1'b1:1'b0;

endmodule
