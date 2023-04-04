`timescale 1ns / 1ps
module dataPath( input logic clk, RF_we1, RF_we2, RF_clr, reset, 
input logic [15:0] switch, 
input logic [2:0] RF_raddr1, RF_raddr2, RF_waddr1, RF_waddr2, input logic[3:0] M_rd,
input logic Reg_wr_sel1, Reg_wr_sel2, input logic [1:0] alu_sel,
output logic [3:0] aluResult1, aluResult2,
output logic [6:0] seven_segment_Display,output logic [3:0] an_out, 
output logic dp_out, output logic[3:0] rda2 );

logic clk_out;
logic[3:0] rda1, wrd1, wrd2;
clock_Divider divide( clk,clk_out );
fourBitMux2to1 mux1( switch[15:12], aluResult2, Reg_wr_sel2, wrd2 );
fourBitMux2to1 mux2( M_rd, aluResult1, Reg_wr_sel1, wrd1);

registerFile rf( clk_out, reset, RF_raddr1, RF_raddr2, RF_waddr1, RF_waddr2, wrd1, wrd2,
RF_we1, RF_we2, rda1, rda2 );
alu aluFile( rda1, rda2, alu_sel, aluResult1, aluResult2 );
sevenSegmentDisplay disp( clk, rda1, rda2, aluResult2, aluResult1, seven_segment_Display,
dp_out, an_out);

endmodule
