`timescale 1ns / 1ps


module testbench2();

logic x;
logic [1:0]in;
reg [3:0]out;
    
decoder2_to_4 dut(x,in,out);
     initial begin
          x = 0; in[1] = 0; in[0]= 0; #10;
          in[0]= 1; #10;
          in[1] = 1; in[0]= 0; #10;
          in[0]= 1; #10;
          x = 1; in[1] = 0; in[0]= 0; #10;
          in[0]= 1; #10;
          in[1] = 1; in[0]= 0; #10;
          in[0]= 1; #10;
     end
endmodule
