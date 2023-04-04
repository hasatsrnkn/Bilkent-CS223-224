`timescale 1ns / 1ps
module debouncer( input logic clk, input logic btn, output logic pulse);
    logic [24:0] counter;
    typedef enum logic [1:0] { S0, S1, S2, S3 } states;
    states state, nextState;
    logic gotInput;
    
    always_ff@(posedge clk)
        begin    
            state <= nextState;
            if(gotInput)
                counter <= 25000000;
            else
                counter <= counter - 1;
        end
    always_comb
        case(state)
            S0: if(btn) 
                    begin
                        nextState = S1;    
                        gotInput = 1;
                    end
                else 
                    begin 
                        nextState = S0; 
                        gotInput = 0; 
                    end
            S1: begin 
                nextState = S2; gotInput = 0; 
                end
                
            S2: begin 
                nextState = S3; gotInput = 0; 
                end
                
            S3: begin 
            if(counter == 0) 
                nextState = S0; 
            else 
                nextState = S3; gotInput = 0; 
            end
            
            default: begin 
                nextState = S0; gotInput = 0; 
            end
            
            endcase
    assign pulse = ( state == S1 );

endmodule
