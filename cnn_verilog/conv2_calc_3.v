/*------------------------------------------------------------------------
 *
 *  Copyright (c) 2021 by Bo Young Kang, All rights reserved.
 *
 *  File name  : conv2_calc_3.v
 *  Written by : Kang, Bo Young
 *  Written on : Oct 14, 2021
 *  Version    : 21.2
 *  Design     : 2nd Convolution Layer for CNN MNIST dataset
 *               Convolution Sum Calculation - 1st Channel
 *
 *------------------------------------------------------------------------*/

/*-------------------------------------------------------------------
 *  Module: conv2_calc_3
 *------------------------------------------------------------------*/
 
 module conv2_calc_3 #(parameter WIDTH = 28, HEIGHT = 28, DATA_BITS = 8)(
   input clk,
   input rst_n,
   input valid_out_buf,
   input [11:0] data_out1_0, data_out1_1, data_out1_2, data_out1_3, data_out1_4,
                data_out1_5, data_out1_6, data_out1_7, data_out1_8, data_out1_9,
                data_out1_10, data_out1_11, data_out1_12, data_out1_13, data_out1_14,
                data_out1_15, data_out1_16, data_out1_17, data_out1_18, data_out1_19,
                data_out1_20, data_out1_21, data_out1_22, data_out1_23, data_out1_24,
                
                data_out2_0, data_out2_1, data_out2_2, data_out2_3, data_out2_4,
                data_out2_5, data_out2_6, data_out2_7, data_out2_8, data_out2_9,
                data_out2_10, data_out2_11, data_out2_12, data_out2_13, data_out2_14,
                data_out2_15, data_out2_16, data_out2_17, data_out2_18, data_out2_19,
                data_out2_20, data_out2_21, data_out2_22, data_out2_23, data_out2_24,
                
                data_out3_0, data_out3_1, data_out3_2, data_out3_3, data_out3_4,
                data_out3_5, data_out3_6, data_out3_7, data_out3_8, data_out3_9,
                data_out3_10, data_out3_11, data_out3_12, data_out3_13, data_out3_14,
                data_out3_15, data_out3_16, data_out3_17, data_out3_18, data_out3_19,
                data_out3_20, data_out3_21, data_out3_22, data_out3_23, data_out3_24,

   output signed [13:0] conv_out_calc,
   output reg valid_out_calc
 );

 localparam FILTER_SIZE = 5;
 localparam CHANNEL_LEN = 3;

 reg signed [DATA_BITS - 1:0] weight_1 [0:24];
 reg signed [DATA_BITS - 1:0] weight_2 [0:24];
 reg signed [DATA_BITS - 1:0] weight_3 [0:24];

 wire signed [19:0] calc_out, calc_out_1, calc_out_2, calc_out_3;
 
 initial begin
   $readmemh("conv2_weight_31.txt", weight_1);
   $readmemh("conv2_weight_32.txt", weight_2);
   $readmemh("conv2_weight_33.txt", weight_3);
 end

 assign calc_out_1 = data_out1_0*weight_1[0] + data_out1_1*weight_1[1] + data_out1_2*weight_1[2] + data_out1_3*weight_1[3] + data_out1_4*weight_1[4] + 
					data_out1_5*weight_1[5] + data_out1_6*weight_1[6] + data_out1_7*weight_1[7] + data_out1_8*weight_1[8] + data_out1_9*weight_1[9] + 
					data_out1_10*weight_1[10] + data_out1_11*weight_1[11] + data_out1_12*weight_1[12] + data_out1_13*weight_1[13] + data_out1_14*weight_1[14] + 
					data_out1_15*weight_1[15] + data_out1_16*weight_1[16] + data_out1_17*weight_1[17] + data_out1_18*weight_1[18] + data_out1_19*weight_1[19] + 
					data_out1_20*weight_1[20] + data_out1_21*weight_1[21] + data_out1_22*weight_1[22] + data_out1_23*weight_1[23] + data_out1_24*weight_1[24];

 assign calc_out_2 = data_out2_0*weight_2[0] + data_out2_1*weight_2[1] + data_out2_2*weight_2[2] + data_out2_3*weight_2[3] + data_out2_4*weight_2[4] + 
					data_out2_5*weight_2[5] + data_out2_6*weight_2[6] + data_out2_7*weight_2[7] + data_out2_8*weight_2[8] + data_out2_9*weight_2[9] + 
					data_out2_10*weight_2[10] + data_out2_11*weight_2[11] + data_out2_12*weight_2[12] + data_out2_13*weight_2[13] + data_out2_14*weight_2[14] + 
					data_out2_15*weight_2[15] + data_out2_16*weight_2[16] + data_out2_17*weight_2[17] + data_out2_18*weight_2[18] + data_out2_19*weight_2[19] + 
					data_out2_20*weight_2[20] + data_out2_21*weight_2[21] + data_out2_22*weight_2[22] + data_out2_23*weight_2[23] + data_out2_24*weight_2[24];

 assign calc_out_3 = data_out3_0*weight_3[0] + data_out3_1*weight_3[1] + data_out3_2*weight_3[2] + data_out3_3*weight_3[3] + data_out3_4*weight_3[4] + 
					data_out3_5*weight_3[5] + data_out3_6*weight_3[6] + data_out3_7*weight_3[7] + data_out3_8*weight_3[8] + data_out3_9*weight_3[9] + 
					data_out3_10*weight_3[10] + data_out3_11*weight_3[11] + data_out3_12*weight_3[12] + data_out3_13*weight_3[13] + data_out3_14*weight_3[14] + 
					data_out3_15*weight_3[15] + data_out3_16*weight_3[16] + data_out3_17*weight_3[17] + data_out3_18*weight_3[18] + data_out3_19*weight_3[19] + 
					data_out3_20*weight_3[20] + data_out3_21*weight_3[21] + data_out3_22*weight_3[22] + data_out3_23*weight_3[23] + data_out3_24*weight_3[24];

 assign calc_out = calc_out_1 + calc_out_2 + calc_out_3;

 assign conv_out_calc = calc_out[19:6];

 always @(posedge clk) begin
   if(~rst_n) begin
     valid_out_calc <= 0;
   end else begin

   if(valid_out_buf == 1) begin
     if(valid_out_calc == 1) begin
       valid_out_calc <= 0;
     end else begin
       valid_out_calc <= 1;
     end
   end
 end
 end

 endmodule