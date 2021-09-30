/*------------------------------------------------------------------------
 *
 *  Copyright (c) 2021 by Bo Young Kang, All rights reserved.
 *
 *  File name  : conv_buf_1.v
 *  Written by : Kang, Bo Young
 *  Written on : Sep 30, 2021
 *  Version    : 21.1
 *  Design     : 1st Convolution Layer for CNN MNIST dataset
 *               Input Buffer
 *
 *------------------------------------------------------------------------*/

`timescale 1ns/1ns

/*-------------------------------------------------------------------
 *  Module: conv_buf_1
 *------------------------------------------------------------------*/
 
 module conv_buf_1 #(parameter WIDTH = 28, HEIGHT = 28, DATA_BITS = 8)(
   input clk;
   input rst_n;
   input [DATA_BITS - 1 : 0] data_in;
   output reg [DATA_BITS - 1 : 0] data_out_0, data_out_1, data_out_2, data_out_3, data_out_4,
   data_out_5, data_out_6, data_out_7, data_out_8, data_out_9,
   data_out_10, data_out_11, data_out_12, data_out_13, data_out_14,
   data_out_15, data_out_16, data_out_17, data_out_18, data_out_19,
   data_out_20, data_out_21, data_out_22, data_out_23, data_out_24;
   output reg valid_out_buf;
 );

 localparam FILTER_SIZE = 5;