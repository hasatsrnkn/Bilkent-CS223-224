
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/utils_1/imports/synth_1/topModule.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2u
aC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/utils_1/imports/synth_1/topModule.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
v
Command: %s
53*	vivadotcl2E
1synth_design -top topModule -part xc7a35tcpg236-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px� 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px� 
�
[Reference run did not run incremental synthesis because %s; reverting to default synthesis
2138*designutils2+
the design is too small2default:defaultZ20-4072h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
171082default:defaultZ8-7075h px� 
�
%s*synth2�
wStarting RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
	topModule2default:default2
 2default:default2l
VC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/topModule.sv2default:default2
22default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2!
clock_Divider2default:default2
 2default:default2p
ZC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/clock_Divider.sv2default:default2
42default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2!
clock_Divider2default:default2
 2default:default2
12default:default2
12default:default2p
ZC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/clock_Divider.sv2default:default2
42default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
controlUnit2default:default2
 2default:default2n
XC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controlUnit.sv2default:default2
22default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

controller2default:default2
 2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
22default:default8@Z8-6157h px� 
�
-case statement is not full and has no default155*oasys2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
252default:default8@Z8-155h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2"
isExternal_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
272default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2

PC_clr_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
282default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
	PC_ld_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
292default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
	IM_en_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
302default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
	IM_rd_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
312default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
	IM_wr_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
322default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2

IM_clr_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
332default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
	IR_ld_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
342default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
	M_clr_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
352default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
M_re_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
362default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
M_we_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
372default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2

RF_clr_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
382default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2

RF_we1_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
392default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2

RF_we2_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
402default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2#
Reg_wr_sel1_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
412default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2#
Reg_wr_sel2_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
422default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2!
RF_raddr1_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
432default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2!
RF_raddr2_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
442default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
out_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
452default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2$
nextState_reg[3]2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
462default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2$
nextState_reg[2]2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
462default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2$
nextState_reg[1]2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
462default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2$
nextState_reg[0]2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
462default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2!
RF_waddr2_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
862default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2*
most_significant_B_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
1452default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
	M_add_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
2152default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2!
RF_waddr1_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
2162default:default8@Z8-87h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
ALU_sel_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
2652default:default8@Z8-87h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

controller2default:default2
 2default:default2
22default:default2
12default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
22default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2"
programCounter2default:default2
 2default:default2q
[C:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/programCounter.sv2default:default2
22default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
programCounter2default:default2
 2default:default2
32default:default2
12default:default2q
[C:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/programCounter.sv2default:default2
22default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2%
instructionMemory2default:default2
 2default:default2t
^C:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/instructionMemory.sv2default:default2
22default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2%
instructionMemory2default:default2
 2default:default2
42default:default2
12default:default2t
^C:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/instructionMemory.sv2default:default2
22default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2$
twelveBitMux2to12default:default2
 2default:default2s
]C:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/twelveBitMux2to1.sv2default:default2
22default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2$
twelveBitMux2to12default:default2
 2default:default2
52default:default2
12default:default2s
]C:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/twelveBitMux2to1.sv2default:default2
22default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2'
instructionRegister2default:default2
 2default:default2v
`C:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/instructionRegister.sv2default:default2
22default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2'
instructionRegister2default:default2
 2default:default2
62default:default2
12default:default2v
`C:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/instructionRegister.sv2default:default2
22default:default8@Z8-6155h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
	RF_wdata22default:default2
controlUnit2default:default2n
XC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controlUnit.sv2default:default2
62default:default8@Z8-3848h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
controlUnit2default:default2
 2default:default2
72default:default2
12default:default2n
XC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controlUnit.sv2default:default2
22default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

dataMemory2default:default2
 2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/dataMemory.sv2default:default2
32default:default8@Z8-6157h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2
out_reg2default:default2

dataMemory2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/dataMemory.sv2default:default2
532default:default8@Z8-7137h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

dataMemory2default:default2
 2default:default2
82default:default2
12default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/dataMemory.sv2default:default2
32default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
dataPath2default:default2
 2default:default2k
UC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/dataPath.sv2default:default2
22default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2"
fourBitMux2to12default:default2
 2default:default2q
[C:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/fourBitMux2to1.sv2default:default2
22default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
fourBitMux2to12default:default2
 2default:default2
92default:default2
12default:default2q
[C:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/fourBitMux2to1.sv2default:default2
22default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2 
registerFile2default:default2
 2default:default2o
YC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/registerFile.sv2default:default2
22default:default8@Z8-6157h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2!
readData1_reg2default:default2 
registerFile2default:default2o
YC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/registerFile.sv2default:default2
1002default:default8@Z8-7137h px� 
�
�Register %s in module %s has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4878*oasys2!
readData2_reg2default:default2 
registerFile2default:default2o
YC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/registerFile.sv2default:default2
1112default:default8@Z8-7137h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
registerFile2default:default2
 2default:default2
102default:default2
12default:default2o
YC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/registerFile.sv2default:default2
22default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
alu2default:default2
 2default:default2f
PC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/alu.sv2default:default2
42default:default8@Z8-6157h px� 
�
9always_comb on '%s' did not result in combinational logic87*oasys2
out2_reg2default:default2f
PC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/alu.sv2default:default2
272default:default8@Z8-87h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
alu2default:default2
 2default:default2
112default:default2
12default:default2f
PC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/alu.sv2default:default2
42default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2'
sevenSegmentDisplay2default:default2
 2default:default2v
`C:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/sevenSegmentDisplay.sv2default:default2
52default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2'
sevenSegmentDisplay2default:default2
 2default:default2
122default:default2
12default:default2v
`C:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/sevenSegmentDisplay.sv2default:default2
52default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
dataPath2default:default2
 2default:default2
132default:default2
12default:default2k
UC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/dataPath.sv2default:default2
22default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	topModule2default:default2
 2default:default2
142default:default2
12default:default2l
VC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/topModule.sv2default:default2
22default:default8@Z8-6155h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
RF_clr2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

switch[11]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

switch[10]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[9]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[8]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[7]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[6]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[5]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[4]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[3]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[2]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[1]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[0]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
pbBottom2default:default2

controller2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

switch[15]2default:default2

controller2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

switch[14]2default:default2

controller2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

switch[13]2default:default2

controller2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

switch[12]2default:default2

controller2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[8]2default:default2

controller2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[7]2default:default2

controller2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[6]2default:default2

controller2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[5]2default:default2

controller2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[4]2default:default2

controller2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[3]2default:default2

controller2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[2]2default:default2

controller2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[1]2default:default2

controller2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[0]2default:default2

controller2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
RF_wdata2[3]2default:default2
controlUnit2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
RF_wdata2[2]2default:default2
controlUnit2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
RF_wdata2[1]2default:default2
controlUnit2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
RF_wdata2[0]2default:default2
controlUnit2default:defaultZ8-7129h px� 
�
%s*synth2�
wFinished RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0112default:default2
1260.5982default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
y
Parsing XDC File [%s]
179*designutils28
"C:/Users/MONSTER/Desktop/const.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils28
"C:/Users/MONSTER/Desktop/const.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project26
"C:/Users/MONSTER/Desktop/const.xdc2default:default2/
.Xil/topModule_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1260.5982default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0042default:default2
1260.5982default:default2
0.0002default:defaultZ17-268h px� 
�
[Reference run did not run incremental synthesis because %s; reverting to default synthesis
2138*designutils2+
the design is too small2default:defaultZ20-4072h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Constraint Validation : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
!inferring latch for variable '%s'327*oasys2"
isExternal_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
272default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2

PC_clr_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
282default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
	PC_ld_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
292default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
	IM_en_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
302default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
	IM_wr_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
322default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
	IR_ld_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
342default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
	M_clr_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
352default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
M_re_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
362default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
M_we_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
372default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2

RF_clr_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
382default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2

RF_we1_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
392default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2

RF_we2_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
402default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
	M_add_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
2152default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2!
RF_raddr1_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
432default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2!
RF_raddr2_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
442default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2!
RF_waddr1_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
2162default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2!
RF_waddr2_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
862default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
ALU_sel_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
2652default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2#
Reg_wr_sel1_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
412default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2#
Reg_wr_sel2_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
422default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
out_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
452default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2$
nextState_reg[0]2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
462default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2$
nextState_reg[3]2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
462default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2*
most_significant_B_reg2default:default2m
WC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/controller.sv2default:default2
1452default:default8@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
out2_reg2default:default2f
PC:/Users/MONSTER/Desktop/cs223_project/project/project.srcs/sources_1/new/alu.sv2default:default2
272default:default8@Z8-327h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:14 ; elapsed = 00:00:14 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   3 Input    4 Bit       Adders := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 2     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               12 Bit    Registers := 10    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                4 Bit    Registers := 29    
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                3 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 2     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   12 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   7 Input    4 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 17    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   8 Input    4 Bit        Muxes := 8     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    4 Bit        Muxes := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 5     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  15 Input    3 Bit        Muxes := 4     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   8 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   5 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	  15 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 39    
2default:defaulth p
x
� 
X
%s
*synth2@
,	  15 Input    1 Bit        Muxes := 31    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   8 Input    1 Bit        Muxes := 25    
2default:defaulth p
x
� 
X
%s
*synth2@
,	  16 Input    1 Bit        Muxes := 16    
2default:defaulth p
x
� 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
RF_clr2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

switch[11]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

switch[10]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[9]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[8]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[7]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[6]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[5]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[4]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[3]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[2]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[1]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
	switch[0]2default:default2
dataPath2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
RF_wdata2[3]2default:default2
controlUnit2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
RF_wdata2[2]2default:default2
controlUnit2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
RF_wdata2[1]2default:default2
controlUnit2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
RF_wdata2[0]2default:default2
controlUnit2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2 
bottomButton2default:default2
controlUnit2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

switch[15]2default:default2
controlUnit2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

switch[14]2default:default2
controlUnit2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

switch[13]2default:default2
controlUnit2default:defaultZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2

switch[12]2default:default2
controlUnit2default:defaultZ8-7129h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
controlU/controll/PC_clr_reg2default:default2
	topModule2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2/
controlU/controll/PC_ld_reg2default:default2
	topModule2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2/
controlU/controll/IM_en_reg2default:default2
	topModule2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2/
controlU/controll/IM_wr_reg2default:default2
	topModule2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2/
controlU/controll/M_clr_reg2default:default2
	topModule2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys20
controlU/controll/RF_clr_reg2default:default2
	topModule2default:defaultZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys29
%controlU/controll/nextState_reg[3][0]2default:default2
	topModule2default:defaultZ8-3332h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:20 ; elapsed = 00:00:21 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:26 ; elapsed = 00:00:27 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
{Finished Timing Optimization : Time (s): cpu = 00:00:27 ; elapsed = 00:00:27 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
zFinished Technology Mapping : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
tFinished IO Insertion : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Renaming Generated Nets : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|1     |BUFG   |     3|
2default:defaulth px� 
D
%s*synth2,
|2     |CARRY4 |    20|
2default:defaulth px� 
D
%s*synth2,
|3     |LUT1   |     4|
2default:defaulth px� 
D
%s*synth2,
|4     |LUT2   |    19|
2default:defaulth px� 
D
%s*synth2,
|5     |LUT3   |    36|
2default:defaulth px� 
D
%s*synth2,
|6     |LUT4   |    54|
2default:defaulth px� 
D
%s*synth2,
|7     |LUT5   |    48|
2default:defaulth px� 
D
%s*synth2,
|8     |LUT6   |   140|
2default:defaulth px� 
D
%s*synth2,
|9     |MUXF7  |    30|
2default:defaulth px� 
D
%s*synth2,
|10    |MUXF8  |     4|
2default:defaulth px� 
D
%s*synth2,
|11    |FDCE   |   103|
2default:defaulth px� 
D
%s*synth2,
|12    |FDRE   |   211|
2default:defaulth px� 
D
%s*synth2,
|13    |LD     |    49|
2default:defaulth px� 
D
%s*synth2,
|14    |IBUF   |    22|
2default:defaulth px� 
D
%s*synth2,
|15    |OBUF   |    24|
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
s
%s
*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 55 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
}Synthesis Optimization Runtime : Time (s): cpu = 00:00:22 ; elapsed = 00:00:30 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth p
x
� 
�
%s
*synth2�
~Synthesis Optimization Complete : Time (s): cpu = 00:00:31 ; elapsed = 00:00:32 . Memory (MB): peak = 1260.598 ; gain = 0.000
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0132default:default2
1260.5982default:default2
0.0002default:defaultZ17-268h px� 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
1032default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
12default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1260.5982default:default2
0.0002default:defaultZ17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2[
G  A total of 49 instances were transformed.
  LD => LDCE: 49 instances
2default:defaultZ1-111h px� 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
462edb602default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
482default:default2
1212default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:352default:default2
00:00:372default:default2
1260.5982default:default2
0.0002default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2e
QC:/Users/MONSTER/Desktop/cs223_project/project/project.runs/synth_1/topModule.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2|
hExecuting : report_utilization -file topModule_utilization_synth.rpt -pb topModule_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu May 12 10:10:21 20222default:defaultZ17-206h px� 


End Record