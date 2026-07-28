# Competition RTL reference

이 디렉터리는 경진대회 기술 케이스 스터디에서 설명하는 실제 RTL 일부를
페이지의 설명과 함께 읽을 수 있도록 정리한 공간입니다.

## 2025 전국 대학생 AI 반도체 회로 설계 경진대회

- `ai-semi/error_encoder.v`
- `ai-semi/lif_neuron.v`
- `ai-semi/controller_top.v`

위 세 파일은 BallControl 결과물에서 직접 확인한 output-layer 제어
파이프라인입니다. 공의 위치와 속도 크기를 입력으로 받아 오차를 네 방향으로
나누고, 네 개의 LIF 뉴런 출력을 모터 방향 신호로 연결합니다.

## AIX 2026 Deep Learning Hardware 설계경진대회

- `aix/fastv2_network_desc_rom.v`
- `aix/fastv2_mac_array_packed_pair.v`
- `aix/fastv2_postproc_requant_pipe.v`

각각 22-layer graph descriptor, 144-lane packed-pair INT8 MAC,
fixed-point requantization 파이프라인을 보여줍니다. 각 기술 글에서는
이 파일들이 전체 실행 흐름에서 맡는 역할과 연결 관계를 설명합니다.
