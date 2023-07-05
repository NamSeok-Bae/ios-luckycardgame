//
//  CardNumberType.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/05.
//

import Foundation

/*
 현재까진 1~12까지 있지만 추가적으로 카드 숫자가 더 늘어날 수 있다고 가정하여 Enum과 RawValue 를 사용하였습니다.
 그리고 CardFactory에서 숫자의 모든 경우를 불러오기위해 CaseIterable을 채택하였습니다.
 */
enum CardNumberType: Int, CaseIterable {
    case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve
}
