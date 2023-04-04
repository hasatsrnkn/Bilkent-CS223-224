`timescale 1ns / 1ps
module testbench1();
logic clk, write, read,clr;
logic [3:0] address;
logic [3:0] data;
logic [3:0] out;
dataMemory dut (clk, clr, read, write, address, data, out );
always
    begin
        clk <= 1; # 5; clk <= 0; # 5;
    end
    
initial begin
 write = 1; read = 0; clr = 1;
 data = 4'b0000; address = 4'b0000;
 #10;
 clr = 0;
 data = 4'b0010; address = 4'b0001;
 #10;
 data = 4'b0100; address = 4'b0010;
 #10;
 data = 4'b0110; address = 4'b0011;
 #10;
 data = 4'b1000; address = 4'b0100;
 #10;
 data = 4'b1010; address = 4'b0101;
 #10;
 data = 4'b1100; address = 4'b0110;
 #10;
 data = 4'b1110; address = 4'b0111;
 #10;
 data = 0; read = 1; write = 0;
 data = 4'b0000; address = 4'b0000;
 #10;
 data = 4'b0010; address = 4'b0001;
 #10;
 data = 4'b0100; address = 4'b0010;
 #10;
 data = 4'b0110; address = 4'b0011;
 #10;
 data = 4'b1000; address = 4'b0100;
 #10;
 data = 4'b1010; address = 4'b0101;
 #10;
 data = 4'b1100; address = 4'b0110;
 #10;
 data = 4'b1110; address = 4'b0111;
 #10;
 end

endmodule
