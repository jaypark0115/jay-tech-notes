# Jay Tech Notes

제가 직접 작성하고 정리한 기술 글, 실험 기록, 논문 메모를 모아두는 개인 기술 노트입니다.
현재는 Fashion-MNIST SNN 연구 자료, NRV DVS 캘리브레이션 설명 글, 숭실대 SoC/FPGA Bus 학습 노트를 공개해두었습니다.

NRV DVS 캘리브레이션 글은 이벤트 카메라에 맞는 캘리브레이션 조건과 촬영 흐름을 직접 찾아보고 정리한 자료입니다.
숭실대 SoC/FPGA Bus 글은 동계 학부생연구인턴에서 다룬 APB, AHB, AXI, AXI-to-APB Bridge 실습을
강의자료, Lab 코드, SimVision 파형, 최종 RTL 검증 결과 기준으로 다시 설명한 자료입니다.

이 저장소의 첫 화면은 개인적으로 정리한 글 목록이며, NRV 공식 문서가 아닙니다.
NRV와 관련된 공식 정보는 NRV docs 웹페이지에서 확인해야 합니다.

## 웹페이지로 보기

GitHub Pages 주소:

https://jaypark0115.github.io/jay-tech-notes/

## 목차

### SNN 연구 노트

1. [SA 기반 SNN 안정성 분석 논문 PDF](https://jaypark0115.github.io/jay-tech-notes/snn-paper.html)
   - 2026년도 대한전자공학회 하계학술대회 논문집 포스터 부문 pp.811-814 게재 논문
2. [학술대회 포스터 PDF](https://jaypark0115.github.io/jay-tech-notes/snn-poster.html)
   - 2026.6.23. 발표 포스터
3. [fashion-mnist-sa-snn](https://github.com/jaypark0115/fashion-mnist-sa-snn)
   - Fashion-MNIST Sensory Adaptation SNN 논문 본편 코드
4. [fashion-mnist-sa-1250-extension](https://github.com/jaypark0115/fashion-mnist-sa-1250-extension)
   - 1250-neuron 후속 확장 연구 코드

### NRV DVS 캘리브레이션 설명

1. [카메라 캘리브레이션이란?](https://jaypark0115.github.io/jay-tech-notes/01-camera-calibration.html)
2. [NRV DVS 캘리브레이션 방법](https://jaypark0115.github.io/jay-tech-notes/02-dvs-calibration-method.html)
3. [촬영 환경과 준비](https://jaypark0115.github.io/jay-tech-notes/03-capture-preparation.html)

### SoC/FPGA Bus 학습 노트

1. [SoC/FPGA Bus 학습 노트 입구](https://jaypark0115.github.io/jay-tech-notes/04-soongsil-axi-bridge.html)
   - APB, AHB, AXI, AXI-to-APB Bridge 글로 들어가는 안내 페이지
2. [APB Control Bus](https://jaypark0115.github.io/jay-tech-notes/04-apb-bus.html)
   - APB setup/enable phase, Lab2 register block, Lab3 SRAM, Lab4 interrupt register 실습 설명
3. [AHB Pipelined Bus](https://jaypark0115.github.io/jay-tech-notes/05-ahb-bus.html)
   - AHB topology, address/data phase, Lab5 register block, Lab6 SP-SRAM wait-state 검증 설명
4. [AXI Channel Bus](https://jaypark0115.github.io/jay-tech-notes/06-axi-bus.html)
   - AXI 5개 channel, VALID/READY handshake, Lab7 AXI slave register block 설명
5. [AXI-to-APB Bridge 설계와 검증](https://jaypark0115.github.io/jay-tech-notes/07-axi-to-apb-bridge.html)
   - 최종 프로젝트의 write/read FSM, APB slave 4-register target, testbench 기반 PASS 검증 설명

### GitHub 프로젝트 링크

- [blinking-circle-grid-for-dvs-calibration](https://github.com/jaypark0115/blinking-circle-grid-for-dvs-calibration)
  - NRV DVS 캘리브레이션에 사용할 blinking asymmetric circle grid 패턴을 모니터에 표시하기 위한 프로젝트
- [event-arduino-stopwatch-target](https://github.com/jaypark0115/event-arduino-stopwatch-target)
  - 이벤트 카메라 실험에서 시간 변화가 있는 타깃을 구성하고 확인하기 위한 Arduino 기반 스톱워치 타깃 프로젝트

## 구성

- `index.html`: Jay Tech Notes 첫 화면과 공개 글 목록
- `snn-paper.html`: Fashion-MNIST SA 기반 SNN 안정성 분석 논문 PDF 보기 페이지
- `snn-poster.html`: Fashion-MNIST SA 기반 SNN 학술대회 포스터 PDF 보기 페이지
- `01-camera-calibration.html`: 카메라 캘리브레이션 기본 개념
- `02-dvs-calibration-method.html`: NRV DVS 캘리브레이션 방법
- `03-capture-preparation.html`: 촬영 환경과 준비
- `04-soongsil-axi-bridge.html`: SoC/FPGA Bus 학습 노트 입구 페이지
- `04-apb-bus.html`: APB Control Bus 실습 설명
- `05-ahb-bus.html`: AHB Pipelined Bus 실습 설명
- `06-axi-bus.html`: AXI Channel Bus 실습 설명
- `07-axi-to-apb-bridge.html`: AXI-to-APB Bridge 설계와 검증 설명
- `styles.css`: 페이지 공통 스타일
- `script.js`: 검색과 페이지 상호작용 스크립트
- `assets/`: 설명에 사용한 이미지, 논문/포스터 PDF, 카드 썸네일 자료
- `codex/`: 사이트 수정 과정에서 사용한 분석, 추출, 검증 기록

## 최근 갱신

- 숭실대 SoC/FPGA Bus 학습 노트를 APB, AHB, AXI, AXI-to-APB Bridge로 분리했습니다.
- 각 페이지는 단순 개념 요약이 아니라 강의자료와 Lab 코드, 파형, 최종 프로젝트 로그를 바탕으로 직접 설명하는 글로 다시 작성했습니다.
- AXI-to-APB Bridge 최종 프로젝트는 `Axi2Apb`, `ApbSlave`, `Prj_Axi_Top`, `TbTop_Prj_Axi`와 최종 `PASS: 4REG write/read + timing OK` 로그 기준으로 정리했습니다.
