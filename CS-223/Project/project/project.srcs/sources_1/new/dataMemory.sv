`timescale 1ns / 1ps

module dataMemory( input logic clk, input logic clear, input logic read,
input logic write, input logic [3:0] address, 
input logic [3:0] data, output logic [3:0] out );

logic[3:0] ram[0:15];

initial begin
    ram[0] <= 0;
    ram[1] <= 0;
    ram[2] <= 0;
    ram[3] <= 0;
    ram[4] <= 0;
    ram[5] <= 0;
    ram[6] <= 0;
    ram[7] <= 0;
    ram[8] <= 0;
    ram[9] <= 0;
    ram[10] <= 0;
    ram[11] <= 0;
    ram[12] <= 0;
    ram[13] <= 0;
    ram[14] <= 0;
    ram[15] <= 0;
end

always_ff@( posedge clk or posedge clear )
begin
    if( clear )
    begin
        ram[0] <= 0;
        ram[1] <= 0;
        ram[2] <= 0;
        ram[3] <= 0;
        ram[4] <= 0;
        ram[5] <= 0;
        ram[6] <= 0;
        ram[7] <= 0;
        ram[8] <= 0;
        ram[9] <= 0;
        ram[10] <= 0;
        ram[11] <= 0;
        ram[12] <= 0;
        ram[13] <= 0;
        ram[14] <= 0;
        ram[15] <= 0;
    end
    
    else if( read ) 
    begin
        case( address )
            4'b0000 : out <= ram[0];
            4'b0001 : out <= ram[1];
            4'b0010 : out <= ram[2];
            4'b0011 : out <= ram[3];
            4'b0100 : out <= ram[4];
            4'b0101 : out <= ram[5];
            4'b0110 : out <= ram[6];
            4'b0111 : out <= ram[7];
            4'b1000 : out <= ram[8];
            4'b1001 : out <= ram[9];
            4'b1010 : out <= ram[10];
            4'b1011 : out <= ram[11];
            4'b1100 : out <= ram[12];
            4'b1101 : out <= ram[13];
            4'b1110 : out <= ram[14];
            4'b1111 : out <= ram[15];
        endcase       
    end
    
    else if( write )
    begin
        case( address )
            4'b0000 : ram[0] <= data;
            4'b0001 : ram[1] <= data;
            4'b0010 : ram[2] <= data;
            4'b0011 : ram[3] <= data;
            4'b0100 : ram[4] <= data;
            4'b0101 : ram[5] <= data;
            4'b0110 : ram[6] <= data;
            4'b0111 : ram[7] <= data;
            4'b1000 : ram[8] <= data;
            4'b1001 : ram[9] <= data;
            4'b1010 : ram[10] <= data;
            4'b1011 : ram[11] <= data;
            4'b1100 : ram[12] <= data;
            4'b1101 : ram[13] <= data;
            4'b1110 : ram[14] <= data;
            4'b1111 : ram[15] <= data;
        endcase 
    end
   
end






endmodule
