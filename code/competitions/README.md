# Competition RTL snapshots

이 디렉터리는 경진대회 기술 노트에서 설명하는 실제 RTL 일부를
읽기 쉬운 형태로 공개한 스냅샷입니다.

## 공개 범위

### 2025 전국 대학생 AI 반도체 회로 설계 경진대회

- `ai-semi/controller_top.v`
- `ai-semi/error_encoder.v`
- `ai-semi/lif_neuron.v`

위 세 파일은 BallControl 결과물에서 직접 확인한 output-layer 제어
파이프라인입니다. 공의 위치와 속도 크기를 입력으로 받아 오차를 네 방향으로
나누고, 네 개의 LIF 뉴런 출력을 모터 방향 신호로 연결합니다.

### AIX 2026 Deep Learning Hardware 설계경진대회

- `aix/fastv2_network_desc_rom.v`
- `aix/fastv2_mac_array_packed_pair.v`
- `aix/fastv2_postproc_requant_pipe.v`

위 세 파일은 최종 제출 패키지의 RTL 스냅샷에서 가져왔습니다. 각각
22-layer graph descriptor, 144-lane packed-pair INT8 MAC, fixed-point
requantization 파이프라인을 보여줍니다.

## 주의

- 모두 팀 프로젝트 결과물이며 특정 파일 전체를 한 사람이 단독 작성했다는
  의미로 공개한 것이 아닙니다.
- 이 디렉터리만으로 합성하거나 보드에서 실행할 수 있는 독립 패키지가 아닙니다.
- 데이터셋, weights, bitstream, 전체 Vivado 프로젝트와 경진대회 제공 자료는
  포함하지 않습니다.
- 코드는 당시 최종 산출물의 구조를 설명하기 위한 참고용 스냅샷입니다.
