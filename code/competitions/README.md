# 경진대회 RTL 참고 코드

기술 케이스 스터디에서 신호 흐름을 설명할 때 직접 참조하는 모듈을
모았습니다. 전체 Vivado 프로젝트, 데이터셋, weight와 테스트 실행 환경은
포함하지 않습니다.

## 2025 전국 대학생 AI 반도체 회로 설계 경진대회

- `ai-semi/error_encoder.v`
- `ai-semi/lif_neuron.v`
- `ai-semi/controller_top.v`

세 파일을 순서대로 읽으면 signed X·Y 오차를 네 방향 크기로 나누고,
네 개의 LIF 뉴런 출력을 방향 신호로 연결하는 과정을 확인할 수 있습니다.
최종 발표에서 설명한 99→32→4 전체 실험망과는 구분해 설명합니다.

## AIX 2026 Deep Learning Hardware 설계경진대회

- `aix/fastv2_network_desc_rom.v`
- `aix/fastv2_mac_array_packed_pair.v`
- `aix/fastv2_postproc_requant_pipe.v`

각각 22개 graph descriptor, 144-lane packed-pair INT8 MAC,
fixed-point requantization 경로를 보여줍니다. 전체 가속기의 scheduler,
DDR interface와 board design 가운데 본문에서 설명하는 핵심 구조만
선별했습니다.
