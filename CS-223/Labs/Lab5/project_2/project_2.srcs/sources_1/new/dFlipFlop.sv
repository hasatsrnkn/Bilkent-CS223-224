`timescale 1ns / 1ps

module dFlipFlop( input logic d, clk, reset, output logic q );

always_ff@(posedge clk)
begin 
    if(reset)
        q <= 0;
    else 
        q <= d;
end

endmodule
