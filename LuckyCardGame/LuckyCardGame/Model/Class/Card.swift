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
 */
protocol CardFrontable {
    var animal: String { get set }
    var number: Int { get set }
    
    func setInformation(_ animalType: AnimalType, _ cardNumberType: CardNumberType)
}

extension CardFrontable {
    mutating func setInformation(_ animalType: AnimalType, _ cardNumberType: CardNumberType) {
        self.animal = animalType.rawValue
        self.number = cardNumberType.rawValue
    }
}

protocol CardBackable {
    var image: UIImage? { get set }
    
    func setInformation()
}

extension CardBackable {
    mutating func setInformation() {
        self.image = UIImage(systemName: "house") ?? UIImage()
    }
}

final class Card: CardFrontable, CardBackable, CustomStringConvertible {
    var animal: String = ""
    var number: Int = 0
    var image: UIImage? = nil
    var description: String {
        if let image {
            return "\(image)"
        } else {
            return "\(animal)\(String(format: "%02d", number))"
        }
    }
    
    func setInformation(_ animalType: AnimalType, _ cardNumberType: CardNumberType) {
        self.animal = animalType.rawValue
        self.number = cardNumberType.rawValue
    }
    
    func setInformation() {
        self.image = UIImage(systemName: "house") ?? UIImage()
    }
}
