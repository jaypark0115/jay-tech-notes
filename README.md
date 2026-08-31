# Jay Tech Notes

제가 직접 작성하고 정리한 기술 글, 실험 기록, 논문 자료를 모아두는 개인 기술 노트입니다.
현재 공개 페이지는 메인 화면에 보이는 순서와 동일하게 `LED 모션캡처 기반 드론 비행경로 제어 시스템`, `SNN 연구 노트`, `NRV DVS 캘리브레이션 설명`, `NRV DVS Rectify 설명`, `이벤트 비전 스테레오 Depth 카메라`, `NRV FPGA 트러블슈팅 노트`, `사이드 프로젝트 링크`, `SoC/FPGA 학습 노트`, `경진대회 기술 노트` 순서로 구성되어 있습니다.

## 웹페이지로 보기

GitHub Pages 주소:

https://jaypark0115.github.io/jay-tech-notes/

## 공개 페이지 순서

### 1. LED 모션캡처 기반 드론 비행경로 제어 시스템 (진행중)

다중 카메라 측위를 드론 제어에 연결하는 연구입니다. 연구 계획, 체커보드 기반 4카메라 모션캡처 초기 구현, 리니어 모터를 이용한 정량 검증 계획 순서로 정리합니다.

1. [LED 모션캡처 기반 드론 비행경로 제어 연구 계획](https://jaypark0115.github.io/jay-tech-notes/pages/planned/01-led-motion-capture-drone.html)
   - 연구 목표, 시스템 구성, 역할과 단계별 검증 계획입니다.
   - 목표: 2026.10.10, 대한전자공학회 2026년도 추계학술대회 제출 예정
2. [4카메라 모션캡처 시스템 1차 구현](https://jaypark0115.github.io/jay-tech-notes/pages/planned/02-mocap-initial-implementation.html)
   - Jetson·OV9281 연결, 웹 Viewer, 캘리브레이션, 원점 설정, 체커보드 추적과 궤적 표시를 사진·영상과 함께 설명합니다.
   - 2026.08.30 코드·시험 기록 기준이며, 드론 비행과 IR LED 추적은 후속 단계입니다.
3. **산업용 리니어 모터 스테이지 기반 경로 검증 환경 — 준비 중**
   - 리니어 모터 스테이지에 LED 표적 또는 드론을 고정해 기준 경로와 모션캡처 검출 경로를 비교할 계획입니다.
   - 목표: 2026.10.10

### 2. SNN 연구 노트

1. [SA 기반 SNN 안정성 분석 논문 PDF](https://jaypark0115.github.io/jay-tech-notes/pages/snn/snn-paper.html)
   - 2026년도 대한전자공학회 하계학술대회 논문집 포스터 부문 pp.811-814에 게재된 Fashion-MNIST Sensory Adaptation SNN 논문입니다.
2. [학술대회 포스터 PDF](https://jaypark0115.github.io/jay-tech-notes/pages/snn/snn-poster.html)
   - 2026.6.23. 발표 포스터입니다. 논문 요약과 1250-neuron 후속 확장 결과를 함께 정리했습니다.
3. [fashion-mnist-sa-snn](https://github.com/jaypark0115/fashion-mnist-sa-snn)
   - Fashion-MNIST Sensory Adaptation SNN 논문 본편에 사용한 코드입니다.
4. [fashion-mnist-sa-1250-extension](https://github.com/jaypark0115/fashion-mnist-sa-1250-extension)
   - 안정 SA 파라미터를 유지하면서 excitatory/inhibitory 뉴런 수를 확장한 후속 실험 코드입니다.

### 3. NRV DVS 캘리브레이션 설명

NRV 이벤트 카메라의 캘리브레이션 기능은 제가 직접 구현했으며, 아래 한글 사용·설명 문서도 직접 작성했습니다.

1. [카메라 캘리브레이션이란?](https://jaypark0115.github.io/jay-tech-notes/pages/calibration/01-camera-calibration.html)
   - 카메라 캘리브레이션의 기본 개념, 필요한 이유, 추정되는 파라미터를 설명합니다.
2. [NRV DVS 캘리브레이션 방법](https://jaypark0115.github.io/jay-tech-notes/pages/calibration/02-dvs-calibration-method.html)
   - 이벤트 카메라 캘리브레이션에서 밝기 변화와 blinking asymmetric circle grid가 필요한 이유를 정리했습니다.
3. [촬영 환경과 준비](https://jaypark0115.github.io/jay-tech-notes/pages/calibration/03-capture-preparation.html)
   - 캘리브레이션 데이터를 얻기 전 필요한 장비, 모니터 설정, 원 간격 측정, 카메라 고정과 권장 촬영 조건을 정리했습니다.
4. [캘리브레이션 촬영 및 처리 절차](https://jaypark0115.github.io/jay-tech-notes/pages/calibration/04-calibration-workflow.html)
   - 직접 구현한 DVS Calibration 앱에서 촬영, 후보 선별, Coverage 확인, 계산과 결과 보관까지 진행하는 방법을 정리했습니다.

### 4. NRV DVS Rectify 설명

캘리브레이션 파라미터를 DVS 영상에 적용해 모노 카메라의 렌즈 왜곡을 보정(undistortion)하고, 스테레오 좌우 영상의 왜곡 보정과 대응점 정렬을 수행하는 이유와 처리 방법을 정리했습니다.

1. [DVS 정렬이 필요한 이유](https://jaypark0115.github.io/jay-tech-notes/pages/rectify/01-why-rectification.html)
   - 렌즈 왜곡과 카메라 배치 차이를 보정하고 좌우 대응점을 같은 scanline에 놓아야 하는 이유를 설명합니다.
2. [DVS 정렬 처리 원리](https://jaypark0115.github.io/jay-tech-notes/pages/rectify/02-rectification-principles.html)
   - 캘리브레이션 파라미터와 remap 좌표를 이용해 이벤트 픽셀을 이동시키는 처리 흐름을 설명합니다.
3. [Viewer에서 정렬 사용하기](https://jaypark0115.github.io/jay-tech-notes/pages/rectify/03-viewer-rectification.html)
   - Viewer에서 캘리브레이션 파일을 불러오고 실시간 Rectify 결과를 확인하는 절차를 설명합니다.

### 5. 이벤트 비전 스테레오 Depth 카메라 (진행중)

FPGA 실시간 스테레오 정렬·보정과 이벤트 카메라·LiDAR·RGB 융합 데이터셋을 연결해 이벤트 스테레오 Depth 카메라와 제로샷 위치 추정 기능을 구현하고 있습니다.

1. **FPGA 실시간 스테레오 정렬·보정**
   - 직접 구현한 캘리브레이션 앱의 파라미터를 FPGA에 적용해 왜곡 보정과 스테레오 정렬을 실시간 처리하고, 실제 카메라 제품과 Depth 처리로 연결합니다.
2. **이벤트 카메라·LiDAR·RGB 융합 데이터셋**
   - 주행·동적 장면의 이벤트, LiDAR 거리, 일반 RGB 영상을 동기화해 기록하는 프로젝트에 팀원으로 참여하고 있습니다. 이 데이터셋은 스테레오 Depth와 제로샷 위치 추정 기능 개발에 활용할 계획입니다.
3. [NRV 이벤트 스테레오 Depth 데모 영상](https://www.youtube.com/watch?v=lGbHEgp9Xqw)
   - NRV 스테레오 이벤트 카메라만으로 Depth를 처리한 영상이며, FPGA 실시간 정렬과 센서 융합 파이프라인을 연결해 이와 같은 결과를 실시간으로 구동하는 것이 목표입니다.

### 6. NRV FPGA 트러블슈팅 노트

1. [FPGA I²C 디바이스 인식 오류](https://jaypark0115.github.io/jay-tech-notes/pages/troubleshooting/02-fpga-i2c-false-ack.html)
   - 블록 디자인에서 미사용으로 제외한 포트를 내부 Verilog가 유효 SDA 변수로 다시 참조해 가짜 ACK가 발생한 원인과 수정 과정을 정리했습니다.
2. [FX10 외부 SPI 플래시 쓰기 실패](https://jaypark0115.github.io/jay-tech-notes/pages/troubleshooting/01-fx10-external-spi-flash.html)
   - 잘못된 bitstream이 CR3NV[3]을 변경해 hybrid mode가 되었지만 programmer는 uniform mode로 erase해 발생한 readback mismatch와 복구 과정을 정리했습니다.

### 7. 사이드 프로젝트 링크

1. [blinking-circle-grid-for-dvs-calibration](https://github.com/jaypark0115/blinking-circle-grid-for-dvs-calibration)
   - NRV DVS 캘리브레이션에 사용할 blinking asymmetric circle grid 패턴을 모니터에 표시하기 위한 프로젝트입니다.
2. [event-arduino-stopwatch-target](https://github.com/jaypark0115/event-arduino-stopwatch-target)
   - 이벤트 카메라 실험에서 시간 변화가 있는 타깃을 구성하고 확인하기 위한 Arduino 기반 스톱워치 타깃 프로젝트입니다.
3. [stereo-fpga-camera-bracket](https://github.com/jaypark0115/stereo-fpga-camera-bracket)
   - 스테레오 이벤트 카메라 모듈과 FPGA 보드를 고정하고 기준 거리 조절을 위해 설계·출력한 3D 프린팅 브라켓 기록입니다.
4. [신규 카메라 모듈 케이스 완성품](https://jaypark0115.github.io/jay-tech-notes/pages/planned/03-camera-module-case.html)
   - 초기 3D 모델과 실제 FX10 PCB로 조립 조건을 검토하고, 제작 담당자들과 의견을 주고받으며 Delta10 카메라의 금속 케이스와 최종 조립까지 참여한 기록입니다.

### 8. SoC/FPGA 학습 노트

1. [APB Control Bus](https://jaypark0115.github.io/jay-tech-notes/pages/soc/04-apb-bus.html)
   - APB setup/enable phase와 Lab2~4의 register, SRAM, interrupt 실습을 설명합니다.
2. [AHB Pipelined Bus](https://jaypark0115.github.io/jay-tech-notes/pages/soc/05-ahb-bus.html)
   - AHB topology, address/data phase, HREADY timing과 Lab5~6의 AHB register/SRAM 실습을 정리했습니다.
3. [AXI Channel Bus](https://jaypark0115.github.io/jay-tech-notes/pages/soc/06-axi-bus.html)
   - AXI 5개 channel과 VALID/READY handshake, Lab7 AXI slave register block의 channel 동작 조건을 설명합니다.
4. [AXI-to-APB Bridge](https://jaypark0115.github.io/jay-tech-notes/pages/soc/07-axi-to-apb-bridge.html)
   - AXI-to-APB protocol conversion, write/read FSM, APB slave, testbench, PASS 로그를 기준으로 최종 프로젝트를 정리했습니다.

### 9. 경진대회 기술 노트

제가 참여한 두 경진대회의 문제 정의, 입력 표현, 하드웨어 구조와 검증 결과를 프로젝트별 네 편의 기술 문서로 나누어 설명합니다.

#### 2025 전국 대학생 AI 반도체 회로 설계 경진대회 · 팀 반짝반짝

1. [프로젝트 전체 보기](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/ai-semi-00-overview.html)
   - BallControl 문제, 99→32→4 SNN 구조, 담당 범위와 검증 경계를 요약합니다.
2. [입력 표현과 출력 정의](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/ai-semi-01-problem-and-design.html)
   - 11×9 one-hot 위치 입력과 무게 rate encoding을 설명합니다.
3. [SNN 제어 회로와 RTL](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/ai-semi-02-snn-control-rtl.html)
   - LIF 뉴런, 시간 단계 FSM, 99→32→4 구조와 공개 Verilog의 관계를 설명합니다.
4. [입력 실험과 결과 해석](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/ai-semi-03-verification-results.html)
   - 15g·30g 시뮬레이션, 합성 자원, Vivado 전력 추정값과 검증 경계를 정리했습니다.

#### AIX 2026 Deep Learning Hardware 설계경진대회 · 팀 경이원지

1. [프로젝트 전체 보기](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/aix-00-overview.html)
   - 정수 모델, 22개 descriptor, 두 detection head와 최종 보드 결과를 요약합니다.
2. [YOLOv2 정수 양자화](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/aix-01-quantization.html)
   - 최신 32장 calibration, detector mAP와 layer별 scale을 설명합니다.
3. [Full-Graph FPGA 구조](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/aix-02-fpga-architecture.html)
   - DDR workspace, 22개 descriptor, 144-lane packed MAC과 두 detection head의 연결을 설명합니다.
4. [229장 보드 검증](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/aix-03-board-verification.html)
   - test_one, test_all, detector mAP, compute-only FPS, timing과 자원 결과를 정리했습니다.
