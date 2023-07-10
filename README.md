# 카드 나눠주기 (완료시간 7/9(일) 16:00)

## 학습내용
 - Struct와 Class의 사용 상황 깨달음
 - lazy var 와 let의 차이
 - Anchor 를 활용한 auto - Layout
 - dropLast, popLast, removeLast 의 차이
 - systemLayoutSizeFitting 함수
 - UIGraphicsImage 를 활용하여 직접 이미지 생성
 - nested enum 의 사용 방식
 - intrinsicContentSize

## 작업 결과물
<p align="center">
<img width="50%" alt="image" src="https://github.com/team-dayeng/Dayeng/assets/76683388/7fcf2eda-8580-4e81-9643-558eaabb30af">
</p>

## 작업 상세내용
- LuckyGameManager
    - Divider, Players, Ground, Factory
        - Card
- 위와 같은 계층을 가집니다.
- LuckyGameManager는 Singleton으로써 게임이 진행되는 동안 계속 유지되도록 하였습니다.
- Factory는 카드를 만들어서 Divider에게 카드를 건내주고 소멸합니다.
- Divider는 GameManager의 요청에 따라 Player 와 Ground에 카드를 배정합니다.
- 카드를 놓는 로직은 수학적인 규칙을 기반으로 선정하였습니다.
    - 카드의 갯수와 Index에 따라서 레이아웃 Contraint를 계산해주었습니다.

## 고민 내용
- 현재 레이아웃 Contraint는 특정한 상황에 대해서 점화식으로 이루어져있습니다.
SubView들의 레이아웃, 크기에 따라서 UIView의 높이를 동적으로 지정해주고 싶었는데, UIView 자체는 intrinsicContentSize 가 없어서 계산하는데 실패하였습니다.