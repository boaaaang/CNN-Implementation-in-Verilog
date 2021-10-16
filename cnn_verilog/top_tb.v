/*------------------------------------------------------------------------
 *
 *  Copyright (c) 2021 by Bo Young Kang, All rights reserved.
 *
 *  File name  : top_tb.v
 *  Written by : Kang, Bo Young
 *  Written on : Oct 15, 2021
 *  Version    : 21.2
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
wire signed [11:0] max_value_1, max_value_2, max_value_3;
wire signed [11:0] max2_value_1, max2_value_2, max2_value_3;
wire signed [11:0] fc_out_data;
wire [3:0] decision;

wire valid_out_1, valid_out_2, valid_out_3, valid_out_4, valid_out_5, valid_out_6;

// Module Instantiation
conv1_layer conv1_layer(
  .clk(clk),
  .rst_n(rst_n),
  .data_in(data_in),
  .conv_out_1(conv_out_1),
  .conv_out_2(conv_out_2),
  .conv_out_3(conv_out_3),
  .valid_out_conv(valid_out_1)
);

maxpool_relu #(.CONV_BIT(12), .HALF_WIDTH(12), .HALF_HEIGHT(12), .HALF_WIDTH_BIT(4))
maxpool_relu_1(
  .clk(clk),
  .rst_n(rst_n),
  .valid_in(valid_out_1),
  .conv_out_1(conv_out_1),
  .conv_out_2(conv_out_2),
  .conv_out_3(conv_out_3),
  .max_value_1(max_value_1),
  .max_value_2(max_value_2),
  .max_value_3(max_value_3),
  .valid_out_relu(valid_out_2)
);

conv2_layer conv2_layer(
  .clk(clk),
  .rst_n(rst_n),
  .valid_in(valid_out_2),
  .max_value_1(max_value_1),
  .max_value_2(max_value_2),
  .max_value_3(max_value_3),
  .conv2_out_1(conv2_out_1),
  .conv2_out_2(conv2_out_2),
  .conv2_out_3(conv2_out_3),
  .valid_out_conv2(valid_out_3)
);

maxpool_relu #(.CONV_BIT(12), .HALF_WIDTH(4), .HALF_HEIGHT(4), .HALF_WIDTH_BIT(3))
maxpool_relu_2(
  .clk(clk),
  .rst_n(rst_n),
  .valid_in(valid_out_3),
  .conv_out_1(conv2_out_1),
  .conv_out_2(conv2_out_2),
  .conv_out_3(conv2_out_3),
  .max_value_1(max2_value_1),
  .max_value_2(max2_value_2),
  .max_value_3(max2_value_3),
  .valid_out_relu(valid_out_4)
);

fully_connected #(.INPUT_NUM(48), .OUTPUT_NUM(10), .DATA_BITS(8))
fully_connected(
  .clk(clk),
  .rst_n(rst_n),
  .valid_in(valid_out_4),
  .data_in_1(max2_value_1),
  .data_in_2(max2_value_2),
  .data_in_3(max2_value_3),
  .data_out(fc_out_data),
  .valid_out_fc(valid_out_5)
);

comparator comparator(
  .clk(clk),
  .rst_n(rst_n),
  .valid_in(valid_out_5),
  .data_in(fc_out_data),
  .decision(decision),
  .valid_out(valid_out_6)
);

// Clock generation & read image text file
initial begin
  $readmemh("3_0.txt", pixels);
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

endmodule