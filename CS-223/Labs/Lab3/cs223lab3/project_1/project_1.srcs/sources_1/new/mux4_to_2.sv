`timescale 1ns / 1ps

module mux4_to_1( input x, [1:0]s, [3:0]in, output output1 );
 
logic [1:0]output2;
 
mux2_to_1 mux1(x,s[0],in[1:0],output2[0]);
mux2_to_1 mux2(x,s[0],in[3:2],output2[1]);
mux2_to_1 mux3(x,s[1],output2[1:0],output1);

endmodule
