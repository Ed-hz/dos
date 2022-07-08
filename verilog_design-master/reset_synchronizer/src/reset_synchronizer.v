// asynchronizer reset assertion , synchronizer reset release
module reset_synchronizer(clk, async_reset_n, sync_reset_n);
  input clk;
  input async_reset_n;
  output sync_reset_n;

  reg reset_reg1, reset_reg2;
  always @(posedge clk, negedge async_reset_n)begin
    if(!async_reset_n)
      begin
        reset_reg1 <= 1'b0;
        reset_reg2 <= 1'b0;
      end
    else
      begin
        reset_reg1 <= 1'b1;
        reset_reg2 <= reset_reg1;
      end
  end

  assign sync_reset_n = reset_reg2;
  
endmodule