`timescale 1ns / 1ps
module programCounter( input logic clk, input logic reset, 
input logic load, output logic [2:0] out);

    initial begin
        out <= 3'b000;
    end
    
    always_ff@( posedge clk or posedge reset)
    begin
        if( reset ) 
            out <= 3'b000;
        else if( load ) 
        begin
           if( out == 3'b111 ) begin
                out <= 3'b000;
           end
           else begin
                out <= out + 1;
            end           
         end
    end
    
    
endmodule
