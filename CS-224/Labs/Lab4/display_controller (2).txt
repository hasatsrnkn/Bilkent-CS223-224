////////////////////////////////////////////////////////
//  
//  This module puts 4 hexadecimal values (from O to F) on the 4-digit 7-segment display unit
//  
//  Inputs/Outputs:  
//  clk: the system clock on the BASYS3 board
//  in3, in2, in1, in0: the input hexadecimal values. in3(left), in2, in1, in0(right)         
//  seg: the signals going to the segments of a digit.
//       seg[6] is CA for the a segment, seg[5] is CB for the b segment, etc
//  an:  anode, 4 bit enable signal, one bit for each digit
//       an[3] is the left-most digit, an[2] is the second-left-most, etc  
//  dp:  digital point
//  
//  Usage for CS224 Lab4-5: 
//  - Give the system clock of BASYS3 and the hexadecimal values you want to display as inputs.
//  - Send outputs to 7-segment display of BASYS3, using the .XDC file
//
//  Note: the an, seg and dp outputs are active-low, for the BASYS3 board
//
//  For correct connections, carefully plan what should be in the .XDC file
//   
////////////////////////////////////////////////////////

module display_controller(

input clk,
input [3:0] in3, in2, in1, in0,
output [6:0]seg, logic dp,
output [3:0] an
);

localparam N = 18;

logic [N-1:0] count = {N{1'b0}};
always@ (posedge clk)
count <= count + 1;

logic [4:0]digit_val;

logic [3:0]digit_en;
always@ (*)

begin
digit_en = 4'b1111;
digit_val = in0;

case(count[N-1:N-2])

2'b00 :	//select first 7Seg.

begin
digit_val = {1'b0, in0};
digit_en = 4'b1110;
end

2'b01:	//select second 7Seg.

begin
digit_val = {1'b0, in1};
digit_en = 4'b1101;
end

2'b10:	//select third 7Seg.

begin
digit_val = {1'b0, in2};
digit_en = 4'b1011;
end

2'b11:	//select forth 7Seg.

begin
digit_val = {1'b0, in3};
digit_en = 4'b0111;
end
endcase
end

//Convert digit number to LED vector. LEDs are active low.

logic [6:0] sseg_LEDs;
always @(*)
begin
sseg_LEDs = 7'b1111111; //default
case( digit_val)
5'd0 : sseg_LEDs = 7'b1000000; //to display 0
5'd1 : sseg_LEDs = 7'b1111001; //to display 1
5'd2 : sseg_LEDs = 7'b0100100; //to display 2
5'd3 : sseg_LEDs = 7'b0110000; //to display 3
5'd4 : sseg_LEDs = 7'b0011001; //to display 4
5'd5 : sseg_LEDs = 7'b0010010; //to display 5
5'd6 : sseg_LEDs = 7'b0000010; //to display 6
5'd7 : sseg_LEDs = 7'b1111000; //to display 7
5'd8 : sseg_LEDs = 7'b0000000; //to display 8
5'd9 : sseg_LEDs = 7'b0010000; //to display 9
5'd10: sseg_LEDs = 7'b0001000; //to display a
5'd11: sseg_LEDs = 7'b0000011; //to display b
5'd12: sseg_LEDs = 7'b1000110; //to display c
5'd13: sseg_LEDs = 7'b0100001; //to display d
5'd14: sseg_LEDs = 7'b0000110; //to display e
5'd15: sseg_LEDs = 7'b0001110; //to display f
5'd16: sseg_LEDs = 7'b0110111; //to display "="
default : sseg_LEDs = 7'b0111111; //dash 
endcase
end

assign an = digit_en;

assign seg = sseg_LEDs;
assign dp = 1'b1; //turn dp off

endmodule
