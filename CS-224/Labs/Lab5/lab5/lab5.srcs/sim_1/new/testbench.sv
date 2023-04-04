`timescale 1ns / 1ps



module testbench();

    logic clk;
    logic reset;
    logic[31:0]  instrF;
    logic[31:0] PC, PCF;
    logic PcSrcD;
    logic MemWriteD, MemtoRegD, ALUSrcD, BranchD, RegDstD, RegWriteD;
    logic [2:0]  alucontrol;
    logic [31:0] instrD;
    logic [31:0] ALUOutE, WriteDataE;
    logic [1:0] ForwardAE, ForwardBE;
    logic ForwardAD, ForwardBD;
    logic [31:0] SrcAE,SrcBE;
    logic ALURD;
    
    top_mips dut( clk,reset,instrF,PC,PCF,PcSrcD,MemWriteD,MemtoRegD,ALUSrcD,BranchD,
    RegDstD,RegWriteD,alucontrol,instrD,ALUOutE,WriteDataE,ForwardAE,ForwardBE,
    ForwardAD,ForwardBD,SrcAE,SrcBE,ALURD);
    
    always 
    begin 
        clk <= 1; #5; clk <= 0; #5;
    end
    
    initial begin
    reset = 1; #10;
    reset = 0; #10;
    
    
    
    end

endmodule
