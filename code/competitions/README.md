# 경진대회 RTL 참고 코드

이 디렉터리는 기술 케이스 스터디에서 참조하는 RTL 모듈을 포함한다. 전체
Vivado 프로젝트, 데이터셋, weight, 테스트 실행 환경은 포함하지 않는다.

## 2025 전국 대학생 AI 반도체 회로 설계 경진대회

- `ai-semi/error_encoder.v`
- `ai-semi/lif_neuron.v`
- `ai-semi/controller_top.v`

세 파일은 signed X·Y 오차를 네 방향 크기로 분리하고, 네 개의 LIF 뉴런
출력을 방향 신호로 연결하는 output-layer 제어 경로를 보여준다. 최종 발표의
99→32→4 전체 실험망과는 범위가 다르다.

## AIX 2026 Deep Learning Hardware 설계경진대회

- `aix/fastv2_network_desc_rom.v`
- `aix/fastv2_mac_array_packed_pair.v`
- `aix/fastv2_postproc_requant_pipe.v`

각각 22개 graph descriptor, 144-lane packed-pair INT8 MAC,
fixed-point requantization 경로를 포함한다. 전체 가속기의 scheduler, DDR
interface, board design 가운데 공개 가능한 설명 범위의 모듈이다.
