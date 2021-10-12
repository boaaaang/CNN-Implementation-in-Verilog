/*------------------------------------------------------------------------
 *
 *  Copyright (c) 2021 by Bo Young Kang, All rights reserved.
 *
 *  File name  : conv_layer_2.v
 *  Written by : Kang, Bo Young
 *  Written on : Oct 11, 2021
 *  Version    : 21.1
 *  Design     : 2nd Convolution Layer for CNN MNIST dataset
 *
 *------------------------------------------------------------------------*/

`timescale 1ns/1ns

/*-------------------------------------------------------------------
 *  Module: conv_layer_2
 *------------------------------------------------------------------*/
 
 module conv_layer_2 (
   input clk,
   input rst_n,
   input valid_in,
   input [11:0] max_value_1, max_value_2, max_value3,
   output [11:0] conv2_out_1, conv2_out_2, conv2_out_3,
   output reg valid_out_conv2
 );

 localparam CHANNEL_LEN = 3;

 // Channel 1
 wire [11:0] data_out1_0, data_out1_1, data_out1_2, data_out1_3, data_out1_4,
  data_out1_5, data_out1_6, data_out1_7, data_out1_8, data_out1_9,
  data_out1_10, data_out1_11, data_out1_12, data_out1_13, data_out1_14,
  data_out1_15, data_out1_16, data_out1_17, data_out1_18, data_out1_19,
  data_out1_20, data_out1_21, data_out1_22, data_out1_23, data_out1_24;
 wire valid_out1_buf;

 // Channel 2
 wire [11:0] data_out2_0, data_out2_1, data_out2_2, data_out2_3, data_out2_4,
  data_out2_5, data_out2_6, data_out2_7, data_out2_8, data_out2_9,
  data_out2_10, data_out2_11, data_out2_12, data_out2_13, data_out2_14,
  data_out2_15, data_out2_16, data_out2_17, data_out2_18, data_out2_19,
  data_out2_20, data_out2_21, data_out2_22, data_out2_23, data_out2_24;
 wire valid_out2_buf;

 // Channel 3 
 wire [11:0] data_out3_0, data_out3_1, data_out3_2, data_out3_3, data_out3_4,
  data_out3_5, data_out3_6, data_out3_7, data_out3_8, data_out3_9,
  data_out3_10, data_out3_11, data_out3_12, data_out3_13, data_out3_14,
  data_out3_15, data_out3_16, data_out3_17, data_out3_18, data_out3_19,
  data_out3_20, data_out3_21, data_out3_22, data_out3_23, data_out3_24;
 wire valid_out3_buf;

 wire signed [13:0] conv_out_1, conv_out_2, conv_out_3;
 wire valid_out_buf, valid_out_calc_1, valid_out_calc_2, valid_out_calc_3;
 assign valid_out_buf = valid_out1_buf & valid_out2_buf & valid_out3_buf;
 assign valid_out_conv2 = valid_out_calc_1 & valid_out_calc_2 & valid_out_calc_3;

 reg signed [7:0] bias [0:CHANNEL_LEN - 1];
 wire signed [11:0] exp_bias [0:CHANNEL_LEN - 1];

 conv2_buf #(.WIDTH(12), .HEIGHT(12), .DATA_BIT(12)) conv2_buf_1(
   .clk(clk),
   .rst_n(rst_n),
   .valid_in(valid_in),
   .max_value(max_value_1),
   .data_out_0(data_out1_0),
   .data_out_1(data_out1_1),
   .data_out_2(data_out1_2),
   .data_out_3(data_out1_3),
   .data_out_4(data_out1_4),
   .data_out_5(data_out1_5),
   .data_out_6(data_out1_6),
   .data_out_7(data_out1_7),
   .data_out_8(data_out1_8),
   .data_out_9(data_out1_9),
   .data_out_10(data_out1_10),
   .data_out_11(data_out1_11),
   .data_out_12(data_out1_12),
   .data_out_13(data_out1_13),
   .data_out_14(data_out1_14),
   .data_out_15(data_out1_15),
   .data_out_16(data_out1_16),
   .data_out_17(data_out1_17),
   .data_out_18(data_out1_18),
   .data_out_19(data_out1_19),
   .data_out_20(data_out1_20),
   .data_out_21(data_out1_21),
   .data_out_22(data_out1_22),
   .data_out_23(data_out1_23),
   .data_out_24(data_out1_24),
   .valid_out_buf(valid_out1_buf)
 );

 conv2_buf #(.WIDTH(12), .HEIGHT(12), .DATA_BIT(12)) conv2_buf_2(
   .clk(clk),
   .rst_n(rst_n),
   .valid_in(valid_in),
   .max_value(max_value_2),
   .data_out_0(data_out2_0),
   .data_out_1(data_out2_1),
   .data_out_2(data_out2_2),
   .data_out_3(data_out2_3),
   .data_out_4(data_out2_4),
   .data_out_5(data_out2_5),
   .data_out_6(data_out2_6),
   .data_out_7(data_out2_7),
   .data_out_8(data_out2_8),
   .data_out_9(data_out2_9),
   .data_out_10(data_out2_10),
   .data_out_11(data_out2_11),
   .data_out_12(data_out2_12),
   .data_out_13(data_out2_13),
   .data_out_14(data_out2_14),
   .data_out_15(data_out2_15),
   .data_out_16(data_out2_16),
   .data_out_17(data_out2_17),
   .data_out_18(data_out2_18),
   .data_out_19(data_out2_19),
   .data_out_20(data_out2_20),
   .data_out_21(data_out2_21),
   .data_out_22(data_out2_22),
   .data_out_23(data_out2_23),
   .data_out_24(data_out2_24),
   .valid_out_buf(valid_out2_buf)
 );

 conv2_buf #(.WIDTH(12), .HEIGHT(12), .DATA_BIT(12)) conv2_buf_3(
   .clk(clk),
   .rst_n(rst_n),
   .valid_in(valid_in),
   .max_value(max_value_3),
   .data_out_0(data_out3_0),
   .data_out_1(data_out3_1),
   .data_out_2(data_out3_2),
   .data_out_3(data_out3_3),
   .data_out_4(data_out3_4),
   .data_out_5(data_out3_5),
   .data_out_6(data_out3_6),
   .data_out_7(data_out3_7),
   .data_out_8(data_out3_8),
   .data_out_9(data_out3_9),
   .data_out_10(data_out3_10),
   .data_out_11(data_out3_11),
   .data_out_12(data_out3_12),
   .data_out_13(data_out3_13),
   .data_out_14(data_out3_14),
   .data_out_15(data_out3_15),
   .data_out_16(data_out3_16),
   .data_out_17(data_out3_17),
   .data_out_18(data_out3_18),
   .data_out_19(data_out3_19),
   .data_out_20(data_out3_20),
   .data_out_21(data_out3_21),
   .data_out_22(data_out3_22),
   .data_out_23(data_out3_23),
   .data_out_24(data_out3_24),
   .valid_out_buf(valid_out3_buf)
 );

 conv2_calc conv2_calc_1(
   .clk(clk),
   .rst_n(rst_n),
   .valid_out_buf(valid_out_buf),
   .data_out_0(data_out1_0),
   .data_out_1(data_out1_1),
   .data_out_2(data_out1_2),
   .data_out_3(data_out1_3),
   .data_out_4(data_out1_4),
   .data_out_5(data_out1_5),
   .data_out_6(data_out1_6),
   .data_out_7(data_out1_7),
   .data_out_8(data_out1_8),
   .data_out_9(data_out1_9),
   .data_out_10(data_out1_10),
   .data_out_11(data_out1_11),
   .data_out_12(data_out1_12),
   .data_out_13(data_out1_13),
   .data_out_14(data_out1_14),
   .data_out_15(data_out1_15),
   .data_out_16(data_out1_16),
   .data_out_17(data_out1_17),
   .data_out_18(data_out1_18),
   .data_out_19(data_out1_19),
   .data_out_20(data_out1_20),
   .data_out_21(data_out1_21),
   .data_out_22(data_out1_22),
   .data_out_23(data_out1_23),
   .data_out_24(data_out1_24),
   .conv_out(conv_out_1),
   .valid_out_calc(valid_out_calc_1)
 );

  conv2_calc conv2_calc_2(
   .clk(clk),
   .rst_n(rst_n),
   .valid_out_buf(valid_out_buf),
   .data_out_0(data_out1_0),
   .data_out_1(data_out2_1),
   .data_out_2(data_out2_2),
   .data_out_3(data_out2_3),
   .data_out_4(data_out2_4),
   .data_out_5(data_out2_5),
   .data_out_6(data_out2_6),
   .data_out_7(data_out2_7),
   .data_out_8(data_out2_8),
   .data_out_9(data_out2_9),
   .data_out_10(data_out2_10),
   .data_out_11(data_out2_11),
   .data_out_12(data_out2_12),
   .data_out_13(data_out2_13),
   .data_out_14(data_out2_14),
   .data_out_15(data_out2_15),
   .data_out_16(data_out2_16),
   .data_out_17(data_out2_17),
   .data_out_18(data_out2_18),
   .data_out_19(data_out2_19),
   .data_out_20(data_out2_20),
   .data_out_21(data_out2_21),
   .data_out_22(data_out2_22),
   .data_out_23(data_out2_23),
   .data_out_24(data_out2_24),
   .conv_out(conv_out_1),
   .valid_out_calc(valid_out_calc_1)
 );

 conv2_calc conv2_calc_3(
   .clk(clk),
   .rst_n(rst_n),
   .valid_out_buf(valid_out_buf),
   .data_out_0(data_out3_0),
   .data_out_1(data_out3_1),
   .data_out_2(data_out3_2),
   .data_out_3(data_out3_3),
   .data_out_4(data_out3_4),
   .data_out_5(data_out3_5),
   .data_out_6(data_out3_6),
   .data_out_7(data_out3_7),
   .data_out_8(data_out3_8),
   .data_out_9(data_out3_9),
   .data_out_10(data_out3_10),
   .data_out_11(data_out3_11),
   .data_out_12(data_out3_12),
   .data_out_13(data_out3_13),
   .data_out_14(data_out3_14),
   .data_out_15(data_out3_15),
   .data_out_16(data_out3_16),
   .data_out_17(data_out3_17),
   .data_out_18(data_out3_18),
   .data_out_19(data_out3_19),
   .data_out_20(data_out3_20),
   .data_out_21(data_out3_21),
   .data_out_22(data_out3_22),
   .data_out_23(data_out3_23),
   .data_out_24(data_out3_24),
   .conv_out(conv_out_1),
   .valid_out_calc(valid_out_calc_1)
 );

 endmodule