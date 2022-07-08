module seq_gen(clk, rst_n, seq_out);
  input clk, rst_n;
  output seq_out;

  reg [6:0]seq;
  always @(posedge clk, negedge rst_n)begin
    if(!rst_n)
      seq <= 7'b101_1001;
    else
      seq <= {seq[5:0], seq[6]};
  end

  // seq_out
  assign seq_out = seq[6];

endmodule