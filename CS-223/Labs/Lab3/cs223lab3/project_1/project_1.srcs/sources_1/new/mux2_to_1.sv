`timescale 1ns / 1ps

module mux2_to_1( input s, x, [1:0]in, output out );
    assign out = (~x & s & in[0]) || (x & s & in[1]);
endmodule
