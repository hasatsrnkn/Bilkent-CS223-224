`timescale 1ns / 1ps
module controlUnit( input logic clk, reset, leftButton, middleButton, rightButton,
topButton, bottomButton, input logic [15:0] switch, output logic isExternal,
M_clr, M_re, M_we, RF_clr, RF_we1, RF_we2, 
output logic [3:0] M_add, output logic [2:0] RF_raddr1, RF_raddr2, RF_waddr1, RF_waddr2, 
output logic [3:0]RF_wdata2, output logic [1:0] ALU_sel, output logic Reg_wr_sel1, Reg_wr_sel2,  output logic[11:0] out );

logic [2:0] PC_in, PC_out;
logic [11:0] IM_out, mux_out, IR_out;
logic PC_ld, IM_en, IM_wr, IM_clr, IM_rd, IR_ld, PC_clr;
 logic btn;

controller controll( clk, reset, leftButton, middleButton, rightButton, topButton, bottomButton,
IR_out, switch, isExternal, PC_clr, PC_ld, IM_clr, IM_en, IM_wr, IM_rd, IR_ld, M_clr,
M_re, M_we, RF_clr, RF_we1, RF_we2, M_add, RF_raddr1, RF_raddr2, RF_waddr1, RF_waddr2, ALU_sel, Reg_wr_sel1, Reg_wr_sel2,  out ); 


programCounter pc( clk, reset, leftButton, PC_out );

or(btn, leftButton, rightButton);
instructionMemory im( clk, reset, middleButton, PC_out, switch[11:0], IM_out );
twelveBitMux2to1 mux( switch[11:0], IM_out, isExternal, mux_out );

instructionRegister ir( clk, IR_ld, mux_out, IR_out );







endmodule
