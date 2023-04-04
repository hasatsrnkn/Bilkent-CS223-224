`timescale 1ns / 1ps
module instructionMemory( input logic clk, input logic clr, input logic write,
input logic [2:0] address, input logic [11:0] in ,output logic[11:0] out );

logic [11:0] ram [0:7];
logic [2:0] addressToWrite;
initial begin
    ram[0] <= 12'b000000000000;
    ram[1] <= 12'b000000000000;
    ram[2] <= 12'b000000000000;
    ram[3] <= 12'b000000000000;
    ram[4] <= 12'b000000000000;
    ram[5] <= 12'b000000000000;
    ram[6] <= 12'b000000000000;
    ram[7] <= 12'b000000000000;
    addressToWrite <= 3'b000;
end
always_ff@( posedge clk  )
begin
    if( clr ) begin
        ram[0] <= 12'b000000000000;
        ram[1] <= 12'b000000000000;
        ram[2] <= 12'b000000000000;
        ram[3] <= 12'b000000000000;
        ram[4] <= 12'b000000000000;
        ram[5] <= 12'b000000000000;
        ram[6] <= 12'b000000000000;
        ram[7] <= 12'b000000000000;
        addressToWrite <= 3'b000;
    end
    
   else if( write )
        begin
            case( addressToWrite )
                3'b000 : begin
                    ram[0] <= in;
                end
                3'b001 : begin
                    ram[1] <= in;
                end
                3'b010 : begin
                    ram[2] <= in;
                end
                3'b011 : begin
                    ram[3] <= in;
                end
                3'b100 : begin
                    ram[4] <= in;
                end
                3'b101 : begin
                    ram[5] <= in;
                end
                3'b110 : begin
                    ram[6] <= in;
                end
                3'b111 : begin
                    ram[7] <= in;
                end
            endcase
            addressToWrite <= addressToWrite + 1;
        end
         case( address )
                3'b000 : out = ram[0];
                3'b001 : out = ram[1];
                3'b010 : out = ram[2];
                3'b011 : out = ram[3];
                3'b100 : out = ram[4];
                3'b101 : out = ram[5];
                3'b110 : out = ram[6];
                3'b111 : out = ram[7];
                endcase 
end

         

endmodule
