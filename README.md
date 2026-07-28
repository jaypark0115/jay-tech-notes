# Jay Tech Notes

제가 직접 작성하고 정리한 기술 글, 실험 기록, 논문 자료를 모아두는 개인 기술 노트입니다.
현재 공개 페이지는 메인 화면에 보이는 순서와 동일하게 `진행 중인 연구·개발`, `SNN 연구 노트`, `NRV DVS 캘리브레이션 설명`, `NRV FPGA 트러블슈팅 노트`, `GitHub 프로젝트 링크`, `SoC/FPGA 학습 노트`, `경진대회 기술 노트` 순서로 구성되어 있습니다.

이 저장소의 첫 화면은 개인적으로 정리한 글 목록이며, NRV 공식 문서가 아닙니다.
NRV와 관련된 공식 정보는 NRV docs 웹페이지에서 확인해야 합니다.

## 웹페이지로 보기

GitHub Pages 주소:

https://jaypark0115.github.io/jay-tech-notes/

## 공개 페이지 순서

### 0. 진행 중인 연구·개발

계획 카드 중 상세 페이지가 준비된 항목은 클릭할 수 있습니다. 아직 정리 중인 카드는 결과가 준비되면 상세 기록의 진입점으로 전환할 예정입니다.

1. [**LED 모션캡처 기반 드론 비행경로 제어 시스템**](https://jaypark0115.github.io/jay-tech-notes/pages/planned/01-led-motion-capture-drone.html)
   - 드론의 LED를 추적해 비행경로를 제어하고 휴대폰에서 목표·실시간 경로와 결과를 확인하는 졸업논문 시스템입니다.
   - 목표: 2026.10.10, 대한전자공학회 2026년도 추계학술대회 제출 예정
2. **산업용 로봇팔 기반 경로 검증 환경**
   - 로봇팔에 드론을 고정해 기준 경로와 모션캡처 검출 경로를 비교하며, 필요하면 산업용 리니어 모터도 활용할 계획입니다.
   - 목표: 2026.10.10
3. **신규 카메라 모듈 제품 케이스 제작**
   - 기존 3D 프린팅 브라켓 작업에서 익힌 CAD와 3D 프린터 경험을 신규 카메라 모듈의 실제 제품 케이스 제작에 적용합니다.
   - 미리보기는 카메라 케이스 설계를 위해 직접 제작한 단순화된 비기능성 3D 더미 모델을 캡처한 화면이며, 실제 회로 및 PCB 설계 정보는 포함하지 않습니다.
   - 목표: 2026.08
4. **이벤트 카메라·LiDAR 융합 데이터셋**
   - 주행·동적 장면의 이벤트 데이터와 LiDAR 거리 정보를 함께 수집하는 데이터셋 제작과 센서 제어를 준비합니다.
   - 목표: 2026.11
5. **FPGA 실시간 스테레오 정렬·보정**
   - 개발을 완료한 캘리브레이션 앱의 파라미터를 FPGA에 적용해 왜곡 보정과 스테레오 정렬을 실시간으로 처리하고, 논문과 제품 출시로 연결할 계획입니다.
   - 목표: 2027.01.01

### 1. SNN 연구 노트

1. [SA 기반 SNN 안정성 분석 논문 PDF](https://jaypark0115.github.io/jay-tech-notes/pages/snn/snn-paper.html)
   - 2026년도 대한전자공학회 하계학술대회 논문집 포스터 부문 pp.811-814에 게재된 Fashion-MNIST Sensory Adaptation SNN 논문입니다.
2. [학술대회 포스터 PDF](https://jaypark0115.github.io/jay-tech-notes/pages/snn/snn-poster.html)
   - 2026.6.23. 발표 포스터입니다. 논문 요약과 1250-neuron 후속 확장 결과를 함께 정리했습니다.
3. [fashion-mnist-sa-snn](https://github.com/jaypark0115/fashion-mnist-sa-snn)
   - Fashion-MNIST Sensory Adaptation SNN 논문 본편에 사용한 코드입니다.
4. [fashion-mnist-sa-1250-extension](https://github.com/jaypark0115/fashion-mnist-sa-1250-extension)
   - 안정 SA 파라미터를 유지하면서 excitatory/inhibitory 뉴런 수를 확장한 후속 실험 코드입니다.

### 2. NRV DVS 캘리브레이션 설명

NRV 이벤트 카메라의 캘리브레이션 기능은 제가 직접 구현했으며, 아래 한글 사용·설명 문서도 직접 작성했습니다.

1. [카메라 캘리브레이션이란?](https://jaypark0115.github.io/jay-tech-notes/pages/calibration/01-camera-calibration.html)
   - 카메라 캘리브레이션의 기본 개념, 필요한 이유, 추정되는 파라미터를 설명합니다.
2. [NRV DVS 캘리브레이션 방법](https://jaypark0115.github.io/jay-tech-notes/pages/calibration/02-dvs-calibration-method.html)
   - 이벤트 카메라 캘리브레이션에서 밝기 변화와 blinking asymmetric circle grid가 필요한 이유를 정리했습니다.
3. [촬영 환경과 준비](https://jaypark0115.github.io/jay-tech-notes/pages/calibration/03-capture-preparation.html)
   - 캘리브레이션 데이터를 얻기 전 필요한 장비, 모니터 설정, 원 간격 측정, 카메라 고정과 권장 촬영 조건을 정리했습니다.
4. [캘리브레이션 촬영 및 처리 절차](https://jaypark0115.github.io/jay-tech-notes/pages/calibration/04-calibration-workflow.html)
   - 직접 구현한 DVS Calibration 앱에서 촬영, 후보 선별, Coverage 확인, 계산과 결과 보관까지 진행하는 방법을 정리했습니다.

### 3. NRV FPGA 트러블슈팅 노트

1. [FPGA I²C 디바이스 인식 오류](https://jaypark0115.github.io/jay-tech-notes/pages/troubleshooting/02-fpga-i2c-false-ack.html)
   - 미연결 카메라 포트가 SDA를 Low로 만들며 가짜 ACK가 발생한 원인을 측정하고 Verilog 포트 결합 로직을 수정한 과정을 정리했습니다.
2. [FX10 외부 SPI 플래시 쓰기 실패](https://jaypark0115.github.io/jay-tech-notes/pages/troubleshooting/01-fx10-external-spi-flash.html)
   - page index 2의 readback mismatch를 외부 SPI NOR의 sector map과 erase 단위 문제로 좁히고 해결한 과정을 정리했습니다.

### 4. GitHub 프로젝트 링크

1. [blinking-circle-grid-for-dvs-calibration](https://github.com/jaypark0115/blinking-circle-grid-for-dvs-calibration)
   - NRV DVS 캘리브레이션에 사용할 blinking asymmetric circle grid 패턴을 모니터에 표시하기 위한 프로젝트입니다.
2. [event-arduino-stopwatch-target](https://github.com/jaypark0115/event-arduino-stopwatch-target)
   - 이벤트 카메라 실험에서 시간 변화가 있는 타깃을 구성하고 확인하기 위한 Arduino 기반 스톱워치 타깃 프로젝트입니다.
3. [stereo-fpga-camera-bracket](https://github.com/jaypark0115/stereo-fpga-camera-bracket)
   - 스테레오 이벤트 카메라 모듈과 FPGA 보드를 고정하고 기준 거리 조절을 위해 설계·출력한 3D 프린팅 브라켓 기록입니다.

### 5. SoC/FPGA 학습 노트

1. [APB Control Bus](https://jaypark0115.github.io/jay-tech-notes/pages/soc/04-apb-bus.html)
   - APB setup/enable phase와 Lab2~4의 register, SRAM, interrupt 실습을 설명합니다.
2. [AHB Pipelined Bus](https://jaypark0115.github.io/jay-tech-notes/pages/soc/05-ahb-bus.html)
   - AHB topology, address/data phase, HREADY timing과 Lab5~6의 AHB register/SRAM 실습을 정리했습니다.
3. [AXI Channel Bus](https://jaypark0115.github.io/jay-tech-notes/pages/soc/06-axi-bus.html)
   - AXI 5개 channel과 VALID/READY handshake, Lab7 AXI slave register block의 channel 동작 조건을 설명합니다.
4. [AXI-to-APB Bridge](https://jaypark0115.github.io/jay-tech-notes/pages/soc/07-axi-to-apb-bridge.html)
   - AXI-to-APB protocol conversion, write/read FSM, APB slave, testbench, PASS 로그를 기준으로 최종 프로젝트를 정리했습니다.

### 6. 경진대회 기술 케이스 스터디

문제 정의, 입력 표현, 하드웨어 구조, 검증 결과를 프로젝트별 네 문서로 구성한다.

#### 2025 전국 대학생 AI 반도체 회로 설계 경진대회 · 팀 반짝반짝

1. [프로젝트 전체 보기](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/ai-semi-00-overview.html)
   - BallControl 문제, 99→32→4 SNN 구조, 담당 범위, 검증 경계를 다룬다.
2. [입력 표현과 출력 정의](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/ai-semi-01-problem-and-design.html)
   - 11×9 one-hot 위치 입력과 무게 rate encoding을 다룬다.
3. [SNN 제어 회로와 RTL](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/ai-semi-02-snn-control-rtl.html)
   - LIF 뉴런, 시간 단계 FSM, 99→32→4 구조, 공개 Verilog의 관계를 다룬다.
4. [입력 실험과 결과 해석](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/ai-semi-03-verification-results.html)
   - 15g·30g 시뮬레이션, 합성 자원, Vivado 전력 추정값과 검증 경계를 다룬다.

#### AIX 2026 Deep Learning Hardware 설계경진대회 · 팀 경이원지

1. [프로젝트 전체 보기](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/aix-00-overview.html)
   - 정수 모델, 22개 descriptor, 두 detection head, 최종 보드 결과를 다룬다.
2. [YOLOv2 정수 양자화](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/aix-01-quantization.html)
   - 최신 32장 calibration, detector mAP, layer별 scale을 다룬다.
3. [Full-Graph FPGA 구조](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/aix-02-fpga-architecture.html)
   - DDR workspace, 22개 descriptor, 144-lane packed MAC, 두 detection head의 연결을 다룬다.
4. [229장 보드 검증](https://jaypark0115.github.io/jay-tech-notes/pages/competitions/aix-03-board-verification.html)
   - test_one, test_all, detector mAP, compute-only FPS, timing, 자원을 다룬다.
