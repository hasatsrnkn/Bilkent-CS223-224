`timescale 1ns / 1ps

module functionF( input a,b,c,d, output out);

logic invD;
logic [2:0]s;
logic [7:0]in;

not( invD, d );

assign in[0] = 0;
assign in[1] = d;
assign in[2] = d;
assign in[3] = d;
assign in[4] = invD;
assign in[5] = invD;
assign in[6] = invD;
assign in[7] = 0;
assign s[0] = c;
assign s[1] = b;
assign s[2] = a;

mux8_to_1 mux(s,in,out);
    
endmodule

