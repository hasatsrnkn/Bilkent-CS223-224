`timescale 1ns / 1ps


module testbench3();

 logic clk;
 logic clear;
 logic [2:0] address1, address2, writeAddress, writeAddress2;
 logic [3:0] writeData, writeData2;
 logic writeEnable1, writeEnable2;
 logic [3:0] out1, out2;
 
 registerFile dut( clk, clear, address1, address2, writeAddress, writeAddress2, writeData, writeData2,
    writeEnable1, writeEnable2, out1, out2);
    
   
    always
    begin 
        clk <= 1; # 5; clk <= 0; # 5; 
    end 
    
    initial begin
    clear = 1; writeEnable1 = 0; writeEnable2= 0; #5;
    clear = 0; 
    address1 = 3'b001; address2 = 3'b000; #5;
    writeAddress = 3'b000; writeAddress2 = 3'b001; #5;
    writeEnable1 = 1;
    writeData = 4'b0001; #5;
    writeData2 = 4'b0001; #5;
    writeEnable2 = 1;
    writeData = 4'b0001; #5;
    writeData2 = 4'b0001; #5;
    address1 = 3'b100; address2 = 3'b101; #5;
    writeAddress = 3'b100; writeAddress2 = 3'b101; #5;
    writeEnable1 = 1;
    writeData = 4'b0101; #5;
    writeData2 = 4'b0101; #5;
    writeEnable2 = 1;
    writeData = 4'b0111; #5;
    writeData2 = 4'b1001; #5;
    clear = 1; #15;
    clear = 0;
    
    
    end
 
 




endmodule
