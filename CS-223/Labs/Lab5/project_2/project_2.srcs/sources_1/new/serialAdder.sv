`timescale 1ns / 1ps

module halfadder( input logic a, b, output logic sum, carry);
    
    assign sum = a ^ b;
    assign carry = a & b;
    
endmodule
    
module fulladder( input logic a, b, cin, output logic sum, cout);
	
	logic sum1, carry1, carry2;

    //Halfadders
	halfadder ha1(a, b, sum1, carry1);
	halfadder ha2(sum1, cin, sum, carry2);
	
	//Or gate 
	or( cout, carry1, carry2);

endmodule



module serialAdder( input logic clk, input logic reset,
input logic shift, input logic load,
input logic[7:0] a, input logic[7:0] b,
output logic[7:0] registerSum
);

logic d;
logic cin;
logic[7:0] aOut;
logic[7:0] bOut;
logic q;
logic sum;
logic cout;

shiftRegister sRA( clk, reset, shift, load, a, aOut);
shiftRegister sRB( clk, reset, shift, load, b, bOut);


fulladder fa(aOut[0], bOut[0], cin, sum, cout);
dFlipFlop dff( cout, clk, reset, cin);

sumShiftRegister sumShifter( clk, reset, shift, load, sum, registerSum);

endmodule
