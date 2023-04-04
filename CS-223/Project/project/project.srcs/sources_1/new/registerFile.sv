`timescale 1ns / 1ps
module registerFile( input logic clk, input logic clear, 
input logic[2:0] address1, input logic[2:0] address2, 
input logic [2:0] writeAddress1, input logic [2:0] writeAddress2, 
input logic [3:0] writeData, input logic [3:0] writeData2, 
input logic writeEnable, input logic writeEnable2,
output logic[3:0] readData1, output logic[3:0] readData2 );

    reg [3:0] ram [0:7];
    initial begin
        ram[0] <= 1;
        ram[1] <= 1;
        ram[2] <= 1;
        ram[3] <= 1;
        ram[4] <= 1;
        ram[5] <= 1;
        ram[6] <= 1;
        ram[7] <= 1;
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
        end
        
        else
        begin
                if( writeEnable )
                begin
                    case( writeAddress1 )
                    3'b000: begin
                        ram[0] <= writeData;
                    end
                    3'b001: begin
                        ram[1] <= writeData;
                    end
                    3'b010: begin
                        ram[2] <= writeData;
                    end
                    3'b011: begin
                        ram[3] <= writeData;
                    end
                    3'b100: begin
                        ram[4] <= writeData;
                    end 
                    3'b101: begin
                        ram[5] <= writeData;
                    end
                    3'b110: begin
                        ram[6] <= writeData;
                    end
                    3'b111: begin
                        ram[7] <= writeData;
                    end
                    endcase
                end
                
                if( writeEnable2 )
                begin
                    case( writeAddress2 )
                    3'b000: begin
                        ram[0] <= writeData2;
                    end
                    3'b001: begin
                        ram[1] <= writeData2;
                    end
                    3'b010: begin
                        ram[2] <= writeData2;
                    end
                    3'b011: begin
                        ram[3] <= writeData2;
                    end
                    3'b100: begin
                        ram[4] <= writeData2;
                    end 
                    3'b101: begin
                        ram[5] <= writeData2;
                    end
                    3'b110: begin
                        ram[6] <= writeData2;
                    end
                    3'b111: begin
                        ram[7] <= writeData2;
                    end
                    endcase
                end
                   
            
            
            case( address1 )
                3'b000 : readData1 <= ram[0];
                3'b001 : readData1 <= ram[1];
                3'b010 : readData1 <= ram[2];
                3'b011 : readData1 <= ram[3];
                3'b100 : readData1 <= ram[4];
                3'b101 : readData1 <= ram[5];
                3'b110 : readData1 <= ram[6];
                3'b111 : readData1 <= ram[7];
            endcase
            
            case( address2 )
                3'b000 : readData2 <= ram[0];
                3'b001 : readData2 <= ram[1];
                3'b010 : readData2 <= ram[2];
                3'b011 : readData2 <= ram[3];
                3'b100 : readData2 <= ram[4];
                3'b101 : readData2 <= ram[5];
                3'b110 : readData2 <= ram[6];
                3'b111 : readData2 <= ram[7];
            endcase    
        end  
    end

endmodule






