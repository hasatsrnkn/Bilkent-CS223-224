`timescale 1ns / 1ps

module testbench5();
    
logic a,b,c,d;
logic out;    

functionF dut(a,b,c,d,out);
      initial begin
        for (int i=0; i<16; i=i+1)
            begin
                {a,b,c,d} = i; #10;
            end    
    end
endmodule
