# 경진대회 기술 케이스 스터디 근거 맵

작성 목적: 공개 페이지의 주장, 수치, 코드 범위를 원본 산출물과 대응시켜
향후 수정 과정에서 과장되거나 서로 다른 프로젝트의 내용이 섞이지 않도록 한다.

## 2025 전국 대학생 AI 반도체 회로 설계 경진대회

| 공개 내용 | 근거 |
|---|---|
| 대회명, 팀명 반짝반짝 | `AI_SEMI_MASTER_DOSSIER_V2_팀장중심.txt`, 사용자 확인 |
| 30×30cm 보드, 공 1~30g, 무작위 초기 위치, 중앙 1cm 목표 | 2차 과제 Q&A 정리 및 최종 발표자료 |
| 1차 SNN/LIF 조사에서 2차 BallControl로 이어진 흐름 | `AI_SEMI_MASTER_DOSSIER_SINGLE_FILE.txt`, 중간·최종 발표자료 |
| `error_encoder → 4×LIF → motor direction` | `controller_top.v`, `error_encoder.v`, `lif_neuron.v` |
| one-shot 입력에서 무게 반영 rate encoding으로 확장 | `실험 1.zip`, `실험 2.zip`, `EXPERIMENT1_2_CODE_VERIFICATION.txt` |
| LUT 10, FF 41, DSP/BRAM 0, I/O 83 | 최종 발표자료 39쪽 |
| 2.302W, dynamic 2.165W, static 0.137W | 최종 발표자료 40쪽 |

작성 제한:

- 코드로 직접 확인되는 범위는 output-layer 제어 파이프라인이다.
- 자원과 전력 수치는 발표자료 기반 도구 추정치로 표기한다.
- “전체 물리 시스템을 단독으로 end-to-end 구현했다”는 표현을 사용하지 않는다.

## AIX 2026 Deep Learning Hardware 설계경진대회

| 공개 내용 | 근거 |
|---|---|
| 공식 대회명, 팀명 경이원지 | 경진대회 자료, 사용자 확인 |
| representative calibration과 mAP 기준 multiplier 선택 | 프로젝트 작업 기록과 발표 대본 |
| INT8 저장, INT32 누산, requantization | 최종 README와 `fastv2_postproc_requant_pipe.v` |
| 22-layer Conv/Pool/Route/Upsample graph | `fastv2_network_desc_rom.v` |
| 144-lane packed-pair MAC | `fastv2_mac_array_packed_pair.v` |
| CONV14와 CONV20 두 detection head | 최종 README, `yolo_engine.v`, host test code |
| 229/229 PASS, 11.420687 FPS, 78.60% mAP | `host/outputs/test_all/FINAL_RESULT.txt` |
| WNS +0.111ns, LUT/FF/BRAM/DSP 사용량 | `reports/build_summary_final.txt`, timing/utilization reports |
| 1.842W, confidence Low | Vivado routed power report |

작성 제한:

- 공개 페이지는 프로젝트의 기술 내용과 검증 과정에 집중한다.
- 발표 슬라이드 화면을 그대로 캡처한 이미지는 사용하지 않는다.
- 중간 속도 실험값을 최종 성과처럼 사용하지 않는다.
- compute-only FPS와 JTAG 기반 전체 실행 시간을 구분한다.
- power는 실제 보드 측정값이 아닌 Vivado 추정값으로 표시한다.
- 개인 기여는 양자화 실험, RTL 통합·최적화, 보드 검증, 재현 패키징으로
  정리하고 특정 모듈을 단독 작성했다고 단정하지 않는다.
