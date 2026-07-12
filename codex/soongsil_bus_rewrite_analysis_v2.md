# Soongsil SoC/FPGA bus site rewrite v2

## 수정 목적

사용자가 지적한 문제는 글이 너무 정리본처럼 보이고, 실제로 본인이 수업과 Lab을 거치며 이해한 과정이 덜 드러난다는 점이었다. 이번 수정은 APB/AHB/AXI/AXI-to-APB Bridge 페이지를 새 템플릿으로 바꾸는 것이 아니라, 기존 페이지 구조를 유지하면서 문체와 기술 밀도를 다시 잡는 보존적 재작성이다.

## 확인한 원본 자료

- `숭실대 학부인턴 bus cv/수업자료` 아래 PDF 9개를 텍스트로 재추출했다.
- `숭실대 학부인턴 bus cv/LAB` 아래 Lab2, Lab3_1, Lab3_2, Lab5, Lab6, Lab7 RTL 파일을 확인했다.
- `숭실대 학부인턴 bus cv/최종 결과` 아래 `Axi2Apb.v`, `ApbSlave.v`, `Prj_Axi_Top.v`, `TbTop_Prj_Axi.v`, `Prj2.log`를 확인했다.
- `파형 사진들`, `필기 사진`, `최종 결과`에서 이미 사이트 assets로 복사된 그림을 유지했다.

## 페이지별 반영 내용

### APB

- APB를 “느린 주변장치용 bus”라고만 쓰지 않고, register access와 software-hardware control path 관점으로 설명했다.
- PDF의 Lab2 register map을 반영했다: 입력 A 0x0000, 입력 B 0x0004, 출력 C 0x2000, A+B 결과 1 clock delay.
- Lab3_1의 0x4000/0x4004/0x4008/0x400C SP-SRAM memory-mapped access를 반영했다.
- Lab3_2의 start command 0x0000, packet word size 0x0004, InBuf/OutBuf, endian conversion 흐름을 추가했다.
- Lab4의 interrupt enable/pending/mask register 의미를 APB control/status register 확장으로 설명했다.

### AHB

- AHB를 APB와 비교해 address phase와 data phase가 분리되는 bus로 설명했다.
- Lab5의 HSEL/HTRANS/HWRITE/HADDR latch 구조와 data phase write/read enable 생성 관점을 반영했다.
- Lab5 register map 0x0000, 0x0004, 0x0008과 1-clock delayed add result를 반영했다.
- Lab6의 0x7000_4000 계열 SP-SRAM access, zero-wait write, one-wait read를 반영했다.
- HREADY가 단순 완료 신호가 아니라 phase 진행을 멈추거나 풀어 주는 신호라는 설명을 추가했다.

### AXI

- AXI를 “복잡한 bus”라고 하지 않고, transaction이 AW/W/B, AR/R channel로 분리되는 구조로 설명했다.
- VALID/READY가 같은 cycle에 만날 때만 handshake가 성립한다는 기준을 직접 파형을 보는 방식으로 설명했다.
- Lab7의 0x7000_0000 입력 A, 0x7000_0004 입력 B, 0x7000_0008 출력 C register block을 반영했다.
- Lab7이 add function 자체보다 channel별 handshake와 response 검증에 의미가 있다는 식으로 문맥을 바꿨다.

### AXI-to-APB Bridge

- 최종 프로젝트를 AXI request를 APB register access로 바꾸는 protocol conversion block으로 설명했다.
- PDF와 최종 코드 기준 제한 조건을 반영했다: 32-bit data, single burst, OKAY response, APB slave 4-register target.
- write FSM 상태 `xW_Idle`, `xW_AwReady`, `xW_WValid`, `xW_Setup`, `xW_Enable`, `xW_BValid`를 반영했다.
- read FSM 상태 `xR_Idle`, `xR_ArReady`, `xR_Setup`, `xR_Enable`, `xR_RValid`를 반영했다.
- `ApbSlave.v`의 0x0000/0x0004/0x0008/0x000C register와 PREADY pulse 기반 write commit/read mux 구조를 설명했다.
- `TbTop_Prj_Axi.v`의 task 기반 AXI master modeling과 `Prj2.log`의 `PASS: 4REG write/read + timing OK` 결과를 반영했다.

## 문체 수정 기준

- “정리했습니다”, “경험했습니다”처럼 AI가 요약한 듯한 문장을 줄였다.
- “내가 파형에서 본 것은…”, “이 단계에서 잡은 핵심은…”처럼 직접 설명하는 문장으로 바꿨다.
- 개념 설명과 Lab 결과를 분리하지 않고, 개념이 실제 RTL/TB에서 어떻게 확인됐는지 이어서 썼다.
- 외부 참고자료 목록은 넣지 않았다. 이번 글은 강의자료, Lab 코드, 파형, 최종 결과를 근거로 작성했다.

## 검증

- HTML local link/image/script/css reference 검사 통과.
- UTF-8 replacement character 0개 확인.
- APB/AHB/AXI/Bridge 핵심 키워드 반영 확인: `0x2000`, `0x4000`, `0x7000_4000`, `VALID/READY`, `xW_AwReady`, `PASS: 4REG`.
