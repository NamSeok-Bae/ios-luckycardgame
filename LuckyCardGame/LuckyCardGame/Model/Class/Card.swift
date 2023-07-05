//
//  Card.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/05.
//

import UIKit

/*
 Card에선 기본적으로 animal emoji, number, 앞뒤유무, 뒷면일 경우 이미지가 필요하다고 생각했고,
 이러한 정보를 담는 객체 역할을 합니다.
 */
private protocol CardInfomation {
    var animal: String { get }
    var number: Int { get }
    var back: Bool { get }
}

final class Card: CardInfomation, CustomStringConvertible {
    fileprivate var animal: String
    fileprivate var number: Int
    fileprivate var back: Bool = false
    private var image: UIImage? = nil
    var description: String {
        return "\(animal)\(String(format: "%02d", number))"
    }
    
    init(animalType: AnimalType, cardNumberType: CardNumberType) {
        self.animal = animalType.rawValue
        self.number = cardNumberType.rawValue
    }
    
    init(animal: String, number: Int) {
        self.animal = animal
        self.number = number
    }
}
