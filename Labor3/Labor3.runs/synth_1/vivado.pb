
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:032default:default2
00:00:072default:default2
1237.2542default:default2
0.0002default:defaultZ17-268h px? 
?
Command: %s
1870*	planAhead2?
read_checkpoint -auto_incremental -incremental D:/Privat/EDS/Projects/Labor3/Labor3.srcs/utils_1/imports/synth_1/Testaufbau.dcp2default:defaultZ12-2866h px? 
?
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2d
PD:/Privat/EDS/Projects/Labor3/Labor3.srcs/utils_1/imports/synth_1/Testaufbau.dcp2default:defaultZ12-5825h px? 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px? 
x
Command: %s
53*	vivadotcl2G
3synth_design -top Testaufbau -part xc7a100tcsg324-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px? 
?
[Reference run did not run incremental synthesis because %s; reverting to default synthesis
2138*designutils2+
the design is too small2default:defaultZ20-4072h px? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
`
#Helper process launched with PID %s4824*oasys2
261802default:defaultZ8-7075h px? 
?
%s*synth2?
rStarting Synthesize : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2

Testaufbau2default:default2b
LD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Testaufbau.vhd2default:default2
112default:default8@Z8-638h px? 
[
%s
*synth2C
/	Parameter length bound to: 4 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2+
Zufallsgenerator_galois2default:default2m
YD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Zufallsgenerator Galois.vhd2default:default2
342default:default2
PRNG2default:default2+
Zufallsgenerator_galois2default:default2b
LD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Testaufbau.vhd2default:default2
402default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2+
Zufallsgenerator_galois2default:default2o
YD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Zufallsgenerator Galois.vhd2default:default2
402default:default8@Z8-638h px? 
[
%s
*synth2C
/	Parameter length bound to: 4 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2&
coefficientmodules2default:default2h
TD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/coefficientmodules.vhd2default:default2
342default:default2
PRNGs2default:default2&
coefficientmodules2default:default2o
YD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Zufallsgenerator Galois.vhd2default:default2
652default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2&
coefficientmodules2default:default2j
TD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/coefficientmodules.vhd2default:default2
432default:default8@Z8-638h px? 
?
clock signal used as data2897*oasys2j
TD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/coefficientmodules.vhd2default:default2
552default:default8@Z8-2897h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2&
coefficientmodules2default:default2
12default:default2
12default:default2j
TD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/coefficientmodules.vhd2default:default2
432default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2&
coefficientmodules2default:default2h
TD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/coefficientmodules.vhd2default:default2
342default:default2
PRNGs2default:default2&
coefficientmodules2default:default2o
YD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Zufallsgenerator Galois.vhd2default:default2
652default:default8@Z8-3491h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
X_out2default:default2+
Zufallsgenerator_galois2default:default2o
YD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Zufallsgenerator Galois.vhd2default:default2
362default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
reset_s2default:default2+
Zufallsgenerator_galois2default:default2o
YD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Zufallsgenerator Galois.vhd2default:default2
442default:default8@Z8-3848h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2+
Zufallsgenerator_galois2default:default2
22default:default2
12default:default2o
YD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Zufallsgenerator Galois.vhd2default:default2
402default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	XOR_eigen2default:default2Y
ED:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/XOR.vhd2default:default2
342default:default2 
GoldenDevice2default:default2
	XOR_eigen2default:default2b
LD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Testaufbau.vhd2default:default2
432default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
	XOR_eigen2default:default2[
ED:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/XOR.vhd2default:default2
392default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	XOR_eigen2default:default2
32default:default2
12default:default2[
ED:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/XOR.vhd2default:default2
392default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	AND_eigen2default:default2_
KD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/AND_eigen.vhd2default:default2
342default:default2
DUT2default:default2
	AND_eigen2default:default2b
LD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Testaufbau.vhd2default:default2
462default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
	AND_eigen2default:default2a
KD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/AND_eigen.vhd2default:default2
392default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	AND_eigen2default:default2
42default:default2
12default:default2a
KD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/AND_eigen.vhd2default:default2
392default:default8@Z8-256h px? 
[
%s
*synth2C
/	Parameter length bound to: 4 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2+
Zufallsgenerator_galois2default:default2m
YD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Zufallsgenerator Galois.vhd2default:default2
342default:default2
SGA12default:default2+
Zufallsgenerator_galois2default:default2b
LD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Testaufbau.vhd2default:default2
502default:default8@Z8-3491h px? 
[
%s
*synth2C
/	Parameter length bound to: 4 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2+
Zufallsgenerator_galois2default:default2m
YD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Zufallsgenerator Galois.vhd2default:default2
342default:default2
SGA22default:default2+
Zufallsgenerator_galois2default:default2b
LD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Testaufbau.vhd2default:default2
532default:default8@Z8-3491h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2

Testaufbau2default:default2
52default:default2
12default:default2b
LD:/Privat/EDS/Projects/Labor/Labor3/Labor3.srcs/sources_1/new/Testaufbau.vhd2default:default2
112default:default8@Z8-256h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
clk2default:default2&
coefficientmodules2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
reset2default:default2&
coefficientmodules2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
X_out[4]2default:default2+
Zufallsgenerator_galois2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
X_out[3]2default:default2+
Zufallsgenerator_galois2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
X_out[2]2default:default2+
Zufallsgenerator_galois2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
X_out[1]2default:default2+
Zufallsgenerator_galois2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
Ks_in[4]2default:default2+
Zufallsgenerator_galois2default:defaultZ8-7129h px? 
?
%s*synth2?
rFinished Synthesize : Time (s): cpu = 00:00:06 ; elapsed = 00:00:07 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Constraint Validation : Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Loading part: xc7a100tcsg324-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      1 Bit         XORs := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 6     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sga1_out[4]2default:default2

Testaufbau2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sga1_out[3]2default:default2

Testaufbau2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sga1_out[2]2default:default2

Testaufbau2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sga1_out[1]2default:default2

Testaufbau2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sga2_out[4]2default:default2

Testaufbau2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sga2_out[3]2default:default2

Testaufbau2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sga2_out[2]2default:default2

Testaufbau2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
sga2_out[1]2default:default2

Testaufbau2default:defaultZ8-7129h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:12 ; elapsed = 00:00:23 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
{Finished Timing Optimization : Time (s): cpu = 00:00:12 ; elapsed = 00:00:23 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
zFinished Technology Mapping : Time (s): cpu = 00:00:12 ; elapsed = 00:00:23 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
tFinished IO Insertion : Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
Finished Renaming Generated Nets : Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
C
%s*synth2+
+------+------+------+
2default:defaulth px? 
C
%s*synth2+
|      |Cell  |Count |
2default:defaulth px? 
C
%s*synth2+
+------+------+------+
2default:defaulth px? 
C
%s*synth2+
|1     |OBUFT |     8|
2default:defaulth px? 
C
%s*synth2+
+------+------+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
? 
N
%s
*synth26
"|      |Instance |Module |Cells |
2default:defaulth p
x
? 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
? 
N
%s
*synth26
"|1     |top      |       |     8|
2default:defaulth p
x
? 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
s
%s
*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 19 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
}Synthesis Optimization Runtime : Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth p
x
? 
?
%s
*synth2?
~Synthesis Optimization Complete : Time (s): cpu = 00:00:16 ; elapsed = 00:00:27 . Memory (MB): peak = 1237.254 ; gain = 0.000
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1237.2542default:default2
0.0002default:defaultZ17-268h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1237.2542default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
1bede4572default:defaultZ4-1430h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
302default:default2
202default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:182default:default2
00:00:292default:default2
1237.2542default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2Z
FD:/Privat/EDS/Projects/Labor/Labor3/Labor3.runs/synth_1/Testaufbau.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2~
jExecuting : report_utilization -file Testaufbau_utilization_synth.rpt -pb Testaufbau_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Wed May 18 20:31:58 20222default:defaultZ17-206h px? 


End Record