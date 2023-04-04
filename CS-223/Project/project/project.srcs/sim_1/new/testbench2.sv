`timescale 1ns / 1ps
module testbench2();
logic clk, load ; 
logic [11:0] in, out;  

instructionRegister dut(clk, load, in, out); 

always
    begin 
        clk <= 1; # 5; clk <= 0; # 5; 
    end 

initial begin 

        load = 0;
        in = 12'b101010000001; # 10; 
        in = 12'b110010000001; # 10;  
        
        load = 1;
        in = 12'b100100100000; # 10; 
        in = 12'b010010101001; # 10;  
        in = 12'b000000010010; # 10; 
        in = 12'b000110010010; # 10; 
        in = 12'b001000010100; # 10; 
        in = 12'b101010000001; # 10; 
        in = 12'b110010000001; # 10;  
        in = 12'b010000000000; # 10; 
        in = 12'b011000000000; # 10; 
        in = 12'b100000000000; # 10; 
        in = 12'b100000000011; # 10; 
        in = 12'b010010101000; # 10; 
        in = 12'b010110100000; # 10; 
        in = 12'b000000011000; # 10; 
    end
endmodule
