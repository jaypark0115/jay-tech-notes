# Soongsil lecture PDF re-extract

- source: 숭실대 학부인턴 bus cv/수업자료

## 1. AXI bus protocol 이해 및 AXI interface를 갖는 HW Block 설계 및 검증_01주차.pdf
### page 1
`25년 동계 학부생연구인턴: AXI bus protocol 이해 및 AXI interface 를 갖는 HW block 설계/검증 고성능 SoC의 backbone으로 사용되는 AXI bus protocol을 이해하고, AXI interface를 갖는 HW block을 verilog를 통해 설계 및 검증한다. (`25.12/22(월)~`26.1/14(수), 11:00~12:50, 베어드홀 101-3호) 숭실대학교 차세대반도체학과 송인철(inchul.song@ssu.ac.kr)/02-828-7489)

### page 2
1일차: 수업 (12/22, 월) • 과정 소개 (Verilog 숙련도 확인) • 평가 방법 • ASIC(Application Specific Integrated Circuit) • SoC(System On Chip) • ARM bus protocol in SoC • ASIC flow • Summary • Q&A

### page 3
1일차: 과정 소개 (1/3) • 1일차 (12/22, 월) • 과정 및 평가 방법 • ASIC & SoC & ARM bus protocol 이해 • Implementation environment 소개 • 2일차 (12/23, 화) • Tool install (MobaXterm) 및 xTerm 통한 계정 접속 • 개발 환경 구축 (Linux command & directory hierarchy) • 환경 검증을 위한 Verilog-HDL & Testbench (Lab #1) • 3일차 (12/24, 수) • Address map & register map & interrupt 이해 • APB(Advanced Peripheral bus) 이해 • APB interface를 갖는 register 구현 및 검증 (Lab #2)

### page 4
1일차: 과정 소개 (2/3) • 4일차 (12/26, 금) • Memory mapped register 구현 및 검증 실습 (Lab #3-1) • Memory mapped register with interrupt 구현 및 검증 실습 (Lab #3-2) • Interrupt 구현 및 검증 실습 (Lab #4) • 5일차 (12/29, 월) • Bus protocol 이해 • AMBA(Advanced Microcontroller Bus Architecture: AHB, AXI) 이해 • HDD(Hardware Description Document) 소개 • Project #1 (AXI master & Slave) 소개 및 AXI slave 구현 위한 HDD 작성 • 6/7/8/9일차 (12/30, 화 ~ `26.1/5, 월) • 개인 Project #1 진행 ✓ AXI slave design ✓ AXI slave 검증을 위한 AXI master modeling

### page 5
1일차: 과정 소개 (3/3) • 10일차 (`26.1/6, 화) • Protocol conversion (AHB to APB, AXI to AHB, AXI to APB) 이해 • 개인 Project #2 소개 및 구현 위한 HDD 작성 • 11/12/13/14일차 (`26.1/7, 수 ~ `26.1/12, 월) • 개인 Project #2 진행 ✓ AXI to APB bus protocol conversion block design ✓ APB slave block design ✓ AXI master modeling for verification • 15일차 (`26.1/14, 수) • 개인 Project #2 HDD, 연구일지 정리 및 제출 • 개인 Project #2 Verilog-HDL/Testbench/Simulation result 정리 및 제출 • Q&A 및 Wrap up

### page 6
1일차: 평가 (1/1) • 성적평가방식 • P/F 평가 • 평가항목 및 반영비율(100% : ~59점 Fail, 60점~: Pass, ) ✓ 계절제의 경우 유고결석 승인 안함 ✓ 총 수업일 수의 1/3 이상 결석 경우 점수와 상관 없이 F 등급 • 연구일지 ✓ 점수 미 반영, 하지만 제출 해야만 학점 인정 평가항목 점수 합(최대 100점) 반영비율(합계 100%) 출석 20 (2회 허용, 초과시 -4점/1회) 20% Project#1 (HDD & code & Sim. Result) 30 (6/12/18/24/30) 30% Project#2 (HDD & code & Sim. Result) 50 (10/20/30/40/50) 50%

### page 7
1일차: ASIC(Application Specific Integrated Circuit) (1/2) • ASIC 정의 (특정 작업/통합회로/PPA 최적화)

### page 8
1일차: ASIC(Application Specific Integrated Circuit) (2/2) • ASIC 특징 (장점 vs. 단점) ✓Efficiency vs. flexibility -> 선택

### page 9
1일차: SoC(System On Chip) (1/5) • SoC(System On Chip) 정의 • 핵심 IP들을 한데 담은 기술집약적 반도체 칩 • SoC 이유 (PPA: Power/Performance/Area) • 칩이 나눠져 있으면 통합적인 전력 제어 어려 워 개별 전력 소모로 배터리 효율 감소 • 칩들간 데이터 전송을 위한 대역폭 제한과 전송 시간 지연으로 성능 저하 • 단일 칩 형태로 면적이 줄어 공간 확보에 용이 • SoC Components • CPU/DSP/GPU/NPU/ISP/HW engines • Combinational logic & Sequential logic • Memory • Analog IP

### page 10
1일차: SoC(System On Chip) (2/5) ✓CP(Communication Processor) • Qualcomm Snapdragon X65 @2021(4nm, 5G to 2G multimode modem, DL~10Gbps @5G, DL~2.5Gbps @4G) ✓AP(Application Processor) • Samsung 엑시노스 2200 @2022(4nm, Xclipse GPU based on AMD RDNA2 architecture) • Examples of SoC

### page 11
1일차: SoC(System On Chip) (3/5) • Example of SoC • CPU Subsystem • Core architecture (Cache/MMU 등) • Infrastructure HW • Interconnect Fabric(Bus matrix/BW budget)) • Int. RAM & Memory control • Peripherals • High & Low speed interface • DMA & interrupt controller • CMU(Clock management Unit) • DFS(Dynamic Freq. scaling) based on scenario • PMU(Power management Unit) • DVS(Dynamic voltage scaling) based on scenario • Modem • HW & SW I/F & Data transfer engine • Application Specific Components • HW accelerator for HW offloading Local busLocal bus

### page 12
1일차: SoC(System On Chip) (4/5) • Functional view • CP(Communication Processor: multimode(3G/4G/5G) modem) & AP(Application Processor) : SW IP & HW IP mixed HW IP SW IP Mixed IP RF Timing Synchronization Demodulation (OFDM) CCH/SCH Decoding Channel Estimation RF I/F L2 processor (MAC/RLC/ PDCP/SDAP) Device view(CP: Communication Processor) Ext. I/F (PCIe Gen2/3/4 Lane1~4) or Bus I/F (AXI w/ gate keeper) Ext. Mem. (DRAM) CP interface TCP stack (w/ SW NAT) User App. #1 User App. #N Device view(AP: Application Processor) Packet Processing (w/ HW NAT) Ext. Mem. (DRAM) Set view (Handheld)

### page 13
1일차: SoC(System On Chip) (5/5) • SW IP & HW IP view • HW IP w/ bus interface in SoC: Block & Interface diagram HW IP SW IP Mixed IP Block #1 SubBlk #N SubBlk #2 Register block InBuf. #1 InBuffer #2 APB interface Control register Status register Interrupt related register Memory Mapped Reg. Main Controller OutBuf. #1 OutBuffer #2 SubBlk #1 Block #N SubBlk #N SubBlk #2 SubBlk #1 AXI interface (w/ DMA) Bus Matrix Master Slave Master Slave Slave Interrupt Controller CPU AXI interface (w/ DMA) CMU AXI interface AXI interface Clock Reset Other IPs AXI to APB Bridge APB interface Dedicated Interface Interrupt MIF (Memory I/F) DRAM E.g) LPDDR3 IRQ/FIQ Master Master

### page 14
1일차: ARM bus protocol in Mobile SoC • AMBA(Advanced Microcontroller Bus Architecture(AXI / AHB / APB)) Block #1 SubBlk #N SubBlk #2 Register block InBuf. #1 InBuffer #2 APB interface Control register Status register Interrupt related register Memory Mapped Reg. Main Controller OutBuf. #1 OutBuffer #2 SubBlk #1 Block #N SubBlk #N SubBlk #2 SubBlk #1 AXI interface (w/ DMA) Bus Matrix Master Slave Master Slave Slave Interrupt Controller CPU AXI interface (w/ DMA) CMU AXI interface AXI interface Clock Reset Other IPs AXI to APB Bridge APB interface Dedicated Interface Interrupt MIF (Memory I/F) DRAM E.g) LPDDR3 IRQ/FIQ Master Master AXI/AHB

### page 15
1일차: ASIC flow • Task view (New standard) Function vector for HW IP verification Customer (Requirement) Internal Plan Algorithm Platform & Protocol SW HW implementation (HW IP & Infrastructure) HW IP w/ SW interface SW IP (Platform/Protocol) SoC platform (CPU/Bus/HSI/Peripherals) Verification Verified SoC Platform Verified HW IP PI (Physical Implementation) ASIC (Unverified, w/o SW) SW Development HW & SW verification Delivery to CustomerASIC (Verified, w/ SW) HW & SW verification, SW Development

### page 16
1일차: Implementation environment (1/2) • Computing farm & license server • Computing farm : 숭실대 차세대반도체 서버 <- 생성된 교육생 계정 사용 • License server : 서울대 license server <- setup된 환경 파일 sourcing • xTerm • xterm is a terminal emulator • allows users to interact with a shell or command-line interface within a graphical environment • Secure Shell (SSH) • cryptographic network protocol used for secure communication between two networked devices • MobaXterm • Freeware to secure connect to remoted Linux server • 2일차에 install

### page 17
1일차: Implementation environment (2/2) • Computing farm OS • Linux <- Linux basic command • Verilog-HDL & Testbench coding • Vi editor (gvim, vim, etc) • Verilog-HDL & Testbench compilation • Cadence Xcelium (compile/elaboration/simulation) • Waveform viewer for debugging • Cadence Simvision

### page 18
1일차: Summary • Key words • Our project • Slave IP (Project #1) & Protocol conversion IP (Project #2) • 2일차 • Tool install • Environment setup • 설계 실습 (Lab #1) Block #1 SubBlk #N SubBlk #2 Register block InBuf. #1 InBuffer #2 APB interface Control register Status register Interrupt related register Memory Mapped Reg. Main Controller OutBuf. #1 OutBuffer #2 SubBlk #1 Block #N SubBlk #N SubBlk #2 SubBlk #1 AXI interface (w/ DMA) Bus Matrix Master Slave Master Slave Slave Interrupt Controller CPU AXI interface (w/ DMA) CMU AXI interface AXI interface Clock Reset Other IPs AXI to APB Bridge APB interface Dedicated Interface Interrupt MIF (Memory I/F) DRAM E.g) LPDDR3 IRQ/FIQ Master Master (New standard) Function vector for HW IP verification Customer (Requirement) Internal Plan Algorithm Platform & Protocol SW HW implementation (HW IP & Infrastructure) HW IP w/ SW interface SW IP (Platform/Protocol) SoC platform (CPU/Bus/HSI/Peripherals) Verification Verified SoC Platform Verified HW IP PI (Physical Implementation) ASIC (Unverified, w/o SW) SW Development HW & SW verification Delivery to CustomerASIC (Verified, w/ SW) HW & SW verification, SW Development Block #1 SubBlk #N SubBlk #2 Register block InBuf. #1 InBuffer #2 APB interface Control register Status register Interrupt related register Memory Mapped Reg. Main Controller OutBuf. #1 OutBuffer #2 SubBlk #1 Block #N SubBlk #N SubBlk #2 SubBlk #1 AXI interface (w/ DMA) Bus Matrix Master Slave Master Slave Slave Interrupt Controller CPU AXI interface (w/ DMA) CMU AXI interface AXI interface Clock Reset Other IPs AXI to APB Bridge APB interface Dedicated Interface Interrupt MIF (Memory I/F) DRAM E.g) LPDDR3 IRQ/FIQ Master Master w/ Packet processing ASIC SoC HW in SoC HW IP view ASIC flowAMBA in SoC

### page 19
1일차 공지 • 공지 • 베어드홀 101-3호 개방 • 수업시간: 평일 11시~12시50분 • 실습 위한 개방: 13시~16시 • VI editor • gvim tool -> • Cheat sheet -> • Verilog 문법 <- 숙련도 조사 • 초급 : ?명 • 중급 이상 : ?명 VI editor Cheat Sheet.pdf VI editor.hwpx

## 10. AXI bus protocol 이해 및 AXI interface를 갖는 HW Block 설계 및 검증_11일차.pdf
### page 1
`25년 동계 학부생연구인턴: AXI bus protocol 이해 및 AXI interface 를 갖는 HW block 설계/검증 고성능 SoC의 backbone으로 사용되는 AXI bus protocol을 이해하고, AXI interface를 갖는 HW block을 verilog를 통해 설계 및 검증한다. (`25.12/22(월)~`26.1/14(수), 11:00~12:50, 베어드홀 101-3호) 숭실대학교 차세대반도체학과 송인철(inchul.song@ssu.ac.kr)/02-828-7489)

### page 2
11일차: 수업 (`26.1/7,수) • Project 소개 • HDD(Hardware Description Document) 작성 • Project 수행~ • Summary • Q&A

### page 3
11일차: AHB to APB Project (1/3) • Block diagram iClk iRsn AHB to APB protocol conversion (1-wait AHB I/F) oPSEL oPENABLE oPWRITE oPADDR[15:0] oPWDATA[31:0] iPRDATA[31:0] iPSEL iPENABLE iPWRITE iPADDR[15:0] iPWDATA[31:0] oPRDATA[31:0] iPREADY oPREADY iHSEL iHTRANS[1:0] iHWRITE iHADDR[31:0] iHWDATA[31:0] oHRDATA[31:0] oHRESP[1:0] oHREADYout iClk iRsnClock Gen. Reset Gen. Stimulus Gen. Result Ckeck iHREADYin Ahb2Apb.v ApbSlave.v TbTop_Prj_Ahb.v FSM rA[31:0] @0x0000 wWrEnA wRdEnA rB[31:0] @0x0004 wWrEnB wRdEnB rC[31:0] @0x0008 wWrEnC wRdEnC rD[31:0] @0x000C wWrEnD wRdEnD Prj_Ahb_Top.v (0-wait APB I/F)

### page 4
11일차: AHB to APB Project (2/3) • Timing diagram iClk iRsn oPSEL oPENABLE oPWRITE oPWADDR[15:0] iPRDATA[31:0] Don't care Don't care Don't care Read Data @0008 iHSEL iHTRANS[1:0] IHWRITE IHADDR[31:0] iHWDATA oHRDATA Don't care Don't care32'h7000 _0000 32'h7000 _0008 Don't care Don't care Read Data @0008 oHREADYout Don't care Idle (2'b00) NonSeq (2'b10) oHRESP[1:0] Don't care Okay 2'b00 iHREADYin NonSeq (2'b10) NonSeq (2'b10) 32'h700 _0004 Write Data @0000 Don't care Don't care Don't care Idle (2'b00) Idle (2'b00) 1'b1 1'b1 1'b0Don't care Don't care Don't care Don't care Don't care Don't care Don't care Another slave HREADYout HREADYout (1-wait @Write) Write Data @0004 16'h0000 HREADYout (1-wait @Write) oPWDATA[31:0] 16'h0004 Don't care Don't careWrite Data @0000 Write Data @0004 iPREADY HREADYout (1-wait @Write) Don't care Don't care 16'h0008 NonSeq (2'b10) Idle (2'b00) 1'b0 Don't care 32'h7000 _000C Don't care HREADYout (1-wait @Write) Read Data @000C Okay 2'b00 16'h000CDon't care Read Data @000CDon't care Another slave HREADYout Another slave HREADYout Another slave HREADYout

### page 5
11일차: AHB to APB Project (3/3) • FSM else h_Idle h_Setup iPREADY != 1'b1 h_Enable

### page 6
11일차: AXI to APB Project (1/4) • Block diagram iClk iRsn AXI to APB protocol conversion oPSEL oPENABLE oPWRITE oPADDR[15:0] oPWDATA[31:0] iPRDATA[31:0] iPSEL iPENABLE iPWRITE iPADDR[15:0] iPWDATA[31:0] oPRDATA[31:0] iPREADY oPREADY iClk iRsnClock Gen. Reset Gen. Stimulus Gen. Result Ckeck Axi2Apb.v ApbSlave.v TbTop_Prj_Axi.v FSM rA[31:0] @0x0000 wWrEnA wRdEnA rB[31:0] @0x0004 wWrEnB wRdEnB rC[31:0] @0x0008 wWrEnC wRdEnC rD[31:0] @0x000C wWrEnD wRdEnD Prj_Axi_Top.v (0-wait APB I/F) iS_AwValid iS_AwLen[1:0] iS_AwAddr[31:0] oS_AwReady iS_Wdata[31:0] iS_WValid iS_WLast oS_WReady oS_BValid oS_BResp[1:0] iS_BReady iS_ArValid iS_ArLen[1:0] iS_ArAddr[31:0] oS_ArReady oS_RLast oS_RData[31:0] iS_RReady oS_RValid oS_RResp[1:0] 1) 32bit data (AxSize[2:0] = 3'b010) 2) Single burst (AxRLen[1:0] = 2'b00) 3) Okay Resp. (R/BResp[1:0] = 2'b00) 4)

### page 7
11일차: AXI to APB Project (2/4) • Write timing iClk oPSEL oPENABLE oPWRITE oPWADDR[15:0] iPRDATA[31:0] Don't care Don't care Don't care 16'h0000 oPWDATA[31:0] 16'h0004 Don't care Don't careWrite Data @0000 Write Data @0004 iPREADY Don't care Don't care iAWVALID iAWADDR[31:0] oAWREADY iWVALID iWLAST iWDATA[31:0] oWREADY oBVALID oBRESP[1:0] iBREADY 32'h7000_0000 Write data[31:0] @32'h7000_0000 Master Delay OKAY: 2'b00 Master Delay 32'h7000_0004 Master Delay Write data[31:0] @32'h7000_0000 OKAY: 2'b00 Master Delay Don't care Don't care Don't care Don't care Don't care Don't care Don't care Don't care Write data[31:0] @32'h7000_0000 xW_Idle xW _AwReady xW_Valid xW _Setup xW _Enable xW_BValid xW_Idle xW _AwReady xW_Valid xW _Setup xW _Enable xW_BValid xW_IdlerWrCurState

### page 8
iClk oPSEL oPENABLE oPWRITE oPWADDR[15:0] iPRDATA[31:0] Don't care Don't care16'h0008 oPWDATA[31:0] 16'h000C Don't care iPREADY Don't care iARVALID iARADDR[31:0] oARREADY oRVALID oRLAST oRDATA[31:0] iRREADY 32'h7000_0008 Read data[31:0] @32'h7000_0008 32'h7000_000C Master Delay Don't care Don't care Don't care Don't care Don't care oRESP[1:0] OKAYDon't care Don't care Don't care Don't care Read Data @0008 Read Data @000CDon't care Master Delay OKAY Read data[31:0] @32'h7000_000C Master Delay Don't care xR_Idle xR _ArReady xR _Setup xR _Enable xR_RValid xR_IdlerRdCurState xR _ArReady xR _Setup xR _Enable xR_RValid xR_Idle 11일차: AXI to APB Project (3/4) • Read timing

### page 9
else xW_Idle xW_AwReady xW_WValid xW_Setup xW_BValid xW_Enable Next cycle else else iPREADY == 1'b1 else Write FSM 11일차: AXI to APB Project (4/4) • FSM xR_Idle xR_ArReady xR_Setup xR_RValid xR_Enable else else Next cycle Read FSM else

### page 10
• Key words • Our project • AHB to APB protocol conversion HW IP • AXI to APB protocol conversion HW IP • 12일차 ~ 14일차 • Project 진행 else xW_Idle xW_AwReady xW_WValid xW_Setup xW_BValid xW_Enable Next cycle else else iPREADY == 1'b1 else Write FSM xR_Idle xR_ArReady xR_Setup xR_RValid xR_Enable else else Next cycle Read FSM else iClk oPSEL oPENABLE oPWRITE oPWADDR[15:0] iPRDATA[31:0] Don't care Don't care Don't care 16'h0000 oPWDATA[31:0] 16'h0004 Don't care Don't careWrite Data @0000 Write Data @0004 iPREADY Don't care Don't care iAWVALID iAWADDR[31:0] oAWREADY iWVALID iWLAST iWDATA[31:0] oWREADY oBVALID oBRESP[1:0] iBREADY 32'h7000_0000 Write data[31:0] @32'h7000_0000 Master Delay OKAY: 2'b00 Master Delay 32'h7000_0004 Master Delay Write data[31:0] @32'h7000_0000 OKAY: 2'b00 Master Delay Don't care Don't care Don't care Don't care Don't care Don't care Don't care Don't care Write data[31:0] @32'h7000_0000 xW_Idle xW _AwReady xW_Valid xW _Setup xW _Enable xW_BValid xW_Idle xW _AwReady xW_Valid xW _Setup xW _Enable xW_BValid xW_IdlerWrCurState iClk iRsn AXI to APB protocol conversion oPSEL oPENABLE oPWRITE oPADDR[15:0] oPWDATA[31:0] iPRDATA[31:0] iPSEL iPENABLE iPWRITE iPADDR[15:0] iPWDATA[31:0] oPRDATA[31:0] iPREADY oPREADY iClk iRsnClock Gen. Reset Gen. Stimulus Gen. Result Ckeck Axi2Apb.v ApbSlave.v TbTop_Prj_Axi.v FSM rA[31:0] @0x0000 wWrEnA wRdEnA rB[31:0] @0x0004 wWrEnB wRdEnB rC[31:0] @0x0008 wWrEnC wRdEnC rD[31:0] @0x000C wWrEnD wRdEnD Prj_Axi_Top.v (0-wait APB I/F) iS_AwValid iS_AwLen[1:0] iS_AwAddr[31:0] oS_AwReady iS_Wdata[31:0] iS_WValid iS_WLast oS_WReady oS_BValid oS_BResp[1:0] iS_BReady iS_ArValid iS_ArLen[1:0] iS_ArAddr[31:0] oS_ArReady oS_RLast oS_RData[31:0] iS_RReady oS_RValid oS_RResp[1:0] 1) 32bit data (AxSize[2:0] = 3'b010) 2) Single burst (AxRLen[1:0] = 2'b00) 3) Okay Resp. (R/BResp[1:0] = 2'b00) 4) else h_Idle h_Setup iPREADY != 1'b1 h_Enable iClk iRsn oPSEL oPENABLE oPWRITE oPWADDR[15:0] iPRDATA[31:0] Don't care Don't care Don't care Read Data @0008 iHSEL iHTRANS[1:0] IHWRITE IHADDR[31:0] iHWDATA oHRDATA Don't care Don't care32'h7000 _0000 32'h7000 _0008 Don't care Don't care Read Data @0008 oHREADYout Don't care Idle (2'b00) NonSeq (2'b10) oHRESP[1:0] Don't care Okay 2'b00 iHREADYin NonSeq (2'b10) NonSeq (2'b10) 32'h700 _0004 Write Data @0000 Don't care Don't care Don't care Idle (2'b00) Idle (2'b00) 1'b1 1'b1 1'b0Don't care Don't care Don't care Don't care Don't care Don't care Don't care Another slave HREADYout HREADYout (1-wait @Write) Write Data @0004 16'h0000 HREADYout (1-wait @Write) oPWDATA[31:0] 16'h0004 Don't care Don't careWrite Data @0000 Write Data @0004 iPREADY HREADYout (1-wait @Write) Don't care Don't care 16'h0008 NonSeq (2'b10) Idle (2'b00) 1'b0 Don't care 32'h7000 _000C Don't care HREADYout (1-wait @Write) Read Data @000C Okay 2'b00 16'h000CDon't care Read Data @000CDon't care Another slave HREADYout Another slave HREADYout Another slave HREADYout iClk iRsn AHB to APB protocol conversion (1-wait AHB I/F) oPSEL oPENABLE oPWRITE oPADDR[15:0] oPWDATA[31:0] iPRDATA[31:0] iPSEL iPENABLE iPWRITE iPADDR[15:0] iPWDATA[31:0] oPRDATA[31:0] iPREADY oPREADY iHSEL iHTRANS[1:0] iHWRITE iHADDR[31:0] iHWDATA[31:0] oHRDATA[31:0] oHRESP[1:0] oHREADYout iClk iRsnClock Gen. Reset Gen. Stimulus Gen. Result Ckeck iHREADYin Ahb2Apb.v ApbSlave.v TbTop_Prj_Ahb.v FSM rA[31:0] @0x0000 wWrEnA wRdEnA rB[31:0] @0x0004 wWrEnB wRdEnB rC[31:0] @0x0008 wWrEnC wRdEnC rD[31:0] @0x000C wWrEnD wRdEnD Prj_Ahb_Top.v (0-wait APB I/F) 11일차: Summary AXI2APB Block diagram AHB2APB Block diagram AXI2APB FSM AHB2APB Timing diagram AHB2APB FSM AXI2APB Timing diagram

### page 11
9일차 공지 • 공지 ✓베어드홀 101-3호 개방 ▪ 수업시간: 평일 11시~12시50분 ▪ 실습 위한 개방(요청시): 13시~16시 ✓연구일지 작성 • 개인 공부 ✓Verilog ✓Vi editor ✓Linux basic command ✓Bus protocol (APB/AHB/AXI)

## 2. AXI bus protocol 이해 및 AXI interface를 갖는 HW Block 설계 및 검증_02일차.pdf
### page 1
`25년 동계 학부생연구인턴: AXI bus protocol 이해 및 AXI interface 를 갖는 HW block 설계/검증 고성능 SoC의 backbone으로 사용되는 AXI bus protocol을 이해하고, AXI interface를 갖는 HW block을 verilog를 통해 설계 및 검증한다. (`25.12/22(월)~`26.1/14(수), 11:00~12:50, 베어드홀 101-3호) 숭실대학교 차세대반도체학과 송인철(inchul.song@ssu.ac.kr)/02-828-7489)

### page 2
2일차: 수업 (12/23, 화) • Tool install (MobaXterm) • MobaXterm 통한 계정 접속 • 개발 환경 구축 -> Linux command • 환경 검증 위한 Verilog & Testbench coding (Lab #1) -> VI editor • Cadence Xcelium & Simvision 실습 • Summary • Q&A

### page 3
2일차: Tool install • xTerm • xTerm is a terminal emulator • allows users to interact with a shell or command-line interface within a graphical environment • Secure Shell (SSH) • cryptographic network protocol used for secure communication between two networked devices • MobaXterm 설치 • 게시판 > MobaXterm 설명 및 설치 • Link: MobaXterm 설치 & 사용 방법 (SSH 접속)

### page 4
2일차: MobaXterm 통한 계정 접속 (1/4) • MobaXterm 실행 • Session • SSH

### page 5
2일차: MobaXterm 통한 계정 접속 (2/4) • xTerm • MobaXterm 통한 계정 접속 • Server(ssudisu1) IP address: 203.246.38.113 • Port number: 16204 • User 계정: cadedu1 ~ cadedu20 • Password: user2025 <- password 변경하지 마세요!!!

### page 6
2일차: MobaXterm 통한 계정 접속 (3/4) • xTerm • MobaXterm 통한 숭실대 서버 접속 확인

### page 7
2일차: MobaXterm 통한 계정 접속 (4/4) • xTerm • Cadence license 관련 환경 sourcing: /user/student/cadedu#/source cad_digi.cshrc • 공통 directory 확인: /user/tmp/Internship_2025_winter/

### page 8
2일차: Work Environment • Directory hierarchy 생성 • 1일차 전달한 ‘Linux command’ 참고 Internship_ (e.g Internship_Inchul.Song) /user/student/cadedu1~20 Lab1 Lab2 Lab3-1 Lab3-2 RTL TestBench List Src TbTopList Log Dump Lab4 Prj1 Prj2

### page 9
2일차: Lab #1 to test our environment (1/6) • Timing(Function) requirement • IO & Block diagram iClk (Rising Edge) iRsn (Sync & low reset) iInEnable(1-clock enable) iInA[31:0](32bit unsigned) iInB[31:0](32bit unsigned) iOutEnable(1-clock enable) oOutC(33bit unsigned) rInA[31:0] + rInB[31:0] rInB[31:0](32bit unsigned) wOutC[31:0](32bit unsigned) iInA[31:0] iInB[31:0] iClk iRsn oOutC[32:0] Combinational Logic (32bit Adder) Register TbTop_Lab1.v Lab1Top.v Clock Gen. Reset Gen. Stimulus Gen. Result Ckeck iInEnable iOutEnable

### page 10
2일차: Lab #1 to test our environment (2/6) • Verilog coding • ‘/user/tmp/Internship_2025_winter/inchul.song/Lab1/RTL/Src/Lab1_Top.v’ 참고

### page 11
2일차: Lab #1 to test our environment (3/6) • Testbench coding • ‘/user/tmp/Internship_2025_winter/inchul.song/Lab1/TbTop/TbTop_Lab1.v’ 참고

### page 12
2일차: Lab #1 to test our environment (4/6) • Xcelium (compile/elaboration/simulation) 수행 • /user/student/cadedu#/Lab1/RTL/Src/xrun -sv -access +rwc -log Lab1.log ./Lab1_Top.v • /user/student/cadedu#/Lab1/RTL/List/xrun -sv -access +rwc -log Lab1.log ./../Src/Lab1_Top.v • /user/student/cadedu#/Lab1/TestBench/xrun -sv -access +rwc -log ./Log/Lab1.log -f ./List/TEST_LIST.vc • /user/student/cadedu#/Lab1/TestBench/:run

### page 13
2일차: Lab #1 to test our environment (5/6) • Simvision (Waveform viewer & debugging) • /user/student/cadedu#/Lab1/TestBench/Dump/simvision -64 &

### page 14
2일차: Lab #1 to test our environment (6/6) • Simvision (Waveform viewer & debugging) • Design browser & waveform 사용 -> 직관적

### page 15
2일차: Summary • Key words • Our project • AXI Slave IP (Project #1) & AXI to APB Protocol conversion IP (Project #2) • 3일차 • Address map & register map 이해 • APB(One of bus protocols for HW control & status monitor) 이해 • 설계 실습 (Lab #2) iClk (Rising Edge) iRsn (Sync & low reset) iInEnable(1-clock enable) iInA[31:0](32bit unsigned) iInB[31:0](32bit unsigned) iOutEnable(1-clock enable) oOutC(33bit unsigned) rInA[31:0] + rInB[31:0] rInB[31:0](32bit unsigned) wOutC[31:0](32bit unsigned) MobaxTerm 계정 Lab1 Xcelium Simvision Internship_ (e.g Internship_Inchul.Song) /huser/student/edu1~20 Lab1 Lab2 Lab3 Lab4 RTL TestBench List Src TbTopList Log Dump AES Environment

### page 16
2일차 공지 • 공지 • 베어드홀 101-3호 개방 • 수업시간: 평일 11시~12시50분 • 실습 위한 개방: 13시~16시 • 개인 공부 • Verilog • Vi editor • Linux basic command • Bus protocol (APB/AHB/AXI)

## 3. AXI bus protocol 이해 및 AXI interface를 갖는 HW Block 설계 및 검증_03일차.pdf
### page 1
`25년 동계 학부생연구인턴: AXI bus protocol 이해 및 AXI interface 를 갖는 HW block 설계/검증 고성능 SoC의 backbone으로 사용되는 AXI bus protocol을 이해하고, AXI interface를 갖는 HW block을 verilog를 통해 설계 및 검증한다. (`25.12/22(월)~`26.1/14(수), 11:00~12:50, 베어드홀 101-3호) 숭실대학교 차세대반도체학과 송인철(inchul.song@ssu.ac.kr)/02-828-7489)

### page 2
3일차: 수업 (12/24, 수) • HW IP(Intellectual Property) & bus interface in SoC • Address map, register map 이해 • APB protocol for Lab #2 • Lab #2 (APB -> Register access) • Summary • Q&A

### page 3
3일차: HW IP & Bus interface in SoC • HW IP in SoC (general block & Interface diagram) Block #1 SubBlk #N SubBlk #2 Register block InBuf. #1 InBuffer #2 APB interface Control register Status register Interrupt related register Memory Mapped Reg. Main Controller OutBuf. #1 OutBuffer #2 SubBlk #1 Block #N SubBlk #N SubBlk #2 SubBlk #1 AXI interface Bus Matrix Master Slave Master Slave Slave Interrupt Controller CPU AXI interface CMU AXI interface AXI interface Clock Reset Other IPs AXI to APB Bridge APB interface Dedicated Interface Interrupt

### page 4
3일차: Bus interface protocol (1/3) • AMBA(Advanced Microcontroller Bus Architecture) by Arm • APB(Advanced Peripheral Bus) interface • 느린 속도의 주변장치 Control 목적으로 간단한 interface • ARM사 AMBA APB Protocol Spec. : • AHB(Advanced High-performance Bus) interface @ Bus protocol • 고속으로 동작하는 장치들의 data bus • Multiplex bus 기반 • AXI(Advanced eXtensible Bus) interface • 다중채널 bus이며, 채널 도입으로 독립적으로 작동이 가능 @ Bus protocol • 대용량 Data 전송 목적의 복잡한 interface • ARM사 AMBA AXI Protocol Spec. : IHI0024E_amba_apb_architecture_spec.pdf

### page 5
3일차: Bus interface protocol (2/3) • APB bus • 우리 project 에서는 No slave error: oPSLVERR 사용하지 않음 • APB signal descriptions

### page 6
3일차: Bus interface protocol (3/3) • APB bus • Write transfer with no wait states • Write enable timing • Write data to register • Write data to memory ??? • Read transfer with no wait states • Read enable timing • Read data from register • Read data from memory ???

### page 7
3일차: Register Map • System(SoC) View • Address map • IP(Component) view • Register map L1 Block L2 Block Start address End address Size Description Code 0x0000_0000 0x1FFF_FFFF 512MB IntRAM #1 0x2000_0000 0x3FFF_FFFF 512MB IntRAM #2 0x4000_0000 0x5FFF_FFFF 512MB Modem 0x6000_0000 0x6002_FFFF 512kB UART 0x6003_0000 0x6003_FFFF 128kB USIM 0x6004_0000 0x6004_FFFF 128kB Reserved 0x6005_0000 0x6FFF_FFFF Not used AES 0x7000_0000 0x7000_FFFF 128kB Our project address Reserved 0x7001_0000 0x7FFF_FFFF Not used DDR #1 0x8000_0000 0x9FFF_FFFF 0.5GB DDR #2 0xA000_0000 0xBFFF_FFFF 0.5GB HDD #1 0xC000_0000 0xDFFF_FFFF 0.5GB HDD #2 0xE000_0000 0xFFFF_FFFF 0.5GB Internal RAM External Memory External Device Peripheral NAME Offset Range Field Reset Access Description B AES 0x7000_0000 0xFFFF S R StartCmd 0x0000 [0:0] 0x0 W NatHw start command F [0:0] StartCmd 0x0 Set to 1 by SW : NatHw start R DataWordSize 0x0004 [31:0] 0x0 R/W Input data word size (1 word = 4 Byte, 1~512 value) F [31:0]] DataWdSize 0x0 S R AesKey_31_0 0x2000 [31:0] 0x0 R/W 128bit AES key value F [31:0] AesKey_31_0 0x0 AES key[31:0] R AesKey_63_32 0x2004 [31:0] 0x0 R/W 128bit AES key value F [31:0] AesKey_63_32 0x0 AES key[63:32] R Aeskey_95_64 0x2008 [31:0] 0x0 R/W 128bit AES key value F [31:0] AesKey_95_64 0x0 AES key[95:64] R AesKey_127_96 0x200C [31:0] 0x0 R/W 128bit AES key value F [31:0] AesKey_127_96 0x0 AES key[127:96] R AesDirection 0x2010 [0:0] 0x0 R/W AES direction F [0:0] AesDirection 0x0 1'b1: Encyption, 1'b0: Decryption S R InBufAddr_0 0x4000 [31:0] 0x0 W AES InBuf (2kB : 512depth * 4Bytes) F [31:0] InBufAddr_0 0x0 InBuf address 0 data write R InBufAddr_1 0x4004 [31:0] 0x0 W F [31:0] InBufAddr_1 0x0 InBuf address 1 data write R … … [31:0] 0x0 W … F [31:0] … 0x0 … R InBufAddr_511 0x47FC [31:0] 0x0 W F [31:0] … 0x0 InBuf address 511 data write S R OutBuf1_Addr_0 0x6000 [31:0] 0x0 R AES OutBuf #1 (2kB : 512depth * 4Bytes) F [31:0] OutBuf1_Addr_0 0x0 OutBuf #1 address 0 data read R OutBuf1_Addr_1 0x6004 [31:0] 0x0 R F [31:0] OutBuf1_Addr_1 0x0 OutBuf #1 address 1 data read R … … [31:0] 0x0 R … F [31:0] … 0x0 … R OutBuf1_Addr_511 0x67FC [31:0] 0x0 R … F [31:0] OutBuf1_Addr_511 0x0 OutBuf #1 address 511 data read S R IntEnable 0xA000 [0:0] 0x0 R/W AES interrupt enable register F [0] IntEnable 0x0 Set to 1 by SW : AES interrupt pending register Enable R IntPending 0xA004 [0:0] 0x0 R/W AES interrupt pending register F [0] IntPending 0x0 When interrupt enable is On and AES operation is done, HW write 1 to make Interrupt, If SW reads 1 and then writes 1 to clear R IntMask 0xA008 [0:0] 0x0 R/W AES interrupt mask register F [0] IntMask 0x0 Set to 1 by SW : AES interrupt transfer to interrupt output InBuf OutBuf Int Common Control

### page 8
3일차: Lab #2 APB interface & Register (1/3) NAME Offset Range Field Reset Access Description B Lab2 0x7000_0000 0xFFFF S R ApbInAData 0x0000 [31:0] 0x0 R/W F [31:0] rApbInAData 0x0 32bit unsigned Data input R ApbInBData 0x0004 [31:0] 0x0 R/W F [31:0] rApbInBData 0x0 32bit unsigned Data input S R ApbOutCData 0x2000 [31:0] 0x0 R F [31:0] rApbOutCData 0x0 32bit unsigned Data out Input Output • ‘General register’ 구현 • IO description • iClk & iRsn • APB interface • Register (Address: 0x00, 0x04, 0x2000) • 0x0000: rApbInAData[31:0] : R/W • 0x0004: rApbInBData[31:0] : R/W • 0x2000: rApbOutCData[31:0] : R only • Function • 32bit unsigned add • 32bit result는 1-clock delay 후 rApbOutCData[31:0] mapping

### page 9
3일차: Lab #2 APB interface & Register (2/3) • Block diagram rApbInA Data[31:0] iClk iRsn iPSEL iPENABLE iPWRITE iPADDR[15:0] iPWDATA[31:0] oPRDATA[31:0] wWrEnInA wWrDtInA[31:0] rApbInB Data[31:0] wWrEnInB wWrDtInB[31:0] oInA[31:0] oInB[31:0] iInA[31:0] iInB[31:0] iClk iRsn oOutC[31:0]iOutC[31:0] Combinational logic Register iPSEL iPENABLE iPWRITE iPADDR[15:0] iPWDATA[31:0] oPRDATA[31:0] iClk iRsn Lab2_Top.v Lab2_ApbIfBlk.v Lab2_FuncBlk.v rApbOutC Data[31:0] wRdEnOutC wRdDtOutC[31:0] oPREADY

### page 10
3일차: Lab #2 APB interface & Register (2/3) • Timing diagram : iClk (Rising Edge) iRsn (Sync & low reset) wWrEn wRdEn wAddr[15:0] wWrDt[31:0] rRdDt[31:0] Don't care Don't care Don't care Don't care Don't care Don't care Read data Write Addr Read Addr Write Data iPsel iPenable iPwrite iPaddr[15:0] iPwdata[31:0] oPrdata[31:0] Don't care Don't care Don't care Write Addr Read Addr Don't care Don't care Don't careWrite Data Read data oPready

### page 11
3일차: Summary • Key words • Our project • AXI Slave IP (Project #1) & AXI to APB Protocol conversion IP (Project #2) • 4일차 • Memory mapped register 설계 실습 (Lab #3-1) • Memory mapped register with endian conversion 설계 실습 (Lab #3-2) • Interrupt 설계 실습 (Lab #4) Block #1 SubBlk #N SubBlk #2 Register block InBuf. #1 InBuffer #2 APB interface Control register Status register Interrupt related register Memory Mapped Reg. Main Controller OutBuf. #1 OutBuffer #2 SubBlk #1 Block #N SubBlk #N SubBlk #2 SubBlk #1 AXI interface Bus Matrix Master Slave Master Slave Slave Interrupt Controller CPU AXI interface CMU AXI interface AXI interface Clock Reset Other IPs AXI to APB Bridge APB interface Dedicated Interface Interrupt HW IP in SoC APB Protocol NAME Offset Range Field Reset Access Description B NatHw 0x7000_0000 0xFFFF S R COM_START_COMMAND 0x0000 [0:0] 0x0 R/W NatHw start command F [0:0] COM_START_COMMAND 0x0 Set to 1 by SW : NatHw start, and then Cleared to 0 by NatHw R … 0x0004 [1:0] 0x0 R … F [0] … 0x0 … F [1] … 0x0 … R … 0x0008 [31:0] 0x0 W … F [31:0] … 0x0 … S R TABLE_1_SET_SRC_ADDR 0x2000 [31:0] 0x0 R/W NAT table contents F [31:0] TABLE_1_SET_SRC_ADDR 0x0 1st set source address[31:0] R TABLE_1_SET_DST_ADDR 0x2004 [31:0] 0x0 R/W NAT table contents F [31:0] TABLE_1_SET_DST_ADDR 0x0 1st set destination address[31:0] R … 0x2008 [31:0] 0x0 R/W … F [31:0] … 0x0 … R … 0x200C [31:0] 0x0 R/W … F [31:0] … 0x0 … S R IN_BUF_ADDR_0 0x4000 [31:0] 0x0 W NAT InBuf (2kB : 512depth * 4Bytes) F [31:0] IN_BUF_ADDR_0 0x0 InBuf address 0 data write R IN_BUF_ADDR_1 0x4004 [31:0] 0x0 W F [31:0] IN_BUF_ADDR_1 0x0 InBuf address 1 data write R … … [31:0] 0x0 W … F [31:0] … 0x0 … R IN_BUF_ADDR_511 0x47FC [31:0] 0x0 W F [31:0] … 0x0 InBuf address 511 data write S R OUT_BUF_1_ADDR_0 0x6000 [31:0] 0x0 R NAT OutBuf #1 (2kB : 512depth * 4Bytes) F [31:0] OUT_BUF_1_ADDR_0 0x0 OutBuf #1 address 0 data read R OUT_BUF_1_ADDR_1 0x6004 [31:0] 0x0 R F [31:0] OUT_BUF_1_ADDR_1 0x0 OutBuf #1 address 0 data read R … … [31:0] 0x0 R … F [31:0] … 0x0 … R OUT_BUF_1_ADDR_511 0x67FC [31:0] 0x0 R … F [31:0] OUT_BUF_1_ADDR_511 0x0 OutBuf #1 address 511 data read S R OUT_BUF_2_ADDR_0 0x8000 [31:0] 0x0 R NAT OutBuf #1 (2kB : 512depth * 4Bytes) F [31:0] OUT_BUF_1_ADDR_0 0x0 OutBuf #2 address 0 data read R OUT_BUF_2_ADDR_1 0x8004 [31:0] 0x0 R F [31:0] OUT_BUF_1_ADDR_1 0x0 OutBuf #2 address 0 data read R … … [31:0] 0x0 R … F [31:0] … 0x0 … R OUT_BUF_2_ADDR_511 0x87FC [31:0] 0x0 R … F [31:0] OUT_BUF_1_ADDR_511 0x0 OutBuf #2 address 511 data read S R INT_ENABLE 0xA000 [1:0] 0x0 R/W NAT interrupt enable register F [0] NAT_INT_ENABLE 0x0 Set to 1 by SW : Enable for NAT operation interrupt F [1] NON_NAT_INT_ENABLE 0x0 Set to 1 by SW : Enable for non-NAT operation interrupt R INT_PENDING 0xA004 [1:0] 0x0 R/W NAT interrupt pending register F [0] NAT_INT_PENDING 0x0 When NAT operation wa done, HW write 1 to make Interrupt, If SW reads 1 and then writes 1 to clear F [1] NON_NAT_INT_PENDNG 0x0 When non-NAT operation was done, HW write 1 to make Interrupt, If SW reads 1 and then writes 1 to clear R INT_MASK 0xA008 [1:0] 0x0 R/W NAT interrupt mask register F [0] NAT_INT_MASK 0x0 Set to 1 by SW : NAT interrupt occurred nomally after NAT done F [1] NOT_NAT_INT_MASK 0x0 Set to 1 by SW : Non-NAT interrupt occurred nomally after NAT done NatHw_InBuf NatHw_OutBuf #1 NatHw_OutBuf #2 NatHw_Int NatHw_Common NatHw_NatTable Register map L1 Block L2 Block Start address End address Size Description Code 0x0000_0000 0x1FFF_FFFF 512MB IntRAM #1 0x2000_0000 0x3FFF_FFFF 512MB IntRAM #2 0x4000_0000 0x5FFF_FFFF 512MB Modem 0x6000_0000 0x6002_FFFF 512kB UART 0x6003_0000 0x6003_FFFF 128kB USIM 0x6004_0000 0x6004_FFFF 128kB Reserved 0x6005_0000 0x6FFF_FFFF Not used AES 0x7000_0000 0x7000_FFFF 128kB Our project address Reserved 0x7001_0000 0x7FFF_FFFF Not used DDR #1 0x8000_0000 0x9FFF_FFFF 0.5GB DDR #2 0xA000_0000 0xBFFF_FFFF 0.5GB HDD #1 0xC000_0000 0xDFFF_FFFF 0.5GB HDD #2 0xE000_0000 0xFFFF_FFFF 0.5GB Internal RAM External Memory External Device Peripheral Address map rApbInA Data[31:0] iClk iRsn iPSEL iPENABLE iPWRITE iPADDR[15:0] iPWDATA[31:0] oPRDATA[31:0] wWrEnInA wWrDtInA[31:0] rApbInB Data[31:0] wWrEnInB wWrDtInB[31:0] oInA[31:0] oInB[31:0] iInA[31:0] iInB[31:0] iClk iRsn oOutC[31:0]iOutC[31:0] Combinational logic Register iPSEL iPENABLE iPWRITE iPADDR[15:0] iPWDATA[31:0] oPRDATA[31:0] iClk iRsn Lab2_Top.v Lab2_ApbIfBlk.v Lab2_FuncBlk.v rApbOutC Data[31:0] wRdEnOutC wRdDtOutC[31:0] oPREADY Lab #2 Block iClk (Rising Edge) iRsn (Sync & low reset) wWrEn wRdEn wAddr[15:0] wWrDt[31:0] rRdDt[31:0] Don't care Don't care Don't care Don't care Don't care Don't care Read data Write Addr Read Addr Write Data iPsel iPenable iPwrite iPaddr[15:0] iPwdata[31:0] oPrdata[31:0] Don't care Don't care Don't care Write Addr Read Addr Don't care Don't care Don't careWrite Data Read data oPready Lab #2 Timing

### page 12
3일차 공지 • 공지 • 베어드홀 101-3호 개방 • 수업시간: 평일 11시~12시50분 • 실습 위한 개방: 13시~16시 • 개인 공부 • Verilog • Vi editor • Linux basic command • Bus protocol (APB/AHB/AXI)

## 4. AXI bus protocol 이해 및 AXI interface를 갖는 HW Block 설계 및 검증_04일차.pdf
### page 1
`25년 동계 학부생연구인턴: AXI bus protocol 이해 및 AXI interface 를 갖는 HW block 설계/검증 고성능 SoC의 backbone으로 사용되는 AXI bus protocol을 이해하고, AXI interface를 갖는 HW block을 verilog를 통해 설계 및 검증한다. (`25.12/22(월)~`26.1/14(수), 11:00~12:50, 베어드홀 101-3호) 숭실대학교 차세대반도체학과 송인철(inchul.song@ssu.ac.kr)/02-828-7489)

### page 2
4일차: 수업 (12/26, 금) • Internal RAM • Memory mapped SP(Single Port)-SRAM • Lab #3-1 (APB -> SP-SRAM -> APB) • Lab #3-2 (APB -> SRAM -> Logic -> SRAM -> APB) • Lab #4 (APB -> SRAM -> Logic -> Interrupt -> SRAM -> APB) • Summary • Q&A

### page 3
4일차: RTL & Testbench 구현 및 검증 (Lab #3-1) (1/2) • ‘Memory mapped register’ 구현 • IO description • iClk & iRsn • APB interface • Memory mapped register (4 depth*32 bit) • SP SRAM library : reg [31:0] rArray[0:1] 생성 • Function (0x4000/0x4004/0x4008/0x400C) • APB access를 통해 Array에 data write • APB access를 통해 Array에 data read • 참고: Memory library 종류 • SP(Single Port) SRAM(Synchronous RAM) • 2P(Two Port) SRAM • DP(Dual Port) SRAM NAME Offset Range Field Reset Access Description B Lab3-1 0x7000_0000 0xFFFF S R InBufAddr_0 0x4000 [31:0] 0x0 R/W F [31:0] InBufAddr_0 0x0 InBuf address 0 data write R InBufAddr_1 0x4004 [31:0] 0x0 R/W F [31:0] InBufAddr_1 0x0 InBuf address 1 data write R InBufAddr_2 0x4008 [31:0] 0x0 R/W … F [31:0] InBufAddr_2 0x0 InBuf address 2 data write R InBufAddr_3 0x400C [31:0] 0x0 R/W F [31:0] InBufAddr_3 0x0 InBuf address 3 data write InBuf iPSEL iPENABLE iPWRITE iPADDR[15:0] iPWDATA[31:0] oPRDATA[31:0] iPSEL iPENABLE iPWRITE iPADDR[15:0] iPWDATA[31:0] oPRDATA[31:0] Lab3_1_Top.v iClk iRsn iClk iRsn Lab3_1_ApbIfBlk.v SpSram4x32.v oCsn oWrn oAddr[1:0] oWrDt[31:0] iRdDt[31:0] iCsn iWrn iAddr[1:0] iWrDt[31:0] oRdDt[31:0] iClk iRsn oPREADY

### page 4
4일차: RTL & Testbench 구현 및 검증 (Lab #3-1) (2/2) • Timing diagram • SP-SRAM timing • Timing diagram • APB to SP-SRAM timing conversion iClk (Rising Edge) iRsn (Sync & low reset) iCsn iWrn iAddr[1:0] iWrDt[31:0] oRdDt[31:0] Don't care Don't care Don't care Don't care Don't care Don't care Read data Write Addr Read Addr Write Data iClk (Rising Edge) iRsn (Sync & low reset) iCsn iWrn iAddr[1:0] iWrDt[31:0] oRdDt[31:0] Don't care Don't care Don't care Don't care Don't care Don't care Read data Write Addr Read Addr Write Data iPsel iPenable iPwrite iPaddr[15:0] iPwdata[31:0] oPrdata[31:0] Don't care Don't care Don't care Write Addr Read Addr Don't care Don't care Don't careWrite Data Read data oPready

### page 5
4일차: RTL & Testbench 구현 및 검증 (Lab #3-2) (1/3) • ‘Memory mapped register’ 구현 • IO description • iClk & iRsn • APB interface • Memory mapped register (512 depth*32 bit) • SP SRAM library : reg [31:0] rArray[0:511] 생성 • InBuf • OutBuf • Function (sequence) • APB access로 InBuf(0x4000~) write • APB access로 InBuf -> OutBuf transfer • Function : Endian conversion • Size register : 0x0004 • Start command: 0x0000 • 완료 후 1-clock cycle 동안 high인 Out enable 생성 • APB access로 OutBuf(0x6000~) read iPsel iPenable iPwrite iPaddr[15:0] iPwdata[31:0] oPrdata[31:0] iPsel iPenable iPwrite iPaddr[15:0] iPwdata[31:0] oPrdata[31:0] Lab3_2_Top.v iClk iRsn iClk iRsn Lab3_2_ApbIfBlk.v InBuf.v oWrEn_InBuf oWrAddr_InBuf[8:0] oWrDt_InBuf[31:0] iWen iWrAddr[8:0] iWrDt[31:0] iClk iRsn OutBuf.v Lab3_2_DtCp.v iClk iRsn iClk iRsn oRdEn_OutBuf oRdAddr_OutBuf[8:0] iRdDt_OutBuf[31:0] iRdEn iRdAddr[8:0] oRdDt[31:0] Spsram 512x32 Spsram 512x32 oRdDt[31:0] iRdEn iRdAddr[8:0] iRdDt_InBuf[31:0] oRdEn_InBuf oRdAddr_InBuf[8:0] oWrDt_OutBuf[31:0] oWrEn_OutBuf oWrAddr_OutBuf[8:0] iWrDt_OutBuf[31:0] oWrEn_OutBuf oWrAddr[8:0] iStDtCpoStDtCp oDoneiDtCpDone oOutEnableoOutEnable oPktWdSize[9:0] iPktWdSize[9:0] oPready

### page 6
4일차: RTL & Testbench 구현 및 검증 (Lab #3-2) (2/3) • Register map NAME Offset Range Field Reset Access Description B Lab3-2 0x7000_0000 0xFFFF S R Com_StCmd 0x0000 [0:0] 0x0 W Data copy start command F [0:0] StCmd 0x0 Set to 1 by SW : NatHw start R Com_PktWordSize 0x0004 [9:0] 0x0 R/W Input packet word size (1 word = 4 Byte) F [9:0]] PkWdSize 0x0 S R InBufAddr_0 0x4000 [31:0] 0x0 W InBuf address 0 data write F [31:0] InBufAddr_0 0x0 R InBufAddr_1 0x4004 [31:0] 0x0 W InBuf address 1 data write F [31:0] InBufAddr_1 0x0 R … … [31:0] 0x0 W … F [31:0] … 0x0 … R InBufAddr_511 0x47FC [31:0] 0x0 W InBuf address 511 data write F [31:0] InBufAddr_511 0x0 S R OutBuf1_Addr_0 0x6000 [31:0] 0x0 R OutBuf address 0 data read F [31:0] OutBuf1_Addr_0 0x0 R OutBuf1_Addr_1 0x6004 [31:0] 0x0 R OutBuf address 1 data read F [31:0] OutBuf1_Addr_1 0x0 R … … [31:0] 0x0 R … F [31:0] … 0x0 … R OutBuf1_Addr_511 0x67FC [31:0] 0x0 R OutBuf address 511 data read F [31:0] OutBuf1_Addr_511 0x0 Common InBuf OutBuf

### page 7
4일차: RTL & Testbench 구현 및 검증 (Lab #3-2) (3/3) • FSM(Finite State Machine) • Endian conversion @p_WrOutBuf else p_Idle p_DtCpDone p_DtLatch p_WrOutBuf p_StDtCp p_RdInBuf Next cycle Next cycle

### page 8
4일차: RTL & Testbench 구현 및 검증 (Lab #4) (1/4) • ‘Endian conversion with INT’ 구현 • IO description • iClk & iRsn • APB interface • Memory mapped register (512 depth*32 bit) • SP SRAM library : reg [31:0] rArray[0:511] 생성 • InBuf & OutBuf • Function (sequence) • Interrupt enable & mask write (0xA000, 0xA008) • APB access로 InBuf(0x4000~) write • APB access로 InBuf -> OutBuf transfer • Function : Endian conversion • Size register : 0x0004 • Start command: 0x0000 • 완료 후 Interrupt 발생 • Pending register read & clear (0xA004) • APB access로 OutBuf(0x6000~) read iPsel iPenable iPwrite iPaddr[15:0] iPwdata[31:0] oPrdata[31:0] iPsel iPenable iPwrite iPaddr[15:0] iPwdata[31:0] oPrdata[31:0] Lab4_Top.v iClk iRsn iClk iRsn Lab4_ApbIfBlk.v InBuf.v oWrEn_InBuf oWrAddr_InBuf[8:0] oWrDt_InBuf[31:0] iWen iWrAddr[8:0] iWrDt[31:0] iClk iRsn OutBuf.v Lab4_DtCp.v iClk iRsn iClk iRsn oRdEn_OutBuf oRdAddr_OutBuf[8:0] iRdDt_OutBuf[31:0] iRdEn iRdAddr[8:0] oRdDt[31:0] Spsram 512x32 Spsram 512x32 oRdDt[31:0] iRdEn iRdAddr[8:0] iRdDt_InBuf[31:0] oRdEn_InBuf oRdAddr_InBuf[8:0] oWrDt_OutBuf[31:0] oWrEn_OutBuf oWrAddr_OutBuf[8:0] iWrDt_OutBuf[31:0] oWrEn_OutBuf oWrAddr[8:0] iStDtCpoStDtCp oDoneiDtCpDone oIntoInt oPktWdSize[9:0] iPktWdSize[9:0] rIntEnable rIntPending rIntMask oPready oPready

### page 9
4일차: RTL & Testbench 구현 및 검증 (Lab #4) (2/4) • Interrupt function • Interrupt enable/pending/mask registers rIntEnable APB write 1'b1 (= Interrupt enable) rIntPending APB write 1'b1 ( = pending clear) wEnDtCpDone== 1'b1 (from FSM) oIntrIntMask APB write 1'b1 (= Mask enable) Peinding write

### page 10
4일차: RTL & Testbench 구현 및 검증 (Lab #4) (3/4) • Register map NAME Offset Range Field Reset Access Description B Lab4 0x7000_0000 0xFFFF S R Com_StCmd 0x0000 [0:0] 0x0 W Data copy start command F [0:0] StCmd 0x0 Set to 1 by SW : NatHw start R Com_PktWordSize 0x0004 [9:0] 0x0 R/W Input packet word size (1 word = 4 Byte) F [9:0]] PkWdSize 0x0 S R InBufAddr_0 0x4000 [31:0] 0x0 W InBuf address 0 data write F [31:0] InBufAddr_0 0x0 R InBufAddr_1 0x4004 [31:0] 0x0 W InBuf address 1 data write F [31:0] InBufAddr_1 0x0 R … … [31:0] 0x0 W … F [31:0] … 0x0 … R InBufAddr_511 0x47FC [31:0] 0x0 W InBuf address 511 data write F [31:0] InBufAddr_511 0x0 S R OutBuf1_Addr_0 0x6000 [31:0] 0x0 R OutBuf address 0 data read F [31:0] OutBuf1_Addr_0 0x0 R OutBuf1_Addr_1 0x6004 [31:0] 0x0 R OutBuf address 1 data read F [31:0] OutBuf1_Addr_1 0x0 R … … [31:0] 0x0 R … F [31:0] … 0x0 … R OutBuf1_Addr_511 0x67FC [31:0] 0x0 R OutBuf address 511 data read F [31:0] OutBuf1_Addr_511 0x0 S R IntEnable 0xA000 [0:0] 0x0 R/W Interrupt enable register F [0:0] Nat_IntEnable 0x0 Set to 1 by SW : Enable for DataCopy interrupt R IntPending 0xA004 [0:0] 0x0 R/W DataCopy interrupt pending register F [0:0] Nat_IntPending 0x0 When DataCopy was done, HW write 1 to make Interrupt, If SW reads 1 and then writes 1 to clear R IntMask 0xA008 [0:0] 0x0 R/W Interrupt mask register F [0:0] Nat_IntMask 0x0 Set to 1 by SW : Mask off DataCopy interrupt Common InBuf OutBuf Int

### page 11
4일차: RTL & Testbench 구현 및 검증 (Lab #4) (4/4) • New FSM(Finite State Machine) • InBuf read : @p_FstRdInBuf || @p_FstDtLatch || @p_RdAndWr • Data latch : @ p_FstDtLatch || @p_RdAndWr || @ p_LstDtLatch • OutBuf write: @p_RdAndWr || @p_LstDtLatch || @ p_LstWrOutBuf else p_Idle p_DtCpDonep_StDtCp else p_FstRdInBuf p_FstDtLatch p_RdAndWr p_LstDtLatch p_LstWrOutBuf

### page 12
4일차: Summary • Key words • Our project • AXI Slave IP (Project #1) & AXI to APB Protocol conversion IP (Project #2) • 5일차 • 4일차 Lab 계속 • Bus protocol (AXI) 이해 • HDD 소개 • AXI Slave IP (Project #1) 소개 iPsel iPenable iPwrite iPaddr[15:0] iPwdata[31:0] oPrdata[31:0] iPsel iPenable iPwrite iPaddr[15:0] iPwdata[31:0] oPrdata[31:0] Lab3_2_Top.v iClk iRsn iClk iRsn Lab3_2_ApbIfBlk.v InBuf.v oWrEn_InBuf oWrAddr_InBuf[15:0] oWrDt_InBuf[31:0] iWen iWrAddr[8:0] iWrDt[31:0] iClk iRsn OutBuf.v Lab3_2_DtCp.v iClk iRsn iClk iRsn oRdEn_OutBuf oRdAddr_OutBuf[15:0] iRdDt_OutBuf[31:0] iRdEn iRdAddr[8:0] oRdDt[31:0] Spsram 512x32 Spsram 512x32 oRdDt[31:0] iRdEn iRdAddr[8:0] iRdDt_InBuf[31:0] oRdEn_InBuf oRdAddr_InBuf[8:0] oWrDt_OutBuf[31:0] oWrEn_OutBuf oWrAddr_OutBuf[8:0] iWrDt_OutBuf[31:0] oWrEn_OutBuf oWrAddr[8:0] iStDtCpoStDtCp oDoneiDtCpDone oOutEnableoOutEnable oPktWdSize[9:0] iPktWdSize[9:0] iClk (Rising Edge) iRsn (Sync & low reset) iCsn iWrn iAddr[1:0] iWrDt[31:0] oRdDt[31:0] Don't care Don't care Don't care Don't care Don't care Don't care Read data Write Addr Read Addr Write Data iPsel iPenable iPwrite iPaddr[15:0] iPwdata[31:0] oPrdata[31:0] Don't care Don't care Don't care Write Addr Read Addr Don't care Don't care Don't careWrite Data Read data iPSEL iPENABLE iPWRITE iPADDR[15:0] iPWDATA[31:0] oPRDATA[31:0] iPSEL iPENABLE iPWRITE iPADDR[15:0] iPWDATA[31:0] oPRDATA[31:0] Lab3_1_Top.v iClk iRsn iClk iRsn Lab3_1_ApbIfBlk.v SpSram4x32.v oWrEn oRdEn oAddr[15:0] oWrDt[31:0] iRdDt[31:0] iWrEn iRdEn iAddr[15:0] iWrDt[31:0] oRdDt[31:0] iClk iRsn else p_Idle p_DtCpDone p_DtLatch p_WrOutBuf p_StDtCp p_RdInBuf Next cycle Next cycle Lab #3-2 : Memory read/write Lab #3-1 : SP-SRAM Lab #3-1 : APB to Memory Lab #3-2 : FSM iPsel iPenable iPwrite iPaddr[15:0] iPwdata[31:0] oPrdata[31:0] iPsel iPenable iPwrite iPaddr[15:0] iPwdata[31:0] oPrdata[31:0] Lab4_Top.v iClk iRsn iClk iRsn Lab4_ApbIfBlk.v InBuf.v oWrEn_InBuf oWrAddr_InBuf[8:0] oWrDt_InBuf[31:0] iWen iWrAddr[8:0] iWrDt[31:0] iClk iRsn OutBuf.v Lab4_DtCp.v iClk iRsn iClk iRsn oRdEn_OutBuf oRdAddr_OutBuf[8:0] iRdDt_OutBuf[31:0] iRdEn iRdAddr[8:0] oRdDt[31:0] Spsram 512x32 Spsram 512x32 oRdDt[31:0] iRdEn iRdAddr[8:0] iRdDt_InBuf[31:0] oRdEn_InBuf oRdAddr_InBuf[8:0] oWrDt_OutBuf[31:0] oWrEn_OutBuf oWrAddr_OutBuf[8:0] iWrDt_OutBuf[31:0] oWrEn_OutBuf oWrAddr[8:0] iStDtCpoStDtCp oDoneiDtCpDone oIntoInt oPktWdSize[9:0] iPktWdSize[9:0] rIntEnable rIntPending rIntMask rIntEnable APB write 1'b1 (= Interrupt enable) rIntPending APB write 1'b1 ( = pending clear) wEnDtCpDone== 1'b1 (from FSM) oIntrIntMask APB write 1'b1 (= Mask enable) Peinding write Lab #4 : Interrupt Lab #4 : Interrupt related register

### page 13
4일차 공지 • 공지 • 베어드홀 101-3호 개방 • 수업시간: 평일 11시~12시50분 • 실습 위한 개방(요청시): 13시~17시 • 개인 공부 • Verilog • Vi editor • Linux basic command • Bus protocol (APB/AXI)

## 6. AXI bus protocol 이해 및 AXI interface를 갖는 HW Block 설계 및 검증_06~07일차.pdf
### page 1
`25년 동계 학부생연구인턴: AXI bus protocol 이해 및 AXI interface 를 갖는 HW block 설계/검증 고성능 SoC의 backbone으로 사용되는 AXI bus protocol을 이해하고, AXI interface를 갖는 HW block을 verilog를 통해 설계 및 검증한다. (`25.12/22(월)~`26.1/14(수), 11:00~12:50, 베어드홀 101-3호) 숭실대학교 차세대반도체학과 송인철(inchul.song@ssu.ac.kr)/02-828-7489)

### page 2
6~7일차: 수업 (12/30,화~12/31,수) • Bus Topology (AHB) • AHB bus protocol • Lab #5 (AHB -> Register access) • Summary • Q&A

### page 3
6~7일차: SoC Bus Topology • Bus Topology Bus Matrix (e.g: AXI or AHB bus) Slave I/F AXI/AHB Master (CPU) Slave I/F Slave I/F Master I/F Master I/F Master I/F Master I/F AXI/AHB Master (GPU/NPU) Master I/F AXI/AHB Master (HW Block) Master I/F AXI/AHB slave (MemCtrl) Slave I/F AXI/AHB Slave (Int. RAM) Slave I/F AXI/AHB Slave (AXI2APB Bridge) Slave I/F Master I/F APB Slave (UART) Slave I/F APB Slave (I2C) Slave I/F APB Slave (Lab #2) Slave I/F Bus Topology APB bus

### page 4
6~7일차: Bus interface Protocol • AMBA(Advanced Microcontroller Bus Architecture) by Arm 1) APB(Advanced Peripheral Bus) interface • 느린 속도의 주변장치 Control 목적으로 간단한 interface • Single master / Setup & enable Phase 2) AHB(Advanced High-performance Bus) interface @ Bus protocol • 고속으로 동작하는 장치들의 data bus • Multiple masters / Address & Data Phase 중첩 • Multiplex(Decoder & Mux) bus 기반 3) AXI(Advanced eXtensible Bus) interface • 다중채널 bus이며, 채널 도입으로 독립적으로 작동이 가능 @ Bus protocol • 대용량 Data 전송 목적의 복잡한 interface

### page 5
6~7일차: AHB bus protocol (1/13) • Connection (Master) (Slave) (Slave) (Slave) Mux

### page 6
6~7일차: AHB bus protocol (2/13) • Master (Master)

### page 7
6~7일차: AHB bus protocol (3/13) • Slave (Slave)

### page 8
6~7일차: AHB bus protocol (4/13) • Decoder (w/ HSELx) (Slave) (Master) (Slave) (Slave)

### page 9
6~7일차: AHB bus protocol (5/13) • Slave mux. (Master) (Slave) (Slave) (Slave)

### page 10
6~7일차: AHB bus protocol (6/13) • AHB bus connection detail AHB Master #1 Master I/F AHB Master #2 Master I/F AHB Master #n Master I/F AHB Arbiter (Priority Ctrl) oHBUSREQ_M1 iHGRANT_M1 oHBUSREQ_M2 iHGRANT_M2 oHBUSREQ_Mn iHGRANT_Mn AHB Decoder HMASTER or HGRANT_DLY oHTRANS_M2[1:0] oHADDR_M2[31:0] oHTRANS_M1[1:0] oHADDR_M1[31:0] oHWDATA_M1[31:0] oHWDATA_M2[31:0] oHTRANS_Mn[1:0] oHADDR_Mn[31:0] oHWDATA_Mn[31:0] AHB Mux Selected HSEL delay with iHREADYin AHB Slave #1 AHB Slave #1 AHB Slave #m iHRDATA[31:0] iHREADYin iHRDATA[31:0] iHREADYin iHRDATA[31:0] iHREADYin oHSEL_S1 oHSEL_S2 oHSEL_Sm oHTRANS[1:0] oHADDR[31:0] oHWDATA[31:0] iHSEL_S2 iHTRANS[1:0] iHADDR[31:0] iHWDATA[31:0] iHTRANS[1:0] iHADDR[31:0] iHWDATA[31:0] iHSEL_Sm iHSEL_S1 iHTRANS[1:0] iHADDR[31:0] iHWDATA[31:0] oHRDATA_S1[31:0] oHREADY_S1 oHRDATA_S2[31:0] oHREADY_S2 oHRDATA_Sm[31:0] oHREADY_Sm iHRDATA_Sm[31:0] iHREADY_Sm iHRDATA_S2[31:0] oHREADY_S2 iHRDATA_S1[31:0] iHREADY_S1 Slave I/FSlave I/FSlave I/F Bus Topology 1) HWRITE/HSIZE[2:0]/HPROT[3:0] : HSEL_Sx 구간 valid !!! 2) HRESP[1:0] HRDATA[31:0]과 동 한 phase !!! iHREADYiniHREADYiniHREADYin iHREADYin

### page 11
6~7일차: AHB bus protocol (7/13) • AHB bus signals : Masters & Arbiter

### page 12
6~7일차: AHB bus protocol (8/13) • AHB bus signals : Masters & Arbiter -> HBUSREQ & HGRANT timing

### page 13
6~7일차: AHB bus protocol (9/13) • AHB bus signals : Masters & Arbiter, Decoder & Slave

### page 14
6~7일차: AHB bus protocol (10/13) • AHB bus signals : Decoder & Slave <- HSELx Slave & Mux <- HRDATA[31:0], HRESP[1:0], HREADY

### page 15
6~7일차: AHB bus protocol (11/13) • AHB basic(single) transfer • Read transfer with no wait states • Read transfer with 2 wait states • Write transfer with two wait states • Write transfer with one wait states

### page 16
6~7일차: AHB bus protocol (12/13) • AHB Multiple transfer(Single Write -> Single Read -> Single Write)

### page 17
6~7일차: AHB bus protocol (13/13) • Burst transfer (Undefined Length INCR burst)

### page 18
6~7일차: Lab #5 AHB interface & register (1/3) • ‘General register’ 구현 • IO description • iClk & iRsn • AHB interface • Register (Address: 0x00, 0x04, 0x0008) • 0x0000: rAhbInAData[31:0] : R/W • 0x0004: rAhbInBData[31:0] : R/W • 0x0008: rAhbOutCData[31:0] : R only • Function • 32bit unsigned add • 32bit resul는 1-clock delay 후 rAhbOutCData[31:0] mapping NAME Offset Range Field Reset Access Description B Lab5 0x7000_0000 0xFFFF S R AhbInAData 0x0000 [31:0] 0x0 W F [31:0] rAhbInA 0x0 32bit unsigned Data input R AhbInBData 0x0004 [31:0] 0x0 W F [31:0] rAhbInB 0x0 32bit unsigned Data input S R AhbOutCData 0x0008 [31:0] 0x0 R F [31:0] rAhbOutC 0x0 32bit unsigned Data out Input Output

### page 19
6~7일차: Lab #5 AHB interface & register (2/3) • Block diagram rAhbInA Data[31:0] iClk iRsn iHSEL iHTRANS[1:0] iHWRITE iHADDR[31:0] iHWDATA[31:0] oHRDATA[31:0] wWrEnInA wWrDtInA[31:0] rAhbInB Data[31:0] wWrEnInB wWrDtInB[31:0] oInA[31:0] oInB[31:0] iInA[31:0] iInB[31:0] iClk iRsn oOutC[31:0]iOutC[31:0] Combinational logic Register iHSEL iHTRANS[1:0] iHWRITE iHADDR[31:0] iHWDATA[31:0] oHRDATA[31:0] iClk iRsn Lab5_Top.v Lab5_AhbIfBlk.v Lab5_FuncBlk.v rAhbOutC Data[31:0] wRdSelOutC wRdDtOutC[31:0] oHREADYout IHREADYin oHRESP[1:0] oHRESP[1:0] oHREADYout 1) NonSeq: iHTRANS = 2'b10 2) No wait: oHREADYout = 1'b1 3) Okay Resp: oHRESP = 2'b00 4) HSIZE/HBURST/HPROT

### page 20
6~7일차: Lab #5 AHB interface & register (3/3) • Timing diagram iClk (Rising Edge) iRsn (Sync & low reset) wWrEnInA wRdSelOutC iWrDt[15:0] oRdDt[31:0] Don't care Don't care Don't care Read Data @OutC iHSEL iHTRANS[1:0] IHWRITE IHADDR[31:0] iHWDATA oHRDATA Don't care Don't care32'h7000_ 0000 32'h7000_ 0008 Don't care Don't care Read Data @0008 oHREADYout Don't care Idle (2'b00) NonSeq (2'b10) oHRESP[1:0] Don't care Okay 2'b00 iHREADYin NonSeq (2'b10) NonSeq (2'b10) 32'h7000_ 0004 Write Data @0000 Don't care Don't care Don't care Idle (2'b00) Idle (2'b00) 1'b1 1'b1 1'b0Don't care Don't care Don't care Don't care Don't care Don't care Don't care Don't care Another Slave HREADYout Another Slave HREADYout Lab6 HREADYout Lab6 HREADYout Another Slave HREADYout Lab6 HREADYout Another Slave HREADYout Write Data @0004 Write Data @InA Write Data @InB wWrEnInB

### page 21
6~7일차: Summary • Key words • Our project • AXI Slave IP (Project #1) & AXI to APB Protocol conversion IP (Project #2) • 8 차 • Bus protocol (AXI) 이해 • HDD 소개 • AXI Slave IP (Project #1) 소개 iClk (Rising Edge) iRsn (Sync & low reset) wWrEn wRdEn wAddr[15:0] wWrDt[31:0] rRdDt[31:0] Don't care Don't care Don't care Don't care Read data Write Addr A Write Data A iHSEL iHTRANS[1:0] IHWRITE IHADDR[31:0] iHWDATA oHRDATA Don't care Don't careWrite Addr A Read Addr C Don't care Don't care Write Data B Read data C oHREADYout Don't care Idle (2'b00) NonSeq (2'b10) oHRESP[1:0] Don't care Okay 2'b00 iHREADYin NonSeq (2'b10) NonSeq (2'b10) Write Addr B Write Data A Don't care Don't care Don't care Idle (2'b00) Idle (2'b00) 1'b1 1'b1 1'b0Don't care Don't care Don't care Don't care Don't care Don't care Don't care Don't care Don't care Don't care Don't care Write Data B Don't care Write Addr BDon't care Don't care Read Addr C Don't care Lab #5 Timing rApbInA Data[31:0] iClk iRsn iHSEL iHTRANS[1:0] iHWRITE iHADDR[31:0] iHWDATA[31:0] oHRDATA[31:0] wWrEnInA wWrDtInA[31:0] rApbInB Data[31:0] wWrEnInB wWrDtInB[31:0] oInA[31:0] oInB[31:0] iInA[31:0] iInB[31:0] iClk iRsn oOutC[31:0]iOutC[31:0] Combinational logic Register iHSEL iHTRANS[1:0] iHWRITE iHADDR[31:0] iHWDATA[31:0] oHRDATA[31:0] iClk iRsn Lab5_Top.v Lab5_ApbIfBlk.v Lab5_FuncBlk.v rApbOutC Data[31:0] wRdEnOutC wRdDtOutC[31:0] oHREADYout IHREADYin oHRESP[1:0] oHRESP[1:0] oHREADYout 1) No wait: oHREADYout = 1'b1 2) Okay Resp: oHRESP = 2'b00Lab #5 block NAME Offset Range Field Reset Access Description B Lab2 0x7000_0000 0xFFFF S R ApbInAData 0x0000 [31:0] 0x0 R/W F [31:0] rApbInAData 0x0 32bit unsigned Data input R ApbInBData 0x0004 [31:0] 0x0 R/W F [31:0] rApbInBData 0x0 32bit unsigned Data input S R ApbOutCData 0x0008 [31:0] 0x0 R F [31:0] rApbOutCData 0x0 32bit unsigned Data out Input OutputRegister map AHB Timing Bus Matrix (e.g: AXI or AHB bus) Slave I/F AXI/AHB Master (CPU) Slave I/F Slave I/F Master I/F Master I/F Master I/F Master I/F AXI/AHB Master (GPU/NPU) Master I/F AXI/AHB Master (HW Block) Master I/F AXI/AHB slave (MemCtrl) Slave I/F AXI/AHB Slave (Int. RAM) Slave I/F AXI/AHB Slave (AXI2APB Bridge) Slave I/F Master I/F APB Slave (UART) Slave I/F APB Slave (I2C) Slave I/F APB Slave (Lab #2) Slave I/F Bus Topology APB busAHB bus Topology AHB Master #1 Master I/F AHB Master #2 Master I/F AHB Master #n Master I/F AHB Arbiter (Priority Ctrl) oHBUSREQ_M1 iHGRANT_M1 oHBUSREQ_M2 iHGRANT_M2 oHBUSREQ_Mn iHGRANT_Mn AHB Decoder HMASTER or HGRANT_DLY oHTRANS_M2[1:0] oHADDR_M2[31:0] oHTRANS_M1[1:0] oHADDR_M1[31:0] oHWDATA_M1[31:0] oHWDATA_M2[31:0] oHTRANS_Mn[1:0] oHADDR_Mn[31:0] oHWDATA_Mn[31:0] AHB Mux HSEL[m-1:0] AHB Slave #1 AHB Slave #1 AHB Slave #m iHRDATA[31:0] iHREADYin iHRDATA[31:0] iHREADYin iHRDATA[31:0] iHREADYin oHSEL_S1 oHSEL_S2 oHSEL_Sm oHTRANS[1:0] oHADDR[31:0] oHWDATA[31:0] iHSEL_S2 iHTRANS[1:0] iHADDR[31:0] iHWDATA[31:0] iHTRANS[1:0] iHADDR[31:0] iHWDATA[31:0] iHSEL_Sm iHSEL_S1 iHTRANS[1:0] iHADDR[31:0] iHWDATA[31:0] oHRDATA_S1[31:0] oHREADY_S1 oHRDATA_S2[31:0] oHREADY_S2 oHRDATA_Sm[31:0] oHREADY_Sm iHRDATA_Sm[31:0] iHREADY_Sm iHRDATA_S2[31:0] oHREADY_S2 iHRDATA_S1[31:0] iHREADY_S1 Slave I/FSlave I/FSlave I/F Bus Topology 1) HWRITE/HSIZE[2:0]/HPROT[3:0] : HSEL_Sx 구간 valid !!! 2) HRESP[1:0] HRDATA[31:0]과 동 한 phase !!! iHREADYiniHREADYiniHREADYin iHREADYin AHB Protocol

### page 22
6~7일차 공지 • 공지 • 베어드홀 101-3호 개방 • 수업시간: 평 11시~12시50분 • 실습 위한 개방(요청시): 13시~16시 • 개인 공부 • Verilog • Vi editor • Linux basic command • Bus protocol (APB/AXI)

## 7. AXI bus protocol 이해 및 AXI interface를 갖는 HW Block 설계 및 검증_08일차.pdf
### page 1
`25년 동계 학부생연구인턴: AXI bus protocol 이해 및 AXI interface 를 갖는 HW block 설계/검증 고성능 SoC의 backbone으로 사용되는 AXI bus protocol을 이해하고, AXI interface를 갖는 HW block을 verilog를 통해 설계 및 검증한다. (`25.12/22(월)~`26.1/14(수), 11:00~12:50, 베어드홀 101-3호) 숭실대학교 차세대반도체학과 송인철(inchul.song@ssu.ac.kr)/02-828-7489)

### page 2
8일차: 수업 (`26.1/2,금) • Lab #6 (AHB -> SP-SRAM R/W access) • Summary • Q&A

### page 3
8일차: RTL & Testbench 구현 및 검증 (Lab #6) (1/2) • ‘Memory mapped register’ 구현 • IO description • iClk & iRsn • AHB interface • Memory mapped register (4 depth*32 bit) • SP SRAM Lib: reg [31:0] rArray[0:1] 생성 • Function(0x4000/0x4004/0x4008/0x400C) • AHB access를 통해 Array에 data write (Zero wait @ Write) • AHB access를 통해 Array에 data read (One wait @ Read) • 참고: Memory library 종류 • SP(Single Port) SRAM(Sync. RAM) • 2P(Two Port) SRAM • DP(Dual Port) SRAM NAME Offset Range Field Reset Access Description B Lab6 0x7000_0000 0xFFFF S R BufAddr_0 0x4000 [31:0] 0x0 R/W F [31:0] BufAddr_0 0x0 InBuf address 0 data write R BufAddr_1 0x4004 [31:0] 0x0 R/W F [31:0] BufAddr_1 0x0 InBuf address 1 data write R BufAddr_2 0x4008 [31:0] 0x0 R/W … F [31:0] BufAddr_2 0x0 InBuf address 2 data write R BufAddr_3 0x400C [31:0] 0x0 R/W F [31:0] BufAddr_3 0x0 InBuf address 3 data write InBuf Lab6_Top.v iClk iRsn iClk iRsn Lab6_AhbIfBlk.v SpSram4x32.v oCsn oWrn oAddr[1:0] oWrDt[31:0] iRdDt[31:0] iCsn iWrn iAddr[1:0] iWrDt[31:0] oRdDt[31:0] iClk iRsn iHSEL iHTRANS[1:0] iHWRITE iHADDR[31:0] iHWDATA[31:0] oHRDATA[31:0] iHSEL iHTRANS[1:0] iHWRITE iHADDR[31:0] iHWDATA[31:0] oHRDATA[31:0] oHREADYout iHREADYin oHRESP[1:0] oHRESP[1:0] oHREADYout 1) NonSeq: iHTRANS = 2'b10 2) No wait: oHREADYout = 1'b1 3) Okay Resp: oHRESP = 2'b00 4) HSIZE/HBURST/HPROT iAddr 2'h0 : 32'h70004000 iAddr 2'h1 : 32'h70004004 iAddr 2'h2 : 32'h70004008 iAddr 2'h3 : 32'h7000400C

### page 4
8일차: RTL & Testbench 구현 및 검증 (Lab #6) (2/2) • Timing diagram • SP-SRAM timing • Timing diagram • AHB to SP-SRAM timing conversion iClk (Rising Edge) iRsn (Sync & low reset) iCsn iWrn iAddr[1:0] iWrDt[31:0] oRdDt[31:0] Don't care Don't care Don't care Don't care Don't care Don't care Read data Write Addr Read Addr Write Data iClk iRsn iCsn iWrn iAddr[31:0] iWrDt[31:0] oRdDt[31:0] Don't care Don't care Don't care Don't care Read Data @4000 Write Addr : 4000 iHSEL iHTRANS[1:0] IHWRITE IHADDR[31:0] iHWDATA oHRDATA Don't care Don't care32'h7000_ 4000 32'h7000_ 4000 Don't care Don't care Read Data @4000 oHREADYout Don't care Idle (2'b00) NonSeq (2'b10) oHRESP[1:0] Don't care Okay 2'b00 iHREADYin NonSeq (2'b10) NonSeq (2'b10) 32'h7000_ 4004 Write Data @4000 Don't care Don't care Don't care Idle (2'b00) Idle (2'b00) 1'b1 1'b1 1'b0Don't care Don't care Don't care Don't care Don't care Don't care Don't care Don't care Don't care Don't care Read Addr : 4004 Don't care Another Slave HREADYout Another Slave HREADYout Lab6 HREADYout Lab6 HREADYout Another Slave HREADYout Lab6 HREADYout (1-wait @read) Another Slave HREADYout Write Data @4004 Write Addr : 4004 Write Data @4000 Write Data @4004

### page 5
8일차: Summary • Key words • Our project • AXI Slave IP (Project #1 -> Lab 7) • AXI to APB Protocol conversion IP (Project #2 -> Our Project) • 8일차 • Bus protocol (AXI) 이해 • HDD 소개 • AXI Slave IP (Lab #7) NAME Offset Range Field Reset Access Description B Lab6 0x7000_0000 0xFFFF S R BufAddr_0 0x4000 [31:0] 0x0 R/W F [31:0] BufAddr_0 0x0 InBuf address 0 data write R BufAddr_1 0x4004 [31:0] 0x0 R/W F [31:0] BufAddr_1 0x0 InBuf address 1 data write R BufAddr_2 0x4008 [31:0] 0x0 R/W … F [31:0] BufAddr_2 0x0 InBuf address 2 data write R BufAddr_3 0x400C [31:0] 0x0 R/W F [31:0] BufAddr_3 0x0 InBuf address 3 data write InBuf Lab6_Top.v iClk iRsn iClk iRsn Lab6_ApbIfBlk.v SpSram4x32.v oCsn oWrn oAddr[1:0] oWrDt[31:0] iRdDt[31:0] iCsn iWrn iAddr[1:0] iWrDt[31:0] oRdDt[31:0] iClk iRsn iHSEL iHTRANS[1:0] iHWRITE iHADDR[31:0] iHWDATA[31:0] oHRDATA[31:0] iHSEL iHTRANS[1:0] iHWRITE iHADDR[31:0] iHWDATA[31:0] oHRDATA[31:0] oHREADYout iHREADYin oHRESP[1:0] oHRESP[1:0] oHREADYout 1) NonSeq: iHTRANS = 2'b10 2) No wait: oHREADYout = 1'b1 3) Okay Resp: oHRESP = 2'b00 4) HSIZE/HBURST/HPROT iAddr 2'h0 : 32'h70004000 iAddr 2'h1 : 32'h70004004 iAddr 2'h2 : 32'h70004008 iAddr 2'h3 : 32'h7000400C iClk (Rising Edge) iRsn (Sync & low reset) iCsn iWrn iAddr[31:0] iWrDt[31:0] oRdDt[31:0] Don't care Don't care Don't care Don't care Read Data @4000 Write Addr : 4000 iHSEL iHTRANS[1:0] IHWRITE IHADDR[31:0] iHWDATA oHRDATA Don't care Don't care32'h7000_ 4000 32'h7000_ 4000 Don't care Don't care Read Data @4000 oHREADYout Don't care Idle (2'b00) NonSeq (2'b10) oHRESP[1:0] Don't care Okay 2'b00 iHREADYin NonSeq (2'b10) NonSeq (2'b10) 32'h7000_ 4004 Write Data @4000 Don't care Don't care Don't care Idle (2'b00) Idle (2'b00) 1'b1 1'b1 1'b0Don't care Don't care Don't care Don't care Don't care Don't care Don't care Don't care Don't care Don't care Read Addr : 4004 Don't care Another Slave HREADYout Another Slave HREADYout Lab6 HREADYout Lab6 HREADYout Another Slave HREADYout Lab6 HREADYout Another Slave HREADYout Write Data @4004 Write Addr : 4004 Write Data @4000 Write Data @4004 Lab #6 : Block diagram Lab #6 : Register map Lab #6 : AHB to Memory

### page 6
8일차 공지 • 공지 ✓베어드홀 101-3호 개방 ▪ 수업시간: 평일 11시~12시50분 ▪ 실습 위한 개방(요청시): 13시~16시 ✓연구일지 작성 • 개인 공부 ✓Verilog ✓Vi editor ✓Linux basic command ✓Bus protocol (APB/AHB/AXI)

## 8. AXI bus protocol 이해 및 AXI interface를 갖는 HW Block 설계 및 검증_09일차.pdf
### page 1
`25년 동계 학부생연구인턴: AXI bus protocol 이해 및 AXI interface 를 갖는 HW block 설계/검증 고성능 SoC의 backbone으로 사용되는 AXI bus protocol을 이해하고, AXI interface를 갖는 HW block을 verilog를 통해 설계 및 검증한다. (`25.12/22(월)~`26.1/14(수), 11:00~12:50, 베어드홀 101-3호) 숭실대학교 차세대반도체학과 송인철(inchul.song@ssu.ac.kr)/02-828-7489)

### page 2
9일차: 수업 (`26.1/5,월) • Bus Topology (AXI) • AXI bus Protocol • Summary • Q&A

### page 3
9일차: SoC Bus Topology • AXI Bus Topology Bus Matrix (e.g: AXI bus) AXI Slave I/F AXI Master (CPU) Master I/F Master I/F AXI Master I/F AXI Master (GPU/NPU) AXI Master (HW Block) AXI slave (MemCtrl) AXI Slave (Int. RAM) AXI Slave (AXI2APB Bridge) APB Master I/F APB Slave (UART) APB Slave I/F APB Slave (I2C) APB Slave I/F APB Slave (Lab #2/3) APB Slave I/F AXI Bus Topology APB bus APB Slave I/F AXI Master I/F AXI Master I/F AXI Slave I/F AXI Slave I/F Master I/F AXI Slave I/F AXI Slave I/F AXI Slave I/F DRAM I/FDDR Mem.

### page 4
9일차: Bus interface Protocol • AMBA(Advanced Microcontroller Bus Architecture) by Arm 1) APB(Advanced Peripheral Bus) interface • 느린 속도의 주변장치 Control 목적으로 간단한 interface • Single master / Setup & enable Phase 2) AHB(Advanced High-performance Bus) interface @ Bus protocol • 고속으로 동작하는 장치들의 data bus • Multiple masters / Address & Data Phase 중첩 • Multiplex(Decoder & Mux) bus 기반 3) AXI(Advanced eXtensible Bus) interface • 다중채널 bus이며, 채널 도입으로 독립적으로 작동이 가능 @ Bus protocol • 대용량 Data 전송 목적의 복잡한 interface

### page 5
9일차: AHB vs. AXI (1/2) Category AHB(Advanced High-performance Bus) AXI(Advanced eXtensible Interface) Design Philosophy Simplicity & Centralized control High performance & full scalability Bus Topology Shared bus Multi-channel & Point-to-point Address/Data Channels Shared Separated # of Channel 1 5(AW, W, B, AR, R) Read & Write parallelism Not supported Fully independent Handshake Mechanism HREADY / HRESP VALID / READY Pipelining Limited Extensive Out-of-order Transactions Not supported Supported (ID-based) Burst Transfer Limited Highly flexible Burst Termination Mostly not supported supported Outstanding Transactions Not support Multiple Transaction ID Not available Mandatory Clock Domains Single clock assumed Multi-clock supported Low-speed Peripheral support AHB to APB bridge AXI to APB bridge RTL Design Complexity Low Very High Verification Complexity Low Very High Power Efficiency Relatively efficient Higher due to performance Typical Use Cases MCUs, simple SoCs MPSoCs, CPUs, GPUs, DMAs

### page 6
9일차: AHB vs. AXI (2/2) • “AHB favors simplicity, AXI delivers performance and scalability.” • Use AHB When: ✓Single master systems ✓Simple register-based access ✓MCU-class SoCs ✓Fast development and verification • Use AXI When: ✓Multiple masters (CPU + DMA + Accelerator) ✓High-bandwidth memory access ✓Video / Image processing pipelines ✓Modem (Real time system) & MPSoC designs

### page 7
9일차: AXI bus protocol (1/11) • Independent Channels (1/2) ✓Read and write paths are separate / Address and data channels are separate. ✓This independence enables parallelism and reordering. ✓AXI Read channel: AR(Read address channel), R(Read channel).

### page 8
9일차: AXI bus protocol (2/11) • Independent Channels (2/2) ✓AXI Write channel: AW(Write address channel), W(Write channel), B(Write response channel).

### page 9
9일차: AXI bus protocol (3/11) • RS (Register slice) ✓To improving timing closure by inserting registers in the middle of a single path. ✓Does not break the VALID/READY handshake protocol in AXI.

### page 10
9일차: AXI bus protocol (4/11) • Out-of-order transaction ✓Each read or write request carries an transaction ID. ✓Responses (RID/BID) return with the same ID. ✓The master uses the ID to match responses to requests.

### page 11
9일차: AXI bus protocol (5/11) • Multiple Outstanding transaction (1/2) ✓AXI masters can issue many requests without waiting. ✓Slaves/Interconnectors may complete them whenever ready. ✓Faster targets can respond first. In-sequence transaction

### page 12
9일차: AXI bus protocol (6/11) • Multiple Outstanding transaction (2/2) Multiple Outstanding transaction

### page 13
9일차: AXI bus protocol (7/11) • AXI Write burst transaction (1/2)

### page 14
9일차: AXI bus protocol (8/11) • AXI Write burst transaction (2/2)

### page 15
9일차: AXI bus protocol (9/11) • AXI Read burst transaction (1/3) ✓Single Read transaction

### page 16
9일차: AXI bus protocol (10/11) • AXI Read burst transaction (2/3) ✓Multiple Outstanding Read transaction (ARID, RID)

### page 17
9일차: AXI bus protocol (11/11) • AXI Read burst transaction (3/3)

### page 18
9일차: Summary • Key words • Our project • AXI to APB Protocol conversion IP • 10일차 • Bus protocol (AXI) 이해 계속 • HDD 소개 및 작성법 설명 • AXI Slave IP (Lab #7) Independent channel Out-of-order transaction Multiple outstanding Write transaction Read transaction

### page 19
9일차 공지 • 공지 ✓베어드홀 101-3호 개방 ▪ 수업시간: 평일 11시~12시50분 ▪ 실습 위한 개방(요청시): 13시~16시 ✓연구일지 작성 • 개인 공부 ✓Verilog ✓Vi editor ✓Linux basic command ✓Bus protocol (APB/AHB/AXI)

## 9. AXI bus protocol 이해 및 AXI interface를 갖는 HW Block 설계 및 검증_10일차.pdf
### page 1
`25년 동계 학부생연구인턴: AXI bus protocol 이해 및 AXI interface 를 갖는 HW block 설계/검증 고성능 SoC의 backbone으로 사용되는 AXI bus protocol을 이해하고, AXI interface를 갖는 HW block을 verilog를 통해 설계 및 검증한다. (`25.12/22(월)~`26.1/14(수), 11:00~12:50, 베어드홀 101-3호) 숭실대학교 차세대반도체학과 송인철(inchul.song@ssu.ac.kr)/02-828-7489)

### page 2
10일차: 수업 (`26.1/6,화) • AXI bus Protocol • Lab #7 • Summary • Q&A

### page 3
10일차: 복습(SoC Bus Topology) • AXI Bus Topology Bus Matrix (e.g: AXI bus) AXI Slave I/F AXI Master (CPU) Master I/F Master I/F AXI Master I/F AXI Master (GPU/NPU) AXI Master (HW Block) AXI slave (MemCtrl) AXI Slave (Int. RAM) AXI Slave (AXI2APB Bridge) APB Master I/F APB Slave (UART) APB Slave I/F APB Slave (I2C) APB Slave I/F APB Slave (Lab #2/3) APB Slave I/F AXI Bus Topology APB bus APB Slave I/F AXI Master I/F AXI Master I/F AXI Slave I/F AXI Slave I/F Master I/F AXI Slave I/F AXI Slave I/F AXI Slave I/F DRAM I/FDDR Mem.

### page 4
10일차: 복습(AXI Write transaction - Waveform) • AXI Write Burst transaction (1/2)

### page 5
10일차: 복습(AXI Write transaction - Signals) • AXI Write Burst transaction (2/2)

### page 6
10일차: 복습(AXI Read transaction - Waveform) • AXI Read Burst transaction (1/2)

### page 7
10일차: 복습(AXI Read transaction - Signals) • AXI Read Burst transaction (2/2)

### page 8
10일차: Lab #7 AXI interface & register (1/3) • ‘General Register’ 구현 • IO description • iClk & iRsn • AXI interface • Register (Address: 0x0, 0x4, 0x8) • 0x0000: rInA[31:0] : R/W • 0x0004: rInB[31:0] : R/W • 0x0008: rOut[31:0] : R only • Function • 32bit unsigned add • 32bit resul는 1-clock delay 후 rOutC[31:0] mapping L1 Block L2 Block Start address End address Size Description Code 0x0000_0000 0x1FFF_FFFF 512MB IntRAM #1 0x2000_0000 0x3FFF_FFFF 512MB IntRAM #2 0x4000_0000 0x5FFF_FFFF 512MB Modem 0x6000_0000 0x6002_FFFF 512kB UART 0x6003_0000 0x6003_FFFF 128kB USIM 0x6004_0000 0x6004_FFFF 128kB Reserved 0x6005_0000 0x6FFF_FFFF Not used Lab #7 0x7000_0000 0x7000_FFFF 128kB Our project area Reserved 0x7001_0000 0x7FFF_FFFF Not used DDR #1 0x8000_0000 0x9FFF_FFFF 0.5GB DDR #2 0xA000_0000 0xBFFF_FFFF 0.5GB HDD #1 0xC000_0000 0xDFFF_FFFF 0.5GB HDD #2 0xE000_0000 0xFFFF_FFFF 0.5GB Internal RAM External Memory External Device Peripheral NAME Offset Range Field Reset Access Description B Lab7 0x7000_0000 0xFFFF S R Axi_InA 0x0000 [31:0] 0x0 W F [31:0] rInA 0x0 32bit unsigned Data input R Axi_InB 0x0004 [31:0] 0x0 W F [31:0] rInB 0x0 32bit unsigned Data input S R Axi_OutC 0x0008 [31:0] 0x0 R F [31:0] rOutC 0x0 32bit unsigned Data out Input Output

### page 9
10일차: Lab #7 AXI interface & register (2/3) • Block diagram

### page 10
10일차: Lab #7 AXI interface & register (3/3) • Timing diagram

### page 11
• Key words • Our project • AXI to APB Protocol conversion IP • 11일차 • Project 설명 및 진행 Bus Matrix (e.g: AXI bus) AXI Slave I/F AXI Master (CPU) Master I/F Master I/F AXI Master I/F AXI Master (GPU/NPU) AXI Master (HW Block) AXI slave (MemCtrl) AXI Slave (Int. RAM) AXI Slave (AXI2APB Bridge) APB Master I/F APB Slave (UART) APB Slave I/F APB Slave (I2C) APB Slave I/F APB Slave (Lab #2/3) APB Slave I/F AXI Bus Topology APB bus APB Slave I/F AXI Master I/F AXI Master I/F AXI Slave I/F AXI Slave I/F Master I/F AXI Slave I/F AXI Slave I/F AXI Slave I/F DRAM I/FDDR Mem. NAME Offset Range Field Reset Access Description B Lab7 0x7000_0000 0xFFFF S R Axi_InA 0x0000 [31:0] 0x0 W F [31:0] rInA 0x0 32bit unsigned Data input R Axi_InB 0x0004 [31:0] 0x0 W F [31:0] rInB 0x0 32bit unsigned Data input S R Axi_OutC 0x0008 [31:0] 0x0 R F [31:0] rOutC 0x0 32bit unsigned Data out Input Output 10일차: Summary Lab #7 Reg. Map AXI bus topology HDD Write transaction Read transaction Lab #7 Block Diagram

### page 12
9일차 공지 • 공지 ✓베어드홀 101-3호 개방 ▪ 수업시간: 평일 11시~12시50분 ▪ 실습 위한 개방(요청시): 13시~16시 ✓연구일지 작성 • 개인 공부 ✓Verilog ✓Vi editor ✓Linux basic command ✓Bus protocol (APB/AHB/AXI)
