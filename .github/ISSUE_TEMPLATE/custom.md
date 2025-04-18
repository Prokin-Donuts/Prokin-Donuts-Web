---
name: 🛠 문제 해결 템플릿
about: 문제 발생 상황과 해결 과정을 기록하기 위한 템플릿입니다.
title: ''
labels: []
assignees: []
---

## ✨ What happened?  
문제가 발생한 상황 또는 개선하고 싶은 지점을 작성해주세요.

<details>
<summary>예시 보기</summary>
`log.info()` 메서드를 사용했지만, 콘솔에 로그가 출력되지 않음.  
</details>

- (내용)
- (내용)

---

## 🧠 Why did it happen?  
문제의 원인이나 배경을 설명해주세요.

<details>
<summary>예시 보기</summary>
- 테스트 코드에서 로깅을 사용했으나, 테스트 경로에는 Log4j2 설정 파일이 없어 출력되지 않음  
- `resources` 경로에 있는 설정이 테스트 실행 시 인식되지 않기 때문에 별도 설정 필요
</details>

- (내용)
- (내용)

---

## 🔧 How was it fixed?  
어떻게 해결했는지 또는 해결 방안을 설명해주세요.

<details>
<summary>예시 보기</summary>
- `src/test/resources` 경로에 `log4j2-test.xml` 파일을 추가하여 테스트 환경에서도 로그 출력 가능하게 설정
</details>

- (내용)
- (내용)

---

## 📎 Notes  
추가로 남기고 싶은 내용이나 참고 자료가 있다면 자유롭게 작성해주세요.

<details>
<summary>예시 보기</summary>
- 테스트 로그 문제는 [Log4j2 공식 문서](https://logging.apache.org/log4j/2.x/manual/configuration.html) 참조  
- `log4j2.xml`과 `log4j2-test.xml`의 우선순위 확인 필요  
</details>

- (내용)
- (내용)
