
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-349h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px? 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px? 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px? 
B
-Phase 1 Build RT Design | Checksum: 7efe78f4
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:16 . Memory (MB): peak = 1900.570 ; gain = 85.0702default:defaulth px? 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px? 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px? 
A
,Phase 2.1 Create Timer | Checksum: 7efe78f4
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:16 . Memory (MB): peak = 1900.570 ; gain = 85.0702default:defaulth px? 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px? 
M
8Phase 2.2 Fix Topology Constraints | Checksum: 7efe78f4
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:16 . Memory (MB): peak = 1907.148 ; gain = 91.6482default:defaulth px? 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px? 
F
1Phase 2.3 Pre Route Cleanup | Checksum: 7efe78f4
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:16 . Memory (MB): peak = 1907.148 ; gain = 91.6482default:defaulth px? 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px? 
C
.Phase 2.4 Update Timing | Checksum: 1cf0bfed2
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 1926.895 ; gain = 111.3952default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-9.236 | TNS=-54.774| WHS=-0.120 | THS=-1.883 |
2default:defaultZ35-416h px? 
I
4Phase 2 Router Initialization | Checksum: 21be318ef
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 1926.895 ; gain = 111.3952default:defaulth px? 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px? 
q

Phase %s%s
101*constraints2
3.1 2default:default2"
Global Routing2default:defaultZ18-101h px? 
D
/Phase 3.1 Global Routing | Checksum: 21be318ef
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 1926.895 ; gain = 111.3952default:defaulth px? 
C
.Phase 3 Initial Routing | Checksum: 1bd885b1e
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 1926.895 ; gain = 111.3952default:defaulth px? 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px? 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-9.282 | TNS=-54.921| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
G
2Phase 4.1 Global Iteration 0 | Checksum: ec49d65c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 1926.895 ; gain = 111.3952default:defaulth px? 
E
0Phase 4 Rip-up And Reroute | Checksum: ec49d65c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 1926.895 ; gain = 111.3952default:defaulth px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 5.1.1 Update Timing | Checksum: 19c76539e
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 1926.895 ; gain = 111.3952default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-9.282 | TNS=-54.921| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
C
.Phase 5.1 Delay CleanUp | Checksum: 1d31a206b
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 1926.895 ; gain = 111.3952default:defaulth px? 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px? 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 1d31a206b
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 1926.895 ; gain = 111.3952default:defaulth px? 
O
:Phase 5 Delay and Skew Optimization | Checksum: 1d31a206b
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 1926.895 ; gain = 111.3952default:defaulth px? 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
D
/Phase 6.1.1 Update Timing | Checksum: f3eef83a
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 1926.895 ; gain = 111.3952default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-9.282 | TNS=-54.921| WHS=-1.488 | THS=-37.955|
2default:defaultZ35-416h px? 
C
.Phase 6.1 Hold Fix Iter | Checksum: 12ba723ad
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:17 . Memory (MB): peak = 1929.328 ; gain = 113.8282default:defaulth px? 
A
,Phase 6 Post Hold Fix | Checksum: 128475817
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:17 . Memory (MB): peak = 1929.328 ; gain = 113.8282default:defaulth px? 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px? 
B
-Phase 7 Route finalize | Checksum: 14177ec2a
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:17 . Memory (MB): peak = 1929.328 ; gain = 113.8282default:defaulth px? 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px? 
I
4Phase 8 Verifying routed nets | Checksum: 14177ec2a
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:17 . Memory (MB): peak = 1929.328 ; gain = 113.8282default:defaulth px? 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px? 
E
0Phase 9 Depositing Routes | Checksum: 18c0322ee
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:17 . Memory (MB): peak = 1929.328 ; gain = 113.8282default:defaulth px? 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px? 
q

Phase %s%s
101*constraints2
10.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
C
.Phase 10.1 Update Timing | Checksum: ca229e8e
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:17 . Memory (MB): peak = 1929.328 ; gain = 113.8282default:defaulth px? 
?
Estimated Timing Summary %s
57*route2J
6| WNS=-9.282 | TNS=-54.921| WHS=0.157  | THS=0.000  |
2default:defaultZ35-57h px? 
B
!Router estimated timing not met.
128*routeZ35-328h px? 
F
1Phase 10 Post Router Timing | Checksum: ca229e8e
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:17 . Memory (MB): peak = 1929.328 ; gain = 113.8282default:defaulth px? 
@
Router Completed Successfully
2*	routeflowZ35-16h px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:19 ; elapsed = 00:00:17 . Memory (MB): peak = 1929.328 ; gain = 113.8282default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1272default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:00:202default:default2
00:00:172default:default2
1929.3282default:default2
122.9452default:defaultZ17-268h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2 
00:00:00.0412default:default2
1934.0902default:default2
4.7622default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2w
cF:/FPGA/traffic_light/version2/syn/traffic_light/traffic_light.runs/impl_1/traffic_light_routed.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
|Executing : report_drc -file traffic_light_drc_routed.rpt -pb traffic_light_drc_routed.pb -rpx traffic_light_drc_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
oreport_drc -file traffic_light_drc_routed.rpt -pb traffic_light_drc_routed.pb -rpx traffic_light_drc_routed.rpx2default:defaultZ4-113h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
586*	vivadotcl2?
gF:/FPGA/traffic_light/version2/syn/traffic_light/traffic_light.runs/impl_1/traffic_light_drc_routed.rptgF:/FPGA/traffic_light/version2/syn/traffic_light/traffic_light.runs/impl_1/traffic_light_drc_routed.rpt2default:default8Z2-168h px? 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px? 
?
%s4*runtcl2?
?Executing : report_methodology -file traffic_light_methodology_drc_routed.rpt -pb traffic_light_methodology_drc_routed.pb -rpx traffic_light_methodology_drc_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
?report_methodology -file traffic_light_methodology_drc_routed.rpt -pb traffic_light_methodology_drc_routed.pb -rpx traffic_light_methodology_drc_routed.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px? 
?
2The results of Report Methodology are in file %s.
609*	vivadotcl2?
sF:/FPGA/traffic_light/version2/syn/traffic_light/traffic_light.runs/impl_1/traffic_light_methodology_drc_routed.rptsF:/FPGA/traffic_light/version2/syn/traffic_light/traffic_light.runs/impl_1/traffic_light_methodology_drc_routed.rpt2default:default8Z2-1520h px? 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px? 
?
%s4*runtcl2?
?Executing : report_power -file traffic_light_power_routed.rpt -pb traffic_light_power_summary_routed.pb -rpx traffic_light_power_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
report_power -file traffic_light_power_routed.rpt -pb traffic_light_power_summary_routed.pb -rpx traffic_light_power_routed.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px? 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1392default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px? 
?
%s4*runtcl2{
gExecuting : report_route_status -file traffic_light_route_status.rpt -pb traffic_light_route_status.pb
2default:defaulth px? 
?
%s4*runtcl2?
?Executing : report_timing_summary -max_paths 10 -report_unconstrained -file traffic_light_timing_summary_routed.rpt -pb traffic_light_timing_summary_routed.pb -rpx traffic_light_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 
?
rThe design failed to meet the timing requirements. Please see the %s report for details on the timing violations.
188*timing2"
timing summary2default:defaultZ38-282h px? 
?
%s4*runtcl2j
VExecuting : report_incremental_reuse -file traffic_light_incremental_reuse_routed.rpt
2default:defaulth px? 
g
BIncremental flow is disabled. No incremental reuse Info to report.423*	vivadotclZ4-1062h px? 
?
%s4*runtcl2j
VExecuting : report_clock_utilization -file traffic_light_clock_utilization_routed.rpt
2default:defaulth px? 
?
%s4*runtcl2?
?Executing : report_bus_skew -warn_on_violation -file traffic_light_bus_skew_routed.rpt -pb traffic_light_bus_skew_routed.pb -rpx traffic_light_bus_skew_routed.rpx
2default:defaulth px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 


End Record