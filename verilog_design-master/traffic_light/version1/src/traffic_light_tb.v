`timescale 1ns/1ps

module traffic_light_tb;
  reg clk_125M, rst;
  reg c;
  wire [2:0]HL, FL;

  traffic_light  u_traffic_light (
      .clk_125M                ( clk_125M        ),
      .rst                     ( rst             ),
      .c                       ( c               ),

      .HL                      ( HL        [2:0] ),
      .FL                      ( FL        [2:0] )
  );

  initial begin
    clk_125M = 1'b1;
  end

  always #4 clk_125M = ~clk_125M;

  initial begin
    rst = 1'b1;
    #0.5;
    rst = 1'b0;
  end

  // initial begin
  //   c = 0;
  //   #(64'd10_000_000_000);
  //   c = 1;
  //   #(64'd10_000_000_000);
  //   c = 0;
  //   #(64'd20_000_000_000);
  //   c = 1;
  //   #(64'd1_000_000_000);
  //   c = 0;
  //   #(64'd2_000_000_000);
  //   #(64'd30_000_000_000);
  //   #(64'd3_000_000_000);
  //   #(64'd40_000_000_000);
  //   c = 1;
  //   #(64'd1_000_000_000);
  //   c = 0;
  //   #(64'd2_000_000_000);
  //   #(64'd10_000_000_000);
  //   c = 1;
  //   #(64'd3_000_000_000);
  //   #(64'd20_000_000_000);

  //   #(64'd2_000_000_000);
  //   $stop;

  // end


  initial begin
    c = 0;
    #(10*8);
    c = 1;
    #(10*8);
    c = 0;
    #(10*8);
    c = 1;
    #(3*8);
    #(30*8);
    c = 0;
    #(3*8);
    #(40*8);
    c = 1;
    #(3*8);
    #(10*8);
    c = 0;
    #(10*5);
    $stop;

  end

endmodule