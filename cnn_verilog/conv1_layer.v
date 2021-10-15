/*------------------------------------------------------------------------
 *
 *  Copyright (c) 2021 by Bo Young Kang, All rights reserved.
 *
 *  File name  : conv1_layer.v
 *  Written by : Kang, Bo Young
 *  Written on : Sep 30, 2021
 *  Version    : 21.2
 *  Design     : 1st Convolution Layer for CNN MNIST dataset
 *
 *------------------------------------------------------------------------*/

`timescale 1ns/1ns

/*-------------------------------------------------------------------
 *  Module: conv1_layer
 *------------------------------------------------------------------*/
 
 module conv1_layer (
   input clk,
   input rst_n,
   input [7:0] data_in,
   output [11:0] conv_out_1, conv_out_2, conv_out_3,
   output valid_out_conv
 );

 wire [7:0] data_out_0, data_out_1, data_out_2, data_out_3, data_out_4,
  data_out_5, data_out_6, data_out_7, data_out_8, data_out_9,
  data_out_10, data_out_11, data_out_12, data_out_13, data_out_14,
  data_out_15, data_out_16, data_out_17, data_out_18, data_out_19,
  data_out_20, data_out_21, data_out_22, data_out_23, data_out_24;
 wire valid_out_buf;

 conv1_buf #(.WIDTH(28), .HEIGHT(28), .DATA_BITS(8)) conv1_buf(
   .clk(clk),
   .rst_n(rst_n),
   .data_in(data_in),
   .data_out_0(data_out_0),
   .data_out_1(data_out_1),
   .data_out_2(data_out_2),
   .data_out_3(data_out_3),
   .data_out_4(data_out_4),
   .data_out_5(data_out_5),
   .data_out_6(data_out_6),
   .data_out_7(data_out_7),
   .data_out_8(data_out_8),
   .data_out_9(data_out_9),
   .data_out_10(data_out_10),
   .data_out_11(data_out_11),
   .data_out_12(data_out_12),
   .data_out_13(data_out_13),
   .data_out_14(data_out_14),
   .data_out_15(data_out_15),
   .data_out_16(data_out_16),
   .data_out_17(data_out_17),
   .data_out_18(data_out_18),
   .data_out_19(data_out_19),
   .data_out_20(data_out_20),
   .data_out_21(data_out_21),
   .data_out_22(data_out_22),
   .data_out_23(data_out_23),
   .data_out_24(data_out_24),
   .valid_out_buf(valid_out_buf)
 );

 conv1_calc conv1_calc(
   .valid_out_buf(valid_out_buf),
   .data_out_0(data_out_0),
   .data_out_1(data_out_1),
   .data_out_2(data_out_2),
   .data_out_3(data_out_3),
   .data_out_4(data_out_4),
   .data_out_5(data_out_5),
   .data_out_6(data_out_6),
   .data_out_7(data_out_7),
   .data_out_8(data_out_8),
   .data_out_9(data_out_9),
   .data_out_10(data_out_10),
   .data_out_11(data_out_11),
   .data_out_12(data_out_12),
   .data_out_13(data_out_13),
   .data_out_14(data_out_14),
   .data_out_15(data_out_15),
   .data_out_16(data_out_16),
   .data_out_17(data_out_17),
   .data_out_18(data_out_18),
   .data_out_19(data_out_19),
   .data_out_20(data_out_20),
   .data_out_21(data_out_21),
   .data_out_22(data_out_22),
   .data_out_23(data_out_23),
   .data_out_24(data_out_24),
   .conv_out_1(conv_out_1),
   .conv_out_2(conv_out_2),
   .conv_out_3(conv_out_3),
   .valid_out_calc(valid_out_conv)
 );
 endmodule