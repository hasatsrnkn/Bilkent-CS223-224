`timescale 1ns / 1ps
module trafficSystem( input logic clk, reset, sA, sB, output logic [2:0]lA, [2:0]lB );

typedef enum logic[3:0] { S0,S1,S2,S3,S4,S5,S6,S7,S8,S9 }statetype;
statetype[2:0] currentState, nextState;
logic out;
parameter red = 3'b111;
parameter green = 3'b110;
parameter yellow = 3'b100;

clockDivider clock( clk,reset,out);
always_ff@(posedge out, posedge reset)
    if (reset) 
        currentState <= S0;
    else
        currentState <= nextState;

always_comb
case (currentState) 
    S0:
        if (!sB)
            nextState = S0; 
        else if (sA && sB)
            nextState = S1;
        else if ( !sA && sB)
            nextState = S2;
    S1:
        nextState = S2;
    S2:
        nextState = S3;
    S3:
        nextState = S4;
    S4: 
        nextState = S5;
    S5:
        if (!sA) 
            nextState = S5;
         else if (sA && sB) 
            nextState = S6;
         else if (sA && !sB) 
            nextState = S7;
    S6:
        nextState = S7;
    S7:
        nextState = S8;
    S8:
        nextState = S9;
    S9:
        nextState = S0;
    default: 
        nextState = S0;
endcase

always_comb
case (currentState)
    S0:
       {lA, lB} = {green, red};
    S1:
       {lA, lB} = {green, red};
    S2:
       {lA, lB} = {yellow, red};     
    S3:
       {lA, lB} = {red, red};      
    S4:
       {lA, lB} = {red, yellow};      
    S5:
       {lA, lB} = {red, green};        
    S6:
       {lA, lB} = {red, green}; 
    S7:
       {lA, lB} = {red, yellow};        
    S8:
       {lA, lB} = {red, red};
    S9:
       {lA, lB} = {yellow, red}; 
    default:
       {lA, lB} = {green, red};
endcase 
        
endmodule
