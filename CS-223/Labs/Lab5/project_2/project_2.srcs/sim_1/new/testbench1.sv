`timescale 1ns / 1ps

module testbench1();
logic clk, reset, shift, load;
logic [7:0] in, q;
shiftRegister dut(clk, reset, shift, load, in, q);
initial begin
    reset <= 1;
    reset <= 0;
    shift <= 0;
    load <= 1;
    in[0] <= 0; #5;
    in[1] <= 1; #5;
    in[2] <= 1; #5;
    in[3] <= 0; #5;
    in[4] <= 1; #5;
    in[5] <= 0; #5;
    in[6] <= 1; #5;
    in[7] <= 0; #5;
    load <= 0;
    shift <= 1;
end
always
begin
    clk <= 1; #1;
    clk <= 0; #1;
end


endmodule
