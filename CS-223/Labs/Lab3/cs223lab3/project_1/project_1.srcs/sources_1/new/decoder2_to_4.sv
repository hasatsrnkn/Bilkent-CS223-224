`timescale 1ns / 1ps

module decoder2_to_4( input x, [1:0]in, output reg[3:0]out);

logic[1:0] enable;

decoder1_to_2 decoder1(x, in[1], enable[1:0]);
decoder1_to_2 decoder2(enable[0],in[0],out[1:0] );
decoder1_to_2 decoder3(enable[1],in[0],out[3:2] );

endmodule
