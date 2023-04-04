// Define pipes that exist in the PipelinedDatapath. 
// The pipe between Writeback (W) and Fetch (F), as well as Fetch (F) and Decode (D) is given to you.
// Create the rest of the pipes where inputs follow the naming conventions in the book.
`timescale 1ns / 1ps


module PipeFtoD(input logic[31:0] instr, PcPlus4F,
                input logic EN, clear, clk, reset,
                output logic[31:0] instrD, PcPlus4D);

                always_ff @(posedge clk, posedge reset)
                  if(reset)
                        begin
                        instrD <= 0;
                        PcPlus4D <= 0;
                        end
                    else if(EN)
                        begin
                          if(clear) // Can clear only if the pipe is enabled, that is, if it is not stalling.
                            begin
                        	   instrD <= 0;
                        	   PcPlus4D <= 0;
                            end
                          else
                            begin
                        		instrD<=instr;
                        		PcPlus4D<=PcPlus4F;
                            end
                        end
                
endmodule

// Similarly, the pipe between Writeback (W) and Fetch (F) is given as follows.

module PipeWtoF(input logic[31:0] PC,
                input logic EN, clk, reset,		// ~StallF will be connected as this EN
                output logic[31:0] PCF);

                always_ff @(posedge clk, posedge reset)
                    if(reset)
                        PCF <= 0;
                    else if(EN)
                        PCF <= PC;
endmodule

module PipeDtoE(input logic[31:0] RD1, RD2, RD3, SignImmD,
                input logic[4:0] RsD, RtD, RdD,
                input logic RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, RegDstD,
                input logic[2:0] ALUControlD,
                input logic sraccEN, clear, clk, reset,
                output logic[31:0] RsData, RtData,RdData, SignImmE,
                output logic[4:0] RsE, RtE, RdE, 
                output logic RegWriteE, MemtoRegE, MemWriteE, ALUSrcE, RegDstE, sraccENE,
                output logic[2:0] ALUControlE);

        always_ff @(posedge clk, posedge reset)
          if(reset || clear)
                begin
                // Control signals
                RegWriteE <= 0;
                MemtoRegE <= 0;
                MemWriteE <= 0;
                ALUControlE <= 0;
                ALUSrcE <= 0;
                RegDstE <= 0;
                sraccENE <= 0;
                
                // Data
                RdData <= 0;
                RsData <= 0;
                RtData <= 0;
                RsE <= 0;
                RtE <= 0;
                RdE <= 0;
                SignImmE <= 0;
                end
            else
                begin
                // Control signals
                RegWriteE <= RegWriteD;
                MemtoRegE <= MemtoRegD;
                MemWriteE <= MemWriteD;
                ALUControlE <= ALUControlD;
                ALUSrcE <= ALUSrcD;
                RegDstE <= RegDstD;
                sraccENE <= sraccEN;
                
                // Data
                RsData <= RD1;
                RtData <= RD2;
                RdData <= RD3;
                RsE <= RsD;
                RtE <= RtD;
                RdE <= RdD;
                SignImmE <= SignImmD;
                end

endmodule

//filled
module PipeEtoM( input logic clk, reset,
                 RegWriteE, MemtoRegE, MemWriteE,
                 input logic[31:0] ALUOutE, WriteDataE,
                 input logic[4:0] WriteRegE,
                 output logic RegWriteM, MemtoRegM, MemWriteM,
                 output logic[31:0] ALUOutM, WriteDataM,
                 output logic[4:0] WriteRegM
                 );
                 
          always_ff @(posedge clk, posedge reset)
          if(reset)
            begin
            RegWriteM <= 0;
            MemtoRegM <= 0;
            MemWriteM <= 0;
            ALUOutM <= 0;
            WriteDataM <= 0;
            WriteRegM <= 0;
            end
          else
            begin
            RegWriteM <= RegWriteE;
            MemtoRegM <= MemtoRegE;
            MemWriteM <= MemWriteE;
            ALUOutM <= ALUOutE;
            WriteDataM <= WriteDataE;
            WriteRegM <= WriteRegE;
            end
                 
endmodule

//filled 
module PipeMtoW( input logic clk, reset,
                 RegWriteM, MemtoRegM,
                 input logic[31:0] ALUOutM, ReadDataM,
                 input logic[4:0] WriteRegM,
                 output logic RegWriteW, MemtoRegW,
                 output logic[31:0] ALUOutW, ReadDataW,
                 output logic[4:0] WriteRegW
                 );
                 
             
          always_ff @(posedge clk, posedge reset)
          if(reset)
            begin
            RegWriteW <= 0;
            MemtoRegW <= 0;
            ALUOutW <= 0;
            ReadDataW <= 0;
            WriteRegW <= 0;
            end
          else 
            begin
            RegWriteW <= RegWriteM;
            MemtoRegW <= MemtoRegM;
            ALUOutW <= ALUOutM;
            ReadDataW <= ReadDataM;
            WriteRegW <= WriteRegM;
            end  
                  
endmodule



// *******************************************************************************
// End of the individual pipe definitions.
// ******************************************************************************

// *******************************************************************************
// Below is the definition of the datapath.
// The signature of the module is given. The datapath will include (not limited to) the following items:
//  (1) Adder that adds 4 to PC
//  (2) Shifter that shifts SignImmD to left by 2
//  (3) Sign extender and Register file
//  (4) PipeFtoD
//  (5) PipeDtoE and ALU
//  (5) Adder for PcBranchD
//  (6) PipeEtoM and Data Memory
//  (7) PipeMtoW
//  (8) Many muxes
//  (9) Hazard unit
//  ...?
// *******************************************************************************

module datapath (input  logic clk, reset,
                input  logic[2:0]  ALUControlD,
                input logic RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, RegDstD, BranchD, sraccEN,
                 output logic [31:0] instrF,		
                 output logic [31:0] instrD, PC, PCF,
                output logic PcSrcD,                 
                output logic [31:0] ALUOutEChanged, WriteDataE,
                output logic [1:0] ForwardAE, ForwardBE,
                 output logic ForwardAD, ForwardBD,
                 output logic[31:0] SrcAE,SrcBE); // Add or remove input-outputs if necessary

	// ********************************************************************
	// Here, define the wires that are needed inside this pipelined datapath module
	// ********************************************************************
  
  	//* We have defined a few wires for you
    logic [31:0] PcSrcA, PcSrcB, ALUOutE, PcBranchD, PcPlus4F, PcPlus4D, sraccResult;	
  	logic StallF, StallD, zero;
  	logic [4:0]WriteRegW, RsE, RtE, RdE, WriteRegE;
    logic RegWriteW, MemtoRegW, FlushE, RegWriteE, MemtoRegE, MemWriteE, ALUSrcE, RegDstE, sraccENE;
    logic [2:0] ALUControlE;
    logic [31:0] resultW, RD1, RD2, RD3, SignImmD, leftedSignImmD, ALUOutM,muxResult1,muxResult2;
  	logic [31:0] rsValue, rtValue, rdValue, SignImmE;
  	logic[31:0] WriteDataM, ReadDataM, ALUOutW,ReadDataW;
    logic [4:0] WriteRegM;
    logic RegWriteM, MemtoRegM, MemWriteM;
    
  	// Instantiate PipeWtoF
  	PipeWtoF pipe1(PC,
                ~StallF, clk, reset,
                PCF);
  
  	// Do some operations
    
    assign PcPlus4F = PCF + 4;
    assign PcSrcB = PcBranchD;
	assign PcSrcA = PcPlus4F;
  	mux2 #(32) pc_mux(PcSrcA, PcSrcB, PcSrcD, PC);

    imem im1(PCF[7:2], instrF);
    
  	// Instantiate PipeFtoD
    PipeFtoD pipe2( instrF, PcPlus4F, ~StallD, PcSrcD, clk,reset,instrD,PcPlus4D);
    
  	// Do some operations
    regfile regFile(clk, reset, RegWriteD, instrD[25:21], instrD[20:16],WriteRegW, resultW, RD1,RD2,RD3);    
  	signext sigNext( instrD[15:0], SignImmD);
  	sl2 sl( SignImmD, leftedSignImmD);
  	adder adder1( leftedSignImmD, PcPlus4D, PcBranchD);
  	mux2 #(32) mux1(RD1,ALUOutM, ForwardAD, muxResult1);
  	mux2 #(32) mux2(RD2,ALUOutM, ForwardBD, muxResult2);
  	assign EqualD = (muxResult1 == muxResult2) ? 1 : 0;
  	assign PcSrcD = (EqualD & BranchD);
  	
  	// Instantiate PipeDtoE
    PipeDtoE pipe3( RD1, RD2, RD3, SignImmD, instrD[25:21], instrD[20:16], instrD[15:11],
                    RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, RegDstD, ALUControlD, sraccEN, FlushE, clk,
                    reset, rsValue, rtValue, rdValue, SignImmE, RsE, RtE, RdE, RegWriteE,
                    MemtoRegE, MemWriteE, ALUSrcE, RegDstE, sraccENE, ALUControlE);
                    
                
  
  	// Do some operations
    mux2 #(5) mux3(RtE, RdE, RegDstE, WriteRegE);
    mux4 #(32) mux4(rsValue, resultW, ALUOutM, 0, ForwardAE, SrcAE);
    mux4 #(32) mux5(rtValue, resultW, ALUOutM, 0, ForwardBE, WriteDataE);
    mux2 #(32) mux6(WriteDataE,SignImmE,ALUSrcE,SrcBE);
    alu alu( SrcAE, SrcBE, ALUControlE, ALUOutE, zero);
    
    adder sraccAdder( rdValue, ALUOutE, sraccResult);
    mux2 #(32) sraccMux( ALUOutE, sraccResult, sraccENE, ALUOutEChanged);
  	
  	// Instantiate PipeEtoM
  
    PipeEtoM pipe4(clk, reset, RegWriteE, MemtoRegE, MemWriteE, ALUOutEChanged, WriteDataE,
                    WriteRegE, RegWriteM, MemtoRegM, MemWriteM, ALUOutM, WriteDataM, WriteRegM);
  
    // Do some operations                  
    dmem dMem( clk, MemWriteM, ALUOutM, WriteDataM, ReadDataM);
  

  	// Instantiate PipeMtoW
    PipeMtoW pipe5(clk, reset, RegWriteM,MemtoRegM,ALUOutM,ReadDataM,WriteRegM,RegWriteW,
                    MemtoRegW,ALUOutW,ReadDataW,WriteRegW);
  	// Do some operations
  	mux2 #(32) mux7(ALUOutW,ReadDataW,MemtoRegW,resultW);
  	HazardUnit hazardUnit( RegWriteW, BranchD, WriteRegW, WriteRegE, RegWriteM, MemtoRegM,
  	                       WriteRegM, RegWriteE, MemtoRegE, RsE, RtE, instrD[25:21],instrD[20:16],
  	                       ForwardAE, ForwardBE, FlushE, StallD, StallF, ForwardAD, ForwardBD);

endmodule

module HazardUnit( input logic RegWriteW, BranchD,
                input logic [4:0] WriteRegW, WriteRegE,
                input logic RegWriteM,MemtoRegM,
                input logic [4:0] WriteRegM,
                input logic RegWriteE,MemtoRegE,
                input logic [4:0] rsE,rtE,
                input logic [4:0] rsD,rtD,
                output logic [1:0] ForwardAE,ForwardBE,
                output logic FlushE,StallD,StallF,ForwardAD, ForwardBD
                 ); // Add or remove input-outputs if necessary
       
	logic lwstall;
	   
	always_comb
	begin
	   if( (rsE != 0) & (rsE == WriteRegM) & RegWriteM) 
	   begin
	       ForwardAE = 2'b10;
	   end
	   
	   else if( (rsE != 0) & (rsE == WriteRegW) & RegWriteW)
	   begin
	       ForwardAE = 2'b01;
	   end
	   
	   else
	   begin
	       ForwardAE = 2'b00;
	   end
	   
	   //forwardBE
	    if( (rtE != 0) & (rtE == WriteRegM) & RegWriteM) 
	   begin
	       ForwardBE = 2'b10;
	   end
	   
	   else if( (rtE != 0) & (rtE == WriteRegW) & RegWriteW)
	   begin
	       ForwardBE = 2'b01;
	   end
	   
	   else
	   begin
	       ForwardBE = 2'b00;
	   end
	   
	   lwstall <= ( (rsD == rtE) | (rtD == rtE)) & MemtoRegE;
	   StallF <= lwstall;
	   StallD <= lwstall;
	   FlushE <= lwstall;
	   ForwardAD <= ( (rsD != 0) & (rsD == WriteRegM)) & RegWriteM;
	   ForwardBD <= ( (rtD != 0) & (rtD == WriteRegM)) & RegWriteM;
	   
	   end

  
endmodule
`timescale 1ns / 1ps

module newTop( input logic clk, manual_clk,reset,
                output logic MemWriteD, RegWriteD,
                output logic[6:0] ssd, 
                output logic dp,
                output logic[3:0] anode_activate);
                
        logic clk_pulse;
        logic[31:0]  instrF;
        logic[31:0] PC, PCF;
        logic PcSrcD;
        logic  MemtoRegD, ALUSrcD, BranchD, RegDstD;
        logic [2:0]  alucontrol;
        logic [31:0] instrD;
        logic [31:0] ALUOutE, WriteDataE;
        logic [1:0] ForwardAE, ForwardBE;
        logic ForwardAD, ForwardBD;
        logic [31:0] SrcAE,SrcBE;
        logic sraccEN;
        
        pulse_controller debouncer( clk, manual_clk, reset, clk_pulse);
        top_mips top1( clk_pulse, reset, instrF, PC, PCF, PcSrcD, MemWriteD, MemtoRegD, ALUSrcD, BranchD,
            RegDstD, RegWriteD, alucontrol, instrD, ALUOutE, WriteDataE, ForwardAE, ForwardBE, ForwardAD,
            ForwardBD, SrcAE, SrcBE, sraccEN);
            
        display_controller disp( clk, PCF[7:4], PCF[3:0], ALUOutE[7:4],ALUOutE[3:0],ssd,dp,anode_activate);
        
      
endmodule
`timescale 1ns / 1ps

module top_mips (input  logic        clk, reset,
             output logic[31:0]  instrF,
             output logic[31:0] PC, PCF,
             output logic PcSrcD,
             output logic MemWriteD, MemtoRegD, ALUSrcD, BranchD, RegDstD, RegWriteD,
             output logic [2:0]  alucontrol,
             output logic [31:0] instrD, 
             output logic [31:0] ALUOutE, WriteDataE,
             output logic [1:0] ForwardAE, ForwardBE,
                 output logic ForwardAD, ForwardBD,
                 output logic [31:0] SrcAE,SrcBE,
                 output logic sraccEN );


	// ********************************************************************
	// Below, instantiate a controller and a datapath with their new (if modified) signatures
	// and corresponding connections.
	// ********************************************************************
  
    controller controller( instrD[31:26], instrD[5:0], MemtoRegD, MemWriteD, ALUSrcD, RegDstD,
                            RegWriteD, alucontrol,BranchD, sraccEN);
                            
    datapath dataPath( clk, reset, alucontrol, RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, RegDstD,
                    BranchD, sraccEN, instrF, instrD, PC,PCF,PcSrcD, ALUOutE, WriteDataE, ForwardAE,
                    ForwardBE, ForwardAD, ForwardBD, SrcAE, SrcBE);
                    
  
endmodule


// External instruction memory used by MIPS
// processor. It models instruction memory as a stored-program 
// ROM, with address as input, and instruction as output
// Modify it to test your own programs.

module imem ( input logic [5:0] addr, output logic [31:0] instr);

// imem is modeled as a lookup table, a stored-program byte-addressable ROM
	always_comb
	   case ({addr,2'b00})		   	// word-aligned fetch
//
// 	***************************************************************************
//	Here, you can paste your own test cases that you prepared for the part 1-e.
//  An example test program is given below.        
//	***************************************************************************
//
//		address		instruction
//		-------		-----------
	 8'h00: instr = 32'h20080005;
8'h04: instr = 32'h21090007;
8'h08: instr = 32'h01095020;
8'h0c: instr = 32'h012a5025;
8'h10: instr = 32'h01498024;
8'h14: instr = 32'h01108820;
8'h18: instr = 32'h0151902a;
8'h1c: instr = 32'h02318820;
8'h20: instr = 32'h02329822;
8'h24: instr = 32'had330000;
8'h28: instr = 32'h8c020000;
8'h2c: instr = 32'h20090002;
8'h30: instr = 32'h200a0002;
8'h34: instr = 32'h20080002;
8'h38: instr = 32'hfd2a4000;
      default:  instr = {32{1'bx}};	// unknown address
	  endcase
endmodule


// 	***************************************************************************
//	Below are the modules that you shouldn't need to modify at all..
//	***************************************************************************

module controller(input  logic[5:0] op, funct,
                  output logic     memtoreg, memwrite,
                  output logic     alusrc,
                  output logic     regdst, regwrite,
                  output logic[2:0] alucontrol,
                  output logic branch, sraccEN);

   logic [1:0] aluop;

  maindec md (op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, aluop, sraccEN);

   aludec  ad (funct, aluop, alucontrol);

endmodule

// External data memory used by MIPS single-cycle processor

module dmem (input  logic        clk, we,
             input  logic[31:0]  a, wd,
             output logic[31:0]  rd);

   logic  [31:0] RAM[63:0];
  
   assign rd = RAM[a[31:2]];    // word-aligned  read (for lw)

   always_ff @(posedge clk)
     if (we)
       RAM[a[31:2]] <= wd;      // word-aligned write (for sw)

endmodule

module maindec (input logic[5:0] op, 
	              output logic memtoreg, memwrite, branch,
	              output logic alusrc, regdst, regwrite,
	              output logic[1:0] aluop,
	              output logic sraccEN );
  logic [8:0] controls;

   assign {regwrite, regdst, alusrc, branch, memwrite,
                memtoreg,  aluop, sraccEN} = controls;

  always_comb
    case(op)
      6'b000000: controls <= 9'b110000100; // R-type
      6'b100011: controls <= 9'b101001000; // LW
      6'b101011: controls <= 9'b001010000; // SW
      6'b000100: controls <= 9'b000100010; // BEQ
      6'b001000: controls <= 9'b101000000; // ADDI
      6'b111111: controls <= 9'b110000101; //SRACC
      default:   controls <= 9'bxxxxxxxx; // illegal op
    endcase
endmodule

module aludec (input    logic[5:0] funct,
               input    logic[1:0] aluop,
               output   logic[2:0] alucontrol);
  always_comb
    case(aluop)
      2'b00: alucontrol  = 3'b010;  // add  (for lw/sw/addi)
      2'b01: alucontrol  = 3'b110;  // sub   (for beq)
      2'b10: alucontrol =  3'b101; //srl
      default: case(funct)          // R-TYPE instructions
          6'b100000: alucontrol  = 3'b010; // ADD
          6'b100010: alucontrol  = 3'b110; // SUB
          6'b100100: alucontrol  = 3'b000; // AND
          6'b100101: alucontrol  = 3'b001; // OR
          6'b101010: alucontrol  = 3'b111; // SLT
          default:   alucontrol  = 3'bxxx; // ???
        endcase
    endcase
endmodule

module regfile (input    logic clk, reset, we3, 
                input    logic[4:0]  ra1, ra2, wa3, 
                input    logic[31:0] wd3, 
                output   logic[31:0] rd1, rd2, rd3);

  logic [31:0] rf [31:0];

  // three ported register file: read two ports combinationally
  // write third port on falling edge of clock. Register0 hardwired to 0.

  always_ff @(negedge clk)
     if (we3) 
         rf [wa3] <= wd3;
  	 else if(reset)
       for (int i=0; i<32; i++) rf[i] = {32{1'b0}};	

  assign rd1 = (ra1 != 0) ? rf[ ra1] : 0;
  assign rd2 = (ra2 != 0) ? rf[ ra2] : 0;
  assign rd3 = (wa3 != 0) ? rf[ wa3] : 0;
endmodule

module alu(input  logic [31:0] a, b, 
           input  logic [2:0]  alucont, 
           output logic [31:0] result,
           output logic zero);
    
    always_comb
        case(alucont)
            3'b010: result = a + b;
            3'b110: result = a - b;
            3'b000: result = a & b;
            3'b001: result = a | b;
            3'b111: result = (a < b) ? 1 : 0;
            3'b101: result = a >> b;
            default: result = {32{1'bx}};
        endcase
    
    assign zero = (result == 0) ? 1'b1 : 1'b0;
    
endmodule

module adder (input  logic[31:0] a, b,
              output logic[31:0] y);
     
     assign y = a + b;
endmodule

module sl2 (input  logic[31:0] a,
            output logic[31:0] y);
     
     assign y = {a[29:0], 2'b00}; // shifts left by 2
endmodule

module signext (input  logic[15:0] a,
                output logic[31:0] y);
              
  assign y = {{16{a[15]}}, a};    // sign-extends 16-bit a
endmodule

// parameterized register
module flopr #(parameter WIDTH = 8)
              (input logic clk, reset, 
	       input logic[WIDTH-1:0] d, 
               output logic[WIDTH-1:0] q);

  always_ff@(posedge clk, posedge reset)
    if (reset) q <= 0; 
    else       q <= d;
endmodule


// paramaterized 2-to-1 MUX
module mux2 #(parameter WIDTH = 8)
             (input  logic[WIDTH-1:0] d0, d1,  
              input  logic s, 
              output logic[WIDTH-1:0] y);
  
   assign y = s ? d1 : d0; 
endmodule

// paramaterized 4-to-1 MUX
module mux4 #(parameter WIDTH = 8)
             (input  logic[WIDTH-1:0] d0, d1, d2, d3,
              input  logic[1:0] s, 
              output logic[WIDTH-1:0] y);
  
   assign y = s[1] ? ( s[0] ? d3 : d2 ) : (s[0] ? d1 : d0); 
endmodule