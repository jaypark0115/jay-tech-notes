# Jay Tech Notes

제가 직접 작성하고 정리한 기술 글, 실험 기록, 논문 자료를 모아두는 개인 기술 노트입니다.
현재 공개 페이지는 메인 화면에 보이는 순서와 동일하게 `SNN 연구 노트`, `NRV DVS 캘리브레이션 설명`, `NRV FPGA 트러블슈팅 노트`, `GitHub 프로젝트 링크`, `SoC/FPGA 학습 노트` 순서로 구성되어 있습니다.

이 저장소의 첫 화면은 개인적으로 정리한 글 목록이며, NRV 공식 문서가 아닙니다.
NRV와 관련된 공식 정보는 NRV docs 웹페이지에서 확인해야 합니다.

## 웹페이지로 보기

GitHub Pages 주소:

https://jaypark0115.github.io/jay-tech-notes/

## 공개 페이지 순서

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

1. [카메라 캘리브레이션이란?](https://jaypark0115.github.io/jay-tech-notes/pages/calibration/01-camera-calibration.html)
   - 카메라 캘리브레이션의 기본 개념, 필요한 이유, 추정되는 파라미터를 설명합니다.
2. [NRV DVS 캘리브레이션 방법](https://jaypark0115.github.io/jay-tech-notes/pages/calibration/02-dvs-calibration-method.html)
   - 이벤트 카메라 캘리브레이션에서 밝기 변화와 blinking asymmetric circle grid가 필요한 이유를 정리했습니다.
3. [촬영 환경과 준비](https://jaypark0115.github.io/jay-tech-notes/pages/calibration/03-capture-preparation.html)
   - 캘리브레이션 데이터를 얻기 전 필요한 장비, 모니터 설정, 원 간격 측정, 카메라 고정 조건을 정리했습니다.

### 3. NRV FPGA 트러블슈팅 노트

1. [FX10 외부 SPI 플래시 쓰기 실패](https://jaypark0115.github.io/jay-tech-notes/pages/troubleshooting/01-fx10-external-spi-flash.html)
   - page index 2의 readback mismatch를 외부 SPI NOR의 sector map과 erase 단위 문제로 좁히고 해결한 과정을 정리했습니다.
2. [FPGA I²C 디바이스 인식 오류](https://jaypark0115.github.io/jay-tech-notes/pages/troubleshooting/02-fpga-i2c-false-ack.html)
   - 미연결 카메라 포트가 SDA를 Low로 만들며 가짜 ACK가 발생한 원인을 측정하고 Verilog 포트 결합 로직을 수정한 과정을 정리했습니다.

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
