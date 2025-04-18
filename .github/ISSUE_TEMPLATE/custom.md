---
name: Custom issue template
about: Describe this issue template's purpose here.
title: ''
labels: ''
assignees: ''

---

name: "🐞 Troubleshooting"
description: "문제 상황 기록 및 해결 과정 정리"
labels: ["bug", "troubleshooting"]
body:
  - type: textarea
    attributes:
      label: ❗ 문제 상황
      description: 발생한 문제나 오류 현상을 구체적으로 적어주세요.
      placeholder: 예) 실행 시 콘솔에 로그가 출력되지 않음
    validations:
      required: true

  - type: textarea
    attributes:
      label: 🔍 원인 분석
      description: 디버깅 과정 또는 원인을 유추한 내용을 작성해주세요.
      placeholder: 예) log4j2.xml에서 PatternLayout이 빠져 있었음
    validations:
      required: false

  - type: textarea
    attributes:
      label: 🛠️ 시도한 해결 방법
      description: 문제 해결을 위해 시도했던 방법들을 체크리스트 형식으로 작성해주세요.
      placeholder: |
        - [x] 의존성 확인
        - [x] log4j2 설정 파일 위치 확인
        - [ ] logger 레벨 조정
    validations:
      required: false

  - type: textarea
    attributes:
      label: ✅ 최종 해결 방법
      description: 실제로 적용해서 해결한 방법을 작성해주세요.
      placeholder: 예) 콘솔 로그에 패턴 설정 추가 → 로그 정상 출력됨
    validations:
      required: true

  - type: textarea
    attributes:
      label: 📎 참고 자료
      description: 관련 링크나 문서가 있다면 남겨주세요.
      placeholder: 예) https://log4j.apache.org/docs/
    validations:
      required: false
