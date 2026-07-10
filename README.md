# Jay Tech Notes

제가 직접 작성하고 정리한 기술 글, 실험 기록, 논문 메모를 모아두는 개인 페이지입니다.
현재는 Fashion-MNIST SNN 연구 자료와 NRV DVS 캘리브레이션 설명 글을 공개해두었습니다.

NRV DVS 캘리브레이션 설명은 제가 NRV 이벤트 카메라에 맞는 캘리브레이션 방법을
직접 찾아보고, 실제 설명 흐름에 맞게 다시 정리한 글 묶음입니다.

아래의 NRV DVS 캘리브레이션 글 3개는 NRV의 지원을 받아 작성한 한국어 설명 자료입니다.
이 저장소의 첫 화면은 제가 개인적으로 정리한 글 목록이며, 앞으로 추가될 개인 논문, 프로젝트 기록,
실험 노트 전체가 NRV 공식 문서라는 뜻은 아닙니다.

같은 내용의 공식 영문 문서는 NRV docs 홈페이지에서 확인할 수 있습니다.

## 웹페이지로 보기

GitHub Pages 주소:

https://jaypark0115.github.io/jay-tech-notes/

## 목차

### SNN 연구 노트

1. [fashion-mnist-sa-snn](https://github.com/jaypark0115/fashion-mnist-sa-snn): Fashion-MNIST Sensory Adaptation SNN 논문 본편 코드
2. [SA 기반 SNN 안정성 분석 논문 PDF](https://jaypark0115.github.io/jay-tech-notes/snn-paper.html)
3. [학술대회 포스터 PDF](https://jaypark0115.github.io/jay-tech-notes/snn-poster.html)
4. [fashion-mnist-sa-1250-extension](https://github.com/jaypark0115/fashion-mnist-sa-1250-extension): 1250-neuron 후속 확장 연구 코드

### NRV DVS 캘리브레이션 설명

1. [카메라 캘리브레이션이란?](https://jaypark0115.github.io/jay-tech-notes/01-camera-calibration.html)
2. [NRV DVS 캘리브레이션 방법](https://jaypark0115.github.io/jay-tech-notes/02-dvs-calibration-method.html)
3. [촬영 환경과 준비](https://jaypark0115.github.io/jay-tech-notes/03-capture-preparation.html)

### GitHub 프로젝트 링크

- [blinking-circle-grid-for-dvs-calibration](https://github.com/jaypark0115/blinking-circle-grid-for-dvs-calibration): NRV DVS 캘리브레이션에 사용할 blinking asymmetric circle grid 패턴을 모니터에 표시하기 위한 프로젝트
- [event-arduino-stopwatch-target](https://github.com/jaypark0115/event-arduino-stopwatch-target): 이벤트 카메라 실험에서 시간 변화가 있는 타깃을 구성하고 확인하기 위한 Arduino 기반 스톱워치 타깃 프로젝트

## 구성

- `index.html`: Jay Tech Notes 첫 화면과 현재 공개된 글 목록
- `snn-paper.html`: Fashion-MNIST SA 기반 SNN 안정성 분석 논문 PDF 보기 페이지
- `snn-poster.html`: Fashion-MNIST SA 기반 SNN 학술대회 포스터 PDF 보기 페이지
- `01-camera-calibration.html`: 카메라 캘리브레이션 기본 개념
- `02-dvs-calibration-method.html`: NRV DVS 캘리브레이션 방법
- `03-capture-preparation.html`: 촬영 환경과 준비
- `styles.css`: 페이지 공통 스타일과 첫 화면 전용 스타일
- `assets/`: 설명에 사용한 이미지, 논문/포스터 PDF, 카드 썸네일 자료
