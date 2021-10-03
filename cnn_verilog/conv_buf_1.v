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

/*-------------------------------------------------------------------
 *  Module: conv_buf_1
 *------------------------------------------------------------------*/
 
 module conv_buf_1 #(parameter WIDTH = 28, HEIGHT = 28, DATA_BITS = 8)(
   input clk,
   input rst_n,
   input [DATA_BITS - 1:0] data_in,
   output reg [DATA_BITS - 1:0] data_out_0, data_out_1, data_out_2, data_out_3, data_out_4,
   data_out_5, data_out_6, data_out_7, data_out_8, data_out_9,
   data_out_10, data_out_11, data_out_12, data_out_13, data_out_14,
   data_out_15, data_out_16, data_out_17, data_out_18, data_out_19,
   data_out_20, data_out_21, data_out_22, data_out_23, data_out_24,
   output reg valid_out_buf
 );

 localparam FILTER_SIZE = 5;

 reg [DATA_BITS - 1:0] buffer [0 : WIDTH * FILTER_SIZE - 1];
 reg [DATA_BITS - 1:0] buf_idx;
 reg [4:0] w_idx, h_idx;
 reg [2:0] buf_flag;  // 0 ~ 4
 reg state;

 always @(posedge clk) begin
   if(~rst_n) begin
     buf_idx <= 0;
     w_idx <= 0;
     h_idx <= 0;
     buf_flag <= 0;
     state <= 0;
     valid_out_buf <= 0;
   end  

   if(buf_idx == WIDTH * FILTER_SIZE - 1) begin // buffer size = 140 = 28(w) * 5(h)
     buf_idx <= 0;
   end
   
   buffer[buf_idx] <= data_in;  // data input
   buf_idx <= buf_idx + 1'b1;

   // Wait until first 140 input data
   if(!state) begin
     if(buf_idx == WIDTH * FILTER_SIZE - 1) begin
       state <= 1'b1;
     end
   end else begin
     w_idx <= w_idx + 1'b1; // move right

     if(w_idx == WIDTH - FILTER_SIZE + 1) begin
       valid_out_buf <= 1'b0; // unvalid area
     end else if(w_idx == WIDTH - 1) begin

       if(buf_flag == FILTER_SIZE - 1) begin
         buf_flag <= 0;
       end else begin
         buf_flag <= buf_flag + 1'b1;
       end
       w_idx <= 0;

       if(h_idx == HEIGHT - FILTER_SIZE) begin  // done 1 input read -> 28 * 28
         h_idx <= 0;
         state <= 1'b0;
       end else begin
         h_idx <= h_idx + 1'b1;
       end

     end else if(w_idx == 0) begin
       valid_out_buf <= 1'b1; // start valid area
     end

     // Buffer Selection -> 5 * 5
     if(buf_flag == 3'd0) begin
       data_out_0 <= buffer[w_idx];
       data_out_1 <= buffer[w_idx + 1];
       data_out_2 <= buffer[w_idx + 2];
       data_out_3 <= buffer[w_idx + 3];
       data_out_4 <= buffer[w_idx + 4];

       data_out_5 <= buffer[w_idx + WIDTH];
       data_out_6 <= buffer[w_idx + 1 + WIDTH];
       data_out_7 <= buffer[w_idx + 2 + WIDTH];
       data_out_8 <= buffer[w_idx + 3 + WIDTH];
       data_out_9 <= buffer[w_idx + 4 + WIDTH];

       data_out_10 <= buffer[w_idx + WIDTH * 2];
       data_out_11 <= buffer[w_idx + 1 + WIDTH * 2];
       data_out_12 <= buffer[w_idx + 2 + WIDTH * 2];
       data_out_13 <= buffer[w_idx + 3 + WIDTH * 2];
       data_out_14 <= buffer[w_idx + 4 + WIDTH * 2];

       data_out_15 <= buffer[w_idx + WIDTH * 3];
       data_out_16 <= buffer[w_idx + 1 + WIDTH * 3];
       data_out_17 <= buffer[w_idx + 2 + WIDTH * 3];
       data_out_18 <= buffer[w_idx + 3 + WIDTH * 3];
       data_out_19 <= buffer[w_idx + 4 + WIDTH * 3];

       data_out_20 <= buffer[w_idx + WIDTH * 4];
       data_out_21 <= buffer[w_idx + 1 + WIDTH * 4];
       data_out_22 <= buffer[w_idx + 2 + WIDTH * 4];
       data_out_23 <= buffer[w_idx + 3 + WIDTH * 4];
       data_out_24 <= buffer[w_idx + 4 + WIDTH * 4];
     end else if(buf_flag == 3'd1) begin
       data_out_0 <= buffer[w_idx + WIDTH];
       data_out_1 <= buffer[w_idx + 1 + WIDTH];
       data_out_2 <= buffer[w_idx + 2 + WIDTH];
       data_out_3 <= buffer[w_idx + 3 + WIDTH];
       data_out_4 <= buffer[w_idx + 4 + WIDTH];

       data_out_5 <= buffer[w_idx + WIDTH * 2];
       data_out_6 <= buffer[w_idx + 1 + WIDTH * 2];
       data_out_7 <= buffer[w_idx + 2 + WIDTH * 2];
       data_out_8 <= buffer[w_idx + 3 + WIDTH * 2];
       data_out_9 <= buffer[w_idx + 4 + WIDTH * 2];

       data_out_10 <= buffer[w_idx + WIDTH * 3];
       data_out_11 <= buffer[w_idx + 1 + WIDTH * 3];
       data_out_12 <= buffer[w_idx + 2 + WIDTH * 3];
       data_out_13 <= buffer[w_idx + 3 + WIDTH * 3];
       data_out_14 <= buffer[w_idx + 4 + WIDTH * 3];

       data_out_15 <= buffer[w_idx + WIDTH * 4];
       data_out_16 <= buffer[w_idx + 1 + WIDTH * 4];
       data_out_17 <= buffer[w_idx + 2 + WIDTH * 4];
       data_out_18 <= buffer[w_idx + 3 + WIDTH * 4];
       data_out_19 <= buffer[w_idx + 4 + WIDTH * 4];

       data_out_20 <= buffer[w_idx];
       data_out_21 <= buffer[w_idx + 1];
       data_out_22 <= buffer[w_idx + 2];
       data_out_23 <= buffer[w_idx + 3];
       data_out_24 <= buffer[w_idx + 4];
     end else if(buf_flag == 3'd2) begin
       data_out_0 <= buffer[w_idx + WIDTH * 2];
       data_out_1 <= buffer[w_idx + 1 + WIDTH * 2];
       data_out_2 <= buffer[w_idx + 2 + WIDTH * 2];
       data_out_3 <= buffer[w_idx + 3 + WIDTH * 2];
       data_out_4 <= buffer[w_idx + 4 + WIDTH * 2];

       data_out_5 <= buffer[w_idx + WIDTH * 3];
       data_out_6 <= buffer[w_idx + 1 + WIDTH * 3];
       data_out_7 <= buffer[w_idx + 2 + WIDTH * 3];
       data_out_8 <= buffer[w_idx + 3 + WIDTH * 3];
       data_out_9 <= buffer[w_idx + 4 + WIDTH * 3];

       data_out_10 <= buffer[w_idx + WIDTH * 4];
       data_out_11 <= buffer[w_idx + 1 + WIDTH * 4];
       data_out_12 <= buffer[w_idx + 2 + WIDTH * 4];
       data_out_13 <= buffer[w_idx + 3 + WIDTH * 4];
       data_out_14 <= buffer[w_idx + 4 + WIDTH * 4];

       data_out_15 <= buffer[w_idx];
       data_out_16 <= buffer[w_idx + 1];
       data_out_17 <= buffer[w_idx + 2];
       data_out_18 <= buffer[w_idx + 3];
       data_out_19 <= buffer[w_idx + 4];

       data_out_20 <= buffer[w_idx + WIDTH];
       data_out_21 <= buffer[w_idx + 1 + WIDTH];
       data_out_22 <= buffer[w_idx + 2 + WIDTH];
       data_out_23 <= buffer[w_idx + 3 + WIDTH];
       data_out_24 <= buffer[w_idx + 4 + WIDTH];
     end else if(buf_flag == 3'd3) begin
       data_out_0 <= buffer[w_idx + WIDTH * 3];
       data_out_1 <= buffer[w_idx + 1 + WIDTH * 3];
       data_out_2 <= buffer[w_idx + 2 + WIDTH * 3];
       data_out_3 <= buffer[w_idx + 3 + WIDTH * 3];
       data_out_4 <= buffer[w_idx + 4 + WIDTH * 3];

       data_out_5 <= buffer[w_idx + WIDTH * 4];
       data_out_6 <= buffer[w_idx + 1 + WIDTH * 4];
       data_out_7 <= buffer[w_idx + 2 + WIDTH * 4];
       data_out_8 <= buffer[w_idx + 3 + WIDTH * 4];
       data_out_9 <= buffer[w_idx + 4 + WIDTH * 4];

       data_out_10 <= buffer[w_idx];
       data_out_11 <= buffer[w_idx + 1];
       data_out_12 <= buffer[w_idx + 2];
       data_out_13 <= buffer[w_idx + 3];
       data_out_14 <= buffer[w_idx + 4];

       data_out_15 <= buffer[w_idx + WIDTH];
       data_out_16 <= buffer[w_idx + 1 + WIDTH];
       data_out_17 <= buffer[w_idx + 2 + WIDTH];
       data_out_18 <= buffer[w_idx + 3 + WIDTH];
       data_out_19 <= buffer[w_idx + 4 + WIDTH];

       data_out_20 <= buffer[w_idx + WIDTH * 2];
       data_out_21 <= buffer[w_idx + 1 + WIDTH * 2];
       data_out_22 <= buffer[w_idx + 2 + WIDTH * 2];
       data_out_23 <= buffer[w_idx + 3 + WIDTH * 2];
       data_out_24 <= buffer[w_idx + 4 + WIDTH * 2];      
     end else if(buf_flag == 3'd4) begin
       data_out_0 <= buffer[w_idx + WIDTH * 4];
       data_out_1 <= buffer[w_idx + 1 + WIDTH * 4];
       data_out_2 <= buffer[w_idx + 2 + WIDTH * 4];
       data_out_3 <= buffer[w_idx + 3 + WIDTH * 4];
       data_out_4 <= buffer[w_idx + 4 + WIDTH * 4];

       data_out_5 <= buffer[w_idx];
       data_out_6 <= buffer[w_idx + 1];
       data_out_7 <= buffer[w_idx + 2];
       data_out_8 <= buffer[w_idx + 3];
       data_out_9 <= buffer[w_idx + 4];

       data_out_10 <= buffer[w_idx + WIDTH];
       data_out_11 <= buffer[w_idx + 1 + WIDTH];
       data_out_12 <= buffer[w_idx + 2 + WIDTH];
       data_out_13 <= buffer[w_idx + 3 + WIDTH];
       data_out_14 <= buffer[w_idx + 4 + WIDTH];

       data_out_15 <= buffer[w_idx + WIDTH * 2];
       data_out_16 <= buffer[w_idx + 1 + WIDTH * 2];
       data_out_17 <= buffer[w_idx + 1 + WIDTH * 2];
       data_out_18 <= buffer[w_idx + 1 + WIDTH * 2];
       data_out_19 <= buffer[w_idx + 1 + WIDTH * 2];

       data_out_20 <= buffer[w_idx + WIDTH * 3];
       data_out_21 <= buffer[w_idx + 1 + WIDTH * 3];
       data_out_22 <= buffer[w_idx + 2 + WIDTH * 3];
       data_out_23 <= buffer[w_idx + 3 + WIDTH * 3];
       data_out_24 <= buffer[w_idx + 4 + WIDTH * 3];   
     end

   end

 end
endmodule

