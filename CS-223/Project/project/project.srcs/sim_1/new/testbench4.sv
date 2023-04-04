`timescale 1ns / 1ps


module testbench4();
logic[3:0] A;
logic[3:0] B;
logic[1:0] selection;
logic[3:0] out1;
logic[3:0] out2;

alu dut( A, B, selection, out1, out2);

initial begin
A = 4'b0111; B = 4'b0011; selection = 2'b00; #5;
A = 4'b0111; B = 4'b0011; selection = 2'b01; #5;
A = 4'b0111; B = 4'b0011; selection = 2'b10; #5;
A = 4'b0111; B = 4'b0011; selection = 2'b11; #5;

end


endmodule
