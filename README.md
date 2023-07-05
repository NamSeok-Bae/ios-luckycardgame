# 럭키카드 클래스 구현하기 (완료시간 7/5(화) 16:00)

## 학습내용
 - OOP, POP 학습하기
 - SOLID 원칙 학습하기
 - Class, Struct 학습하기
 - 클래스 구조 설계하기
 - OOP, POP 방식으로 설계 및 구현 도전
 - iOS의 메모리 스택
 - 타입별 메모리

## 작업 결과물
<img width="90%" alt="image" src="https://github.com/team-dayeng/Dayeng/assets/76683388/6e533145-1329-49bf-b919-dc362e81ec91">

## 작업 상세내용
- SOLID 원칙을 지키는 방식으로 구현하였습니다.
- Card, CardFactory, Deck 클래스가 서로 각각 연관되고 역할이 분담됩니다.
    - animal과 숫자 등 정보를 담고있는 Card
    - AnimalType이라는 Enum 에 따라 1~12 의 숫자를 가진 카드를 생성해주는 CardFactory
    - CardFactory에서 만들어진 카드들을 '보관' 및 '섞기'를 맡은 Deck
- AnimalType, CardNumberType Enum에서 CaseIterable을 채택하여 CardFactory에서 AnimalType과 CardNumberType의 모든 케이스를 불러와서 카드를 만들어주었습니다.

## 고민 내용
- Card가 가질 수 있는 변수로는 동물, 숫자, 앞뒤 유무, 뒷면일 경우 이미지 라고 분석하였습니다. 
- 뒤의 과제를 모르는 상태에서 Card를 설계한다면 Card 클래스에서 프로토콜로 역할을 확장해나가야하는 것이 좋은지 아니면 필요할 때마다 역할이 확장되는 것에 따라 Card 클래스를 변경해주는 것이 좋은지 판단이 서지않습니다.