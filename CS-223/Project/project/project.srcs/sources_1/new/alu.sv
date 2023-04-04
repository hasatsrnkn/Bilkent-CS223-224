`timescale 1ns / 1ps


module alu( input logic[3:0] A, input logic[3:0] B, input logic[1:0] selection, 
output logic[3:0] out1, output logic[3:0] out2 );

always_comb
case( selection )
    2'b00 : 
    begin
        out1 = A + B;
    end
    
    2'b01 :
    begin 
        out1 = A - B;
    end
    
    2'b10 : 
    begin
        out1 = A * B;
    end
    
    2'b11 :
    begin
        out1 = A / B;  
        out2 = A % B;    
    end
    
endcase
endmodule
