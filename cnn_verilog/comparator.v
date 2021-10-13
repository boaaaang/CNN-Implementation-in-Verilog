/*------------------------------------------------------------------------
 *
 *  Copyright (c) 2021 by Bo Young Kang, All rights reserved.
 *
 *  File name  : comparator.v
 *  Written by : Kang, Bo Young
 *  Written on : Oct 13, 2021
 *  Version    : 21.1
 *  Design     : Final Comparator for decision
 *
 *------------------------------------------------------------------------*/

/*-------------------------------------------------------------------
 *  Module: comparator
 *------------------------------------------------------------------*/

module comparator (
  input clk,
  input rst_n,
  input valid_in,
  input [11:0] data_in,
  output reg [3:0] decision,
  output reg valid_out
);

reg signed [11:0] buffer [0:9];
reg signed [11:0] max;
reg signed [11:0] cmp1_0, cmp1_1, cmp1_2, cmp1_3, cmp1_4,
                  cmp2_0, cmp2_1, cmp2_2,
                  cmp3_0, cmp3_1;
reg [3:0] buf_idx;
reg [11:0] delay_cnt;
reg state;

always @(posedge clk) begin
  if(~rst_n) begin
    valid_out <= 0;
    buf_idx <= 0;
    delay_cnt <= 0;
    state <= 0;
  end

  if(valid_in == 1) begin
    buffer[buf_idx] <= data_in;
    buf_idx <= buf_idx + 1'b1;
    if(buf_idx == 9) begin
      state <= 1;
    end
  end else begin
    if(state == 1) begin
      delay_cnt <= delay_cnt + 1'b1;
      if(delay_cnt == 12'd5) begin
        valid_out <= 1;
      end else begin
        valid_out <= 0;
      end

      // Decision Process
      cmp1_0 <= (buffer[0] >= buffer[1]) ? buffer[0] : buffer[1];
      cmp1_1 <= (buffer[2] >= buffer[3]) ? buffer[2] : buffer[3];
      cmp1_2 <= (buffer[4] >= buffer[5]) ? buffer[4] : buffer[5];
      cmp1_3 <= (buffer[6] >= buffer[7]) ? buffer[6] : buffer[7];
      cmp1_4 <= (buffer[8] >= buffer[9]) ? buffer[8] : buffer[9];

      cmp2_0 <= (cmp1_0 >= cmp1_1) ? cmp1_0 : cmp1_1;
      cmp2_1 <= (cmp1_2 >= cmp1_3) ? cmp1_2 : cmp1_3;
      cmp2_2 <= cmp1_4;

      cmp3_0 <= (cmp2_0 >= cmp2_1) ? cmp2_0 : cmp2_1;
      cmp3_1 <= cmp2_2;

      max <= (cmp3_0 >= cmp3_1) ? cmp3_0 : cmp3_1;

      if(max == buffer[0])
        decision <= 4'd0;
      else if(max == buffer[1])
        decision <= 4'd1;
      else if(max == buffer[2])
        decision <= 4'd2;
      else if(max == buffer[3])
        decision <= 4'd3;
      else if(max == buffer[4])
        decision <= 4'd4;
      else if(max == buffer[5])
        decision <= 4'd5;
      else if(max == buffer[6])
        decision <= 4'd6;
      else if(max == buffer[7])
        decision <= 4'd7;
      else if(max == buffer[8])
        decision <= 4'd8;
      else if(max == buffer[9])
        decision <= 4'd9;
          
    end
  end
end
  
endmodule