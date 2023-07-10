//
//  Card.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/05.
//

import UIKit

/*
 Card에서 앞뒤유무에 따라 화면에 나타내는 정보가 다르다고 생각했습니다.
 그렇기때문에 앞면과 뒷면을 따라 나타내주는 역할이 다르다고 생각을 했고 이를 Protocol로 분리해주어 채택하도록 하였습니다.
 
 --- 추가 내용
 Card에서 모든 정보를 담고있는 객체라고 생각했지만, 이미지는 카드'뷰'의 뒷면에 쓰일 이미지라는 부분을 인지하였고,
 Card Class는 앞면에서 표현될 데이터를 보관하는 클래스라고 생각하여 로직을 수정합니다.
 */
private protocol CardInformation {
    var animal: String { get set }
    var number: Int { get set }
    
    func setInformation(_ animalType: AnimalType, _ cardNumberType: CardNumberType)
}

extension CardInformation {
    mutating func setInformation(_ animalType: AnimalType, _ cardNumberType: CardNumberType) {
        self.animal = animalType.rawValue
        self.number = cardNumberType.rawValue
    }
}

final class Card: CardInformation, CustomStringConvertible {
    var animal: String
    var number: Int
    var description: String {
            return "\(animal)\(String(format: "%02d", number))"
    }
    
    init() {
        animal = ""
        number = 0
    }
    
    init(animal: String, number: Int) {
        self.animal = animal
        self.number = number
    }
    
    convenience init(_ animalType: AnimalType, _ cardNumberType: CardNumberType) {
        self.init()
        setInformation(animalType, cardNumberType)
    }
    
    func setInformation(_ animalType: AnimalType, _ cardNumberType: CardNumberType) {
        self.animal = animalType.rawValue
        self.number = cardNumberType.rawValue
    }
}
