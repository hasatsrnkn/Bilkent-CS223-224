`timescale 1ns / 1ps
module clockDivider( input clk, input reset, output out);

logic[30:0] count = {31{1'b0}};
localparam localParamater = 150000000;

always@(posedge clk)
begin
    if ( count == localParamater || reset == 1)
        count <= {32{1'b0}};
    else 
        count <= count + 1;

end

assign out = {count == localParamater - 1};

endmodule
