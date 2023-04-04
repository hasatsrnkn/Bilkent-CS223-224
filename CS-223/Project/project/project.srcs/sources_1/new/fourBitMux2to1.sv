`timescale 1ns / 1ps
module fourBitMux2to1( input logic [3:0]value1, [3:0]value2, input logic controlSignal, 
output logic [3:0] Y);

assign Y = (controlSignal) ? value1:value2;


    
endmodule
