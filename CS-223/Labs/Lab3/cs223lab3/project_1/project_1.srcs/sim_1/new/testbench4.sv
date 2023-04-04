`timescale 1ns / 1ps

module testbench4();
logic [7:0]in;
logic [2:0]s;
logic out;

mux8_to_1 dut(s,in,out);

    initial begin
        for (int i=0; i<2048; i=i+1)
            begin
                {in,s} = i; #1;
            end    
    end

endmodule