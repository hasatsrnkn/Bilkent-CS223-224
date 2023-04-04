`timescale 1ns / 1ps
module testbench();


logic clk, reset, sA, sB;
logic [2:0] lA, lB;
trafficSystem dut(clk, reset, sA, sB, lA, lB);


initial begin
    reset <= 1;
    sA <= 1; sB <= 0; #50;
    sA <= 0;  #50;
    sB <= 1; #50;
    sA <= 1;  #50;
    reset <= 0;
    sA <= 1; sB <= 0; #50;
    sA <= 0;  #50;
    sB <= 1; #50;
    sA <= 1;  #50;
end

always
begin
    clk <= 1; #1;
    clk <= 0; #1;
end


endmodule
