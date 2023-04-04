module sumShiftRegister( input logic clk, input logic reset, 
input logic shift, input logic load, 
input logic in,
output logic[7:0] q
);

logic d0, d1, d2, d3, d4, d5, d6, d7;

dFlipFlop dff0(d0, clk, reset, q[0] );
dFlipFlop dff1(d1, clk, reset, q[1] );
dFlipFlop dff2(d2, clk, reset, q[2] );
dFlipFlop dff3(d3, clk, reset, q[3] );
dFlipFlop dff4(d4, clk, reset, q[4] );
dFlipFlop dff5(d5, clk, reset, q[5] );
dFlipFlop dff6(d6, clk, reset, q[6] );
dFlipFlop dff7(d7, clk, reset, q[7] );

always_ff @(posedge clk)
    begin 
    
       if(reset) 
       begin 
            d0 = 0;
            d1 = 0;
            d2 = 0;
            d3 = 0;
            d4 = 0;
            d5 = 0;
            d6 = 0;
            d7 = 0;
       end 
            
       if(shift)
       begin
              d7 = in;
              d6 = q[7];
              d5 = q[6];
              d4 = q[5];
              d3 = q[4];
              d2 = q[3];
              d1 = q[2];
              d0 = q[1];
         end       
        
    end 

endmodule
