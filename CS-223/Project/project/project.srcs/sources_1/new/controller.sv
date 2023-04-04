`timescale 1ns / 1ps
module controller( input logic clk, reset, pbLeft, pbMiddle, pbRight, 
pbTop, pbBottom, input logic [11:0] IR_out, input logic[15:0] switch,
output logic isExternal, PC_clr, PC_ld, IM_clr, IM_en, IM_wr, IM_rd, IR_ld,
M_clr, M_re, M_we, RF_clr, RF_we1, RF_we2, 
output logic [3:0] M_add, output logic [2:0] RF_raddr1, RF_raddr2, RF_waddr1, RF_waddr2, 
output logic [1:0] ALU_sel, output logic Reg_wr_sel1, Reg_wr_sel2, output logic[11:0] out
);

typedef enum logic [3:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10,
S11, S12, S13, S14, S15} statetype;
statetype[3:0] curState;
statetype[3:0] nextState;

always_ff@( posedge clk or posedge reset )
    if( reset ) begin
        curState <= S0;
    end
    else begin
        curState <= nextState;
    end
    
    reg [2:0]most_significant_B;   
    always_comb
    case( curState )
        S0: begin
            isExternal = 1'b0;
            PC_clr = 1'b1;
            PC_ld = 1'b0;
            IM_en = 1'b0;
            IM_rd = 1'b0;
            IM_wr = 1'b0;
            IM_clr = 1'b1;
            IR_ld = 1'b0;
            M_clr = 1'b1;
            M_re = 1'b0;
            M_we = 1'b0;
            RF_clr = 1'b1;
            RF_we1 = 1'b0;
            RF_we2 = 1'b0;
            Reg_wr_sel1 = 1'b0;
            Reg_wr_sel2 = 1'b0;
            RF_raddr1 = 3'b000;
            RF_raddr2 = 3'b000;
            out = 12'b000000000001;
            nextState = S1;
        end
        
        S1: begin
            isExternal = 1'b0;
            PC_clr = 1'b0;
            PC_ld = 1'b0;
            IM_en = 1'b0;
            IM_rd = 1'b0;
            IM_wr = 1'b0;
            IM_clr = 1'b0;
            IR_ld = 1'b0;
            M_clr = 1'b0;
            M_re = 1'b0;
            M_we = 1'b0;
            RF_clr = 1'b0; //
            RF_we1 = 1'b0;
            RF_we2 = 1'b0;

            out = 12'b000000000011;
            if( pbTop ) begin
                nextState = S2; 
            end
            else if( pbMiddle ) begin
                nextState = S4;
            end
            else if( pbLeft ) begin
                nextState = S5;
            end    
            else if( pbRight ) begin
                nextState = S6;
            end
           
            else begin
                nextState = S1;
            end    
            
        end
        
        S2: begin
            RF_waddr2 = switch[11:9];
            isExternal = 1'b0;
            PC_clr = 1'b0;
            PC_ld = 1'b0;
            IM_en = 1'b0;
            IM_rd = 1'b0;
            IM_wr = 1'b0;
            IM_clr = 1'b0;
            IR_ld = 1'b0;
            M_clr = 1'b0;
            M_re = 1'b0;
            M_we = 1'b0;
            RF_clr = 1'b0;
            RF_we1 = 1'b0;
            RF_we2 = 1'b1;
            Reg_wr_sel1 = 1'b0;
            Reg_wr_sel2 = 1'b1; 
            nextState = S1;
            out = 12'b000000000111; 
        end
        
        S4: begin
            isExternal = 1'b0;
            PC_clr = 1'b0;
            PC_ld = 1'b0;
            IM_en = 1'b1;
            IM_rd = 1'b0;
            IM_wr = 1'b1;
            IM_clr = 1'b0;
            IR_ld = 1'b0;
            M_clr = 1'b0;
            M_re = 1'b0;
            M_we = 1'b0;
            RF_clr = 1'b0; //
            RF_we1 = 1'b0;
            RF_we2 = 1'b0;
            Reg_wr_sel1 = 1'b0;
            Reg_wr_sel2 = 1'b0; 
            nextState = S1;
            out = 12'b000000001111; 
        end
        
      S5: begin
            isExternal = 1'b0;
            PC_clr = 1'b0;
            IM_en = 1'b1;
            IM_rd = 1'b1;
            IM_wr = 1'b0;
            IM_clr = 1'b0;
            IR_ld = 1'b1;
            M_clr = 1'b0;
            M_re = 1'b0;
            M_we = 1'b0;
            RF_clr = 1'b0;
            RF_we1 = 1'b0;
            RF_we2 = 1'b0;
            Reg_wr_sel1 = 1'b0;
            Reg_wr_sel2 = 1'b0;
            PC_ld = 1'b1;
            most_significant_B <= IR_out[11:9];
            out = 12'b000000011111;  
            nextState = S7;         
      end
        
      S6: begin
            isExternal = 1'b1;
            PC_clr = 1'b0;
            PC_ld = 1'b0;
            IM_en = 1'b0;
            IM_rd = 1'b0;
            IM_wr = 1'b0;
            IM_clr = 1'b0;
            IR_ld = 1'b1;
            M_clr = 1'b0;
            M_re = 1'b0;
            M_we = 1'b0;
            RF_clr = 1'b0;
            RF_we1 = 1'b0;
            RF_we2 = 1'b0;
            Reg_wr_sel1 = 1'b0;
            Reg_wr_sel2 = 1'b0;
            most_significant_B <= IR_out[11:9]; 
            out = 12'b000000111111;  
            nextState = S7;
      end
        
      S7: begin
            PC_clr = 1'b0;
            PC_ld = 1'b0;
            IM_en = 1'b0;
            IM_rd = 1'b0;
            IM_wr = 1'b0;
            IM_clr = 1'b0;
            IR_ld = 1'b1;
            most_significant_B <= IR_out[11:9];
            M_clr = 1'b0;
            M_re = 1'b0;
            M_we = 1'b0;
            RF_clr = 1'b0;
            RF_we1 = 1'b0;
            RF_we2 = 1'b0;
            Reg_wr_sel1 = 1'b0;
            Reg_wr_sel2 = 1'b0;
            out = IR_out;
            if( most_significant_B == 3'b000 ) begin
                nextState = S8;
            end
            else if( most_significant_B == 3'b001 ) begin 
                nextState = S9;
            end
            else if( most_significant_B == 3'b010 ) begin
                nextState = S10;
            end
            else if( most_significant_B == 3'b011 ) begin
                nextState = S11;
            end
            else if( most_significant_B == 3'b100 ) begin
                nextState = S12;
            end
            else if( most_significant_B == 3'b101 ) begin
                nextState = S13;
            end
            else if( most_significant_B == 3'b110 ) begin
                nextState = S14;
            end       
      end
        
      S8: begin
            out = 12'b000011111111;
            M_add = IR_out[3:0];
            RF_waddr1 = IR_out[6:4];
            M_clr = 1'b0;
            M_re = 1'b1;
            M_we = 1'b0;
            RF_clr = 1'b0;
            RF_we1 = 1'b1;
            Reg_wr_sel1 = 1'b1;
            Reg_wr_sel2 = 1'b0;

            if ( pbTop ) begin
                 nextState = S1; 

            end
            else begin
                nextState = S8;
            end
            
      end
      
      S9: begin
            out = 12'b000111111111; 
            RF_raddr2 = IR_out[6:4]; 
            M_add = IR_out[3:0];
            M_clr = 1'b0;
            M_re = 1'b0;
            M_we = 1'b1;
            RF_clr = 1'b0;
            RF_we1 = 1'b0;
            RF_we2 = 1'b0;
            Reg_wr_sel1 = 1'b0;
            Reg_wr_sel2 = 1'b0;
            
            if ( pbTop ) begin
                 nextState = S1; 

            end
            else begin
                nextState = S9;
            end
             
            
              
      end
      
      S10: begin
            out = 12'b001111111111;  
            RF_raddr1 = IR_out[2:0];
            RF_raddr2 = IR_out[5:3];
            RF_waddr1 = IR_out[8:6];
            ALU_sel = 2'b01;
            RF_clr = 1'b0;
            RF_we1 = 1'b1;
            RF_we2 = 1'b0;
            Reg_wr_sel1 = 1'b0;
            
           if ( pbTop ) begin
                 nextState = S1; 

            end
            else begin
                nextState = S10;
            end
  
      end
      
      S11: begin
            RF_raddr1 = IR_out[2:0];
            RF_raddr2 = IR_out[5:3];
            RF_waddr1 = IR_out[8:6];
            ALU_sel = 2'b00;
            RF_clr = 1'b0;
            RF_we1 = 1'b1;
            RF_we2 = 1'b0;
            Reg_wr_sel1 = 1'b0;
            out = 12'b011111111111; 
            
            if ( pbTop ) begin
                 nextState = S1; 

            end
            else begin
                nextState = S11;
            end 
           
      end
     
      S12: begin
            RF_raddr1 = IR_out[2:0];
            RF_raddr2 = IR_out[5:3];
            RF_waddr1 = IR_out[8:6];
            ALU_sel = 2'b10;
            RF_clr = 1'b0;
            RF_we1 = 1'b1;
            RF_we2 = 1'b0;    
            Reg_wr_sel1 = 1'b0;
            out = 12'b111111111111; 
            
            if ( pbTop ) begin
                 nextState = S1; 

            end
            else begin
                nextState = S12;
            end 
            
           
      end
      
      S13: begin
            RF_raddr1 = IR_out[2:0];
            RF_raddr2 = IR_out[5:3];
            RF_waddr1 = IR_out[8:6];
            
            case( IR_out[8:6] )
                3'b000: begin
                    RF_waddr2 = 3'b001;
                end
                3'b001: begin
                    RF_waddr2 = 3'b010;
                end
                3'b010: begin
                    RF_waddr2 = 3'b011;
                end
                3'b011: begin
                    RF_waddr2 = 3'b100;
                end
                3'b100: begin
                    RF_waddr2 = 3'b101;
                end
                3'b101: begin
                    RF_waddr2 = 3'b110;
                end          
                3'b110: begin
                    RF_waddr2 = 3'b111;
                end 
                3'b111: begin
                    RF_waddr2 = 3'b000;
                end 
                        
            endcase
            ALU_sel = 2'b11;
            RF_we1 = 1'b1;
            RF_we2 = 1'b1;
            Reg_wr_sel1 = 1'b0;
            Reg_wr_sel2 = 1'b0;
            
            if ( pbTop ) begin
                 nextState = S1; 

            end
            else begin
                nextState = S13;
            end 
     
            
      end
      
      S14: begin 
            RF_raddr1 = IR_out[2:0];
            RF_clr = 1'b0;
            RF_we1 = 1'b0;
            RF_we2 = 1'b0;
            if ( pbTop ) begin
                 nextState = S1; 

            end
            else begin
                nextState = S14;
            end 
           
      end
    
    endcase 


endmodule
