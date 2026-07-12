# Soongsil PDF image full audit v7

## 문제

이전 수정은 일부 문제 이미지 위주로만 crop을 고쳤다. 실제 사이트에서 `soongsil-pdf-*`로 참조되는 이미지를 전부 contact sheet로 확인해 보니, 여러 그림에서 다음 문제가 남아 있었다.

- 도식의 왼쪽 신호명이 잘림
- 오른쪽 block 또는 아래쪽 module label이 잘림
- 한 장에 두 timing diagram이 붙어 있어 작게 보임
- 슬라이드 제목, 푸터, `Block diagram`, `Timing diagram` 같은 조각이 crop 안에 남음

## 처리 기준

- HTML에서 실제 참조되는 PDF 추출 이미지 전체를 대상으로 재검사했다.
- 원본 PDF 페이지를 다시 렌더링해 도식/파형의 전체 경계가 들어오도록 crop을 넓혔다.
- 제목이나 푸터 때문에 crop을 과하게 줄이지 않고, 필요한 경우 해당 조각만 흰색으로 마스킹했다.
- 두 개 이상의 파형이 한 장에 붙어 가독성이 떨어지는 경우는 별도 이미지로 분리했다.

## 주요 수정

- APB Lab2
  - block diagram의 왼쪽 신호명과 아래 module label이 잘리지 않도록 재추출.
  - timing diagram의 왼쪽 신호명과 아래 read data 영역이 보이도록 재추출.
- APB Lab3
  - SP-SRAM timing과 APB-to-SRAM conversion timing을 별도 이미지로 분리.
- AHB Lab5
  - block diagram의 하단/상단 제목 조각을 정리.
  - timing diagram의 왼쪽 신호명이 보이도록 crop을 확장.
- AHB Lab6
  - SP-SRAM timing과 AHB-to-SRAM conversion timing은 분리된 형태 유지.
- AXI
  - topology와 independent channel 그림을 다시 crop해 슬라이드 조각과 잘림을 줄임.
  - Lab7 block diagram의 왼쪽 AXI channel 신호와 아래쪽이 보이도록 재추출.
  - Lab7 waveform은 두 screenshot을 별도 이미지로 분리.
- AXI-to-APB bridge
  - 전체 bridge block diagram을 유지하고, 부분 확대 crop은 HTML에서 제거.
  - write/read timing은 제목 조각을 제거하고 신호명이 잘리지 않도록 재추출.

## 검증

- 사이트 HTML에서 참조되는 local image path가 모두 존재하는지 확인했다.
- 이전에 문제였던 단일 이미지 참조(`soongsil-pdf-apb-lab3-sram-timing.png`, `soongsil-pdf-axi-lab7-timing.png`, `soongsil-pdf-bridge-apb-slave.png`)는 HTML에서 제거했다.
- 최종 contact sheet를 만들어 참조 이미지 20개를 다시 확인했다.
