`timescale 1ns / 1ps
module twelveBitMux2to1( input logic [11:0] switch, instructionFromIM, 
input logic isExternal, output logic [11:0] out );

assign out = isExternal ? switch:instructionFromIM;

endmodule
