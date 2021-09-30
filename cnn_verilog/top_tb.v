/*------------------------------------------------------------------------
 *
 *  Copyright (c) 2021 by Bo Young Kang, All rights reserved.
 *
 *  File name  : top_tb.v
 *  Written by : Kang, Bo Young
 *  Written on : Sep 30, 2021
 *  Version    : 21.1
 *  Design     : Testbench for CNN MNIST dataset - single input image
 *
 *------------------------------------------------------------------------*/

`timescale 1ns/1ns

/*-------------------------------------------------------------------
 *  Module: top_tb
 *------------------------------------------------------------------*/

module top_tb();

reg clk, rst_n;
reg [7:0] pixels [0:783];
reg [9:0] img_idx;
reg [7:0] data_in;

wire signed [11:0] conv_out_1, conv_out_2, conv_out_3;
wire signed [11:0] conv2_out_1, conv2_out_2, conv2_out_3;

wire valid_out_layer_1, valid_out_layer_2;

// Module Instantiation
conv_layer_1 conv_layer_1(
  .clk(clk),
  .rst_n(rst_n);
  .data_in(data_in);
  .conv_out_1(conv_out_1),
  .conv_out_2(conv_out_2),
  .conv_out_3(conv_out_3),
  .valid_out_conv(valid_out_layer1)
);


conv_layer_2 conv_layer_2(
  .rst_n(rst_n),
);


// Clock generation & read image test file
initial begin
  $readmemh("./ref/3_0.txt", pixels);
  #5
  clk <= 1'b0;
  rst_n <= 1'b1;
  forever begin
    # 5 clk = ~clk;
  end
end

always @(posedge clk) begin
  if(~rst_n) begin
    img_idx <= 0;
  end

  if(img_idx < 10'd784) begin
    data_in <= pixels[img_idx];
    img_idx <= img_idx + 1'b1;
  end

end