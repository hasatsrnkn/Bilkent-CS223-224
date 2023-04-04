`timescale 1ns / 1ps

module testbench1();
    logic x, in;
    logic [1:0] out;

    decoder1_to_2 dut( x, in, out);
    initial begin
        x = 0; in = 0; #10;
        x = 0; in = 1; #10;
      	x = 1; in = 0; #10;
      	x = 1; in = 1; #10;
    end

endmodule
