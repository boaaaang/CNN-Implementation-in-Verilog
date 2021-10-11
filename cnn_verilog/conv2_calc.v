/*------------------------------------------------------------------------
 *
 *  Copyright (c) 2021 by Bo Young Kang, All rights reserved.
 *
 *  File name  : conv2_calc.v
 *  Written by : Kang, Bo Young
 *  Written on : Oct 1, 2021
 *  Version    : 21.1
 *  Design     : 2nd Convolution Layer for CNN MNIST dataset
 *               Convolution Sum Calculation
 *
 *------------------------------------------------------------------------*/

/*-------------------------------------------------------------------
 *  Module: conv2_calc
 *------------------------------------------------------------------*/
 
 module conv2_calc #(parameter WIDTH = 28, HEIGHT = 28, DATA_BITS = 8)(
   input clk,
   input rst_n,
   input valid_out_buf,
   input [11:0] data_out_0, data_out_1, data_out_2, data_out_3, data_out_4,
   data_out_5, data_out_6, data_out_7, data_out_8, data_out_9,
   data_out_10, data_out_11, data_out_12, data_out_13, data_out_14,
   data_out_15, data_out_16, data_out_17, data_out_18, data_out_19,
   data_out_20, data_out_21, data_out_22, data_out_23, data_out_24,
   output signed [13:0] conv_out_calc,
   output reg valid_out_calc
 );

 localparam FILTER_SIZE = 5;
 localparam CHANNEL_LEN = 3;

initial begin
   $readmemh("conv2_bias.txt", bias);
 end

 assign exp_bias[0] = (bias[0][7] == 1) ? {4'b1111, bias[0]} : {4'd0, bias[0]};
 assign exp_bias[1] = (bias[1][7] == 1) ? {4'b1111, bias[1]} : {4'd0, bias[1]};
 assign exp_bias[2] = (bias[2][7] == 1) ? {4'b1111, bias[2]} : {4'd0, bias[2]};

 assign conv2_out_1 = conv_out_1[13:1] + exp_bias[0];
 assign conv2_out_2 = conv_out_2[13:1] + exp_bias[1];
 assign conv2_out_3 = conv_out_3[13:1] + exp_bias[2];