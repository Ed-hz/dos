`timescale 1ns/1ps
module tb;
  parameter reg_event = 1;

  reg clk, rst_n, init_n;
  reg data_in;

  wire edge_detect;

  edge_detect #(
      .reg_event ( reg_event ))
  u_edge_detect (
      .clk                   ( clk      ),
      .rst_n                 ( rst_n    ),
      .init_n                ( init_n   ),
      .data_in                 ( data_in    ),

      .edge_out                ( edge_out   )
  );

  initial begin
    clk = 1'b0;
    rst_n = 1'b0;
    init_n = 1'b0;
    data_in = 1'b0;
    #1;
    rst_n = 1'b1;
    #1;
    init_n = 1'b1;
    #1;
    data_in = 1'b1;
    #1;
    data_in = 1'b0;
    #5;
    data_in = 1'b1;
    #5;
    data_in = 1'b0;
    #5;
    data_in = 1'b1;
    #5;
    data_in = 1'b0;
    #1;
  end

  always #0.5 clk = ~clk;

endmodule