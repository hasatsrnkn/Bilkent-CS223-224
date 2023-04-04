`timescale 1ns / 1ps

module mux8_to_1( input [2:0]s, [7:0]in, output output1);

logic [1:0]output2;
logic s2, d0, d1;

mux4_to_1 mux1(1,s[1:0],in[3:0], output2[0]);
mux4_to_1 mux2(1,s[1:0],in[7:4], output2[1]);

not( s2, s[2]);

and(d0,s2,output2[0]);
and(d1,s[2],output2[1]);

or(output1,d0,d1);

endmodule

