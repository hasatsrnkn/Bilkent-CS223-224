`timescale 1ns / 1ps

module testbench2();
logic clk, reset, shift, load;
logic [7:0] a, b, registerSum;
serialAdder dut(clk, reset, shift, load, a, b,registerSum);
initial begin
    reset <= 1; #5;
    a[0] <= 0; #5;
    a[1] <= 1; #5;
    a[2] <= 0; #5;
    a[3] <= 0; #5;
    a[4] <= 0; #5;
    a[5] <= 1; #5;
    a[6] <= 0; #5;
    a[7] <= 0; #5;
    b[0] <= 1; #5;
    b[1] <= 1; #5;
    b[2] <= 0; #5;
    b[3] <= 0; #5;
    b[4] <= 1; #5;
    b[5] <= 0; #5;
    b[6] <= 1; #5;
    b[7] <= 0; #5;
    reset <= 0; #5;
    shift <= 0; #5;
    load <= 1; #5;
    a[0] <= 0; #5;
    a[1] <= 1; #5;
    a[2] <= 0; #5;
    a[3] <= 1; #5;
    a[4] <= 0; #5;
    a[5] <= 1; #5;
    a[6] <= 0; #5;
    a[7] <= 0; #5;
    b[0] <= 1; #5;
    b[1] <= 0; #5;
    b[2] <= 0; #5;
    b[3] <= 1; #5;
    b[4] <= 0; #5;
    b[5] <= 1; #5;
    b[6] <= 0; #5;
    b[7] <= 1; #5;
    load <= 0; #5;
    shift <= 1; #5;
   shift <= 0;  #5;
    shift <= 1;  #5;
    shift <= 0;  #5;
    shift <= 1; #5;
   shift <= 0;  #5;
    shift <= 1;  #5;
    shift <= 0;  #5;
    shift <= 1; #5;
   shift <= 0;  #5;
    shift <= 1;  #5;
    shift <= 0;  #5;
    shift <= 1; #5;
   shift <= 0;  #5;
    shift <= 1;  #5;
    shift <= 0;  #5;
    shift <= 1; #5;
   shift <= 0;  #5;
    shift <= 1;  #5;
    shift <= 0;  #5;
    shift <= 1; #5;
   shift <= 0;  #5;
    shift <= 1;  #5;
    shift <= 0;  #5;
    reset <= 1;
    
end
always
begin
    clk <= 1; #1;
    clk <= 0; #1;
end


endmodule
