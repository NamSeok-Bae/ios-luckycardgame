//
//  AnimalType.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/05.
//

import Foundation

/*
 동물의 종류에 따라 emoji를 반환해주고싶어 enum에 String rawvalue를 적용하였습니다.
 그리고 CardFactory에서 동물의 종류에 따라 1~12 의 숫자를 가진 모든 카드를 생성해주기위해서
 CaseIterable을 통해 모든 종류를 불러올 수 있게 하였습니다.
 */
enum AnimalType: String, CaseIterable {
    case dog = "🐶", cat = "🐱", cow = "🐮"
}
