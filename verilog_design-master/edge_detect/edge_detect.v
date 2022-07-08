module edge_detect(
  clk, rst_n, init_n,
  data_in,
  edge_out
);
  parameter reg_event = 1; // 1(register out) or 0(not register out) 

  input clk, rst_n, init_n;
  input data_in;
  output edge_out;

  wire clk, rst_n, init_n;
  wire data_in;
  wire edge_out;
  
  reg data_in_reg, edge_out_reg;

  always @(posedge clk, negedge rst_n)begin
    if(rst_n == 1'b0)
      data_in_reg <= 1'b0;
    else
      if(init_n == 1'b0)
        data_in_reg <= 1'b0;
      else
        data_in_reg <= data_in;
  end

  always @(posedge clk, negedge rst_n)begin
    if(rst_n == 1'b0)
      edge_out_reg <= 1'b0;
    else 
      if(init_n == 1'b0)
        edge_out_reg <= 1'b0;
      else
        edge_out_reg <= data_in_reg ^ data_in;
  end

  generate
    if(reg_event == 1)
      assign edge_out = edge_out_reg;
    else
      assign edge_out = data_in_reg ^ data_in;
  endgenerate


endmodule