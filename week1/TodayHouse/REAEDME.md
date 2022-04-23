## 📌 구현화면
<img width="300" src="/gif/week1.gif">

## 📌 목표

- [x]  autoLayout 사용
- [x]  여러 스토리보드 component 써보기
- [x]  실제와 최대한 유사하게 구현하기 (button, label 구분해서!)

---

## 📌  핵심 개념
```
💡 - AutoLayout이란?
  - 자동으로 레이아웃을 그려줌
  - x, y축 어디에 그릴지 위치를 알아야하고, 가로 세로 사이즈를 제공해야함

```

---

## 📌 사용한 컴포넌트

- `UIButton`, `UILabel`, `UIView`, `UIImageView`, `Search Bar`
- `Tab Bar Controller`
- `Horizontal, Vertical StackView`
- `Scroll View`

---

## 📌  트러블 슈팅

```
 💡 Search Bar 테두리 삭제
  - Search Style - Equal Sapcing 으로 해결  
```

```
💡 StackView  UI 사이의 공백을 같게 설정하고 싶음
 - Distribution - Equal Spacing 으로 해결
```

```
💡 Tab Bar 아이콘이 뜨지 않음
-   Assets 에서 삽입한 이미지 선택, Render As - Original Image 선택해 해결
```

```
💡 Stack View 안 UI들의 비율을 다르게 주고 싶음
- Constraint 의 Multiplier 설정하여 해결
```

```
💡 Horizontal Scroll View  끝까지 스크롤 되지 않음
- ScrollView 안에 UIView 의 Trailing 의 constant가 133으로 잡혀있었음 → 0으로 바꿔 해결
```

```
💡 UIButton 의 이미지 크기를 조절하고 싶음
- 코드를 통한 해결 방법이 있으나 이미지 크기 자체를 줄이는 것으로 해결
```
