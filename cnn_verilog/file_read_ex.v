module file_read_ex;

reg [7:0] pixels [0:783];

integer i, j;
initial begin
  $readmemh("file_in.txt", pixels);

  for(i = 0 ; i < 784; i = i + 1){
    for(j = 0; j < 8; j = j + 1){
      $display("%d", pixels[i][j]);
    }
  }
end

endmodule