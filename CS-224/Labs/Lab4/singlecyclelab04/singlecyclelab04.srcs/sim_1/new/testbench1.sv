`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2022 19:28:27
// Design Name: 
// Module Name: testbench1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench1();

    logic clk;
    logic reset;
    logic [31:0] writedata, dataadr, pc, instr, readdata;
    logic memwrite;
    
    top dut( clk, reset, writedata, dataadr, pc, instr, readdata, memwrite);
    
    always 
    begin 
        clk <= 1; #5; clk <= 0; #5;
    end
    
    initial begin
    reset = 1; #5;
    reset = 0; #5;
    
    
    
    end

endmodule
