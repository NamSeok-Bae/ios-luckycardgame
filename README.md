# 게임로직 구현하기 (완료시간 7/14(일) 18:00)

## 학습내용
- Protocol Equatable, Hashable
- 의존성
- 함수의 매개변수 간략화
- some vs any
- Test Code
- Mock & Stub
- 테스트 코드의 방향
- AnyObject
- Class와 Struct에서 Protocol 채택할 때의 차이
- Protocol의 접근제어 지시자

## 작업 결과물
<p align="center">
<img width="50%" alt="image" src="https://github.com/softeerbootcamp-2nd/ios-luckycardgame/assets/76683388/c0d6c93d-6e7f-4b28-9d5b-e110f086b20b">

</p>

## 작업 상세내용
- LuckyGameManager를 LuckyGame으로 변경
- LuckyCard, LuckyCardFactory, Divider, Player, Validator 리팩토링
    - 사용할 때 객체를 타입으로 받아서 선언해주었는데, 프로토콜을 타입으로 지정해주는 식으로 변경
    - Protocol 내부에 정의한 변수를 모두 빼고, 객체 안에서 정의 및 접근 제어 지시자 추가
- LuckyCard, LuckyCardFactory, Divider, Player, Validator, LuckyGame에 관하여 테스트 진행

## LuckyGame 기능
- 게임 초기화
- 카드 나눠주기
- 플레이어 및 바닥 덱 정렬
- 플레이어가 카드 뽑는거 관리
- Validator를 활용한 규칙 검증

## 고민내용
- 클래스 내부 변수에 private로 접근 제어를 하고 외부에서의 접근을 함수로 관리하고 있습니다. 프로토콜에서도 관련 함수들을 한눈에 볼 수 있어 좋다고 생각하지만, private(set)으로 접근제어를 해준다면 내부 변수에 접근하는 함수를 줄일 수 있지 않을까? 라는 생각을 하고 있습니다. 두 방법을 어떻게 구분하면 좋을지 모르겠습니다.