`timescale 1ns / 1ps
module instructionRegister( input logic clk, input logic load,
input logic [11:0] in,  output logic [11:0] out );

    always_ff@( posedge clk )  
        begin
            if( load )
            begin
                out <= in;
            end
        end
        
endmodule
