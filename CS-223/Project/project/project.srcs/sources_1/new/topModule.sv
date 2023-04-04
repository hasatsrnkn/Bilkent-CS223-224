`timescale 1ns / 1ps
module topModule( input logic clk, leftButton, middleButton, rightButton, topButton, bottomButton,
input logic[15:0] switch, output logic dp, 
output logic [6:0] seven_segment_D, output logic[3:0] an, output logic [11:0] out);

    logic[3:0] M_add, M_rd, M_wd;
    logic M_re, M_we, M_clr;
    logic RF_clr, RF_we1, RF_we2;
    logic[2:0] RF_radd1, RF_radd2, RF_wa1, RF_wa2;
    logic isExternal;
    logic Reg_wr_sel1, Reg_wr_sel2;
    logic [1:0] alu_sel;
    logic [3:0] aluResult1, aluResult2;
    logic [3:0] RF_wd2;
    logic clk_out;
    logic[3:0] rda2;
      
    clock_Divider divide( clk, clk_out );  
    
    controlUnit controlU( clk_out, bottomButton, leftButton, middleButton, rightButton, topButton,
    bottomButton, switch, isExternal, M_clr, M_re, M_we, RF_clr, RF_we1, RF_we2, 
    M_add, RF_radd1, RF_radd2, RF_wa1, RF_wa2, RF_wd2, alu_sel, Reg_wr_sel1, Reg_wr_sel2, out  );
    
    dataMemory dataMem( clk_out, bottomButton, M_re, M_we, M_add, rda2, M_rd );
    
    dataPath dataP( clk, RF_we1, RF_we2, RF_clr, bottomButton, switch, RF_radd1, RF_radd2, RF_wa1, RF_wa2,
    M_rd, Reg_wr_sel1, Reg_wr_sel2, alu_sel, aluResult1, aluResult2, seven_segment_D, an, dp, rda2);
  
    
    
endmodule
