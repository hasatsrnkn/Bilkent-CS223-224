`timescale 1ns / 1ps

module decoder1_to_2(input x, in, output reg[1:0]out );
   always_comb
   if ( x == 1)
    begin
        if( in == 0 )
            begin
                out[0] = 1;
                out[1] = 0;
            end
        else
            begin
                out[0] = 0;
                out[1] = 1;
            end
    end  
    else
        begin
            out[0] = 0;
            out[1] = 0;
        end
        
endmodule            