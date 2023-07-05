//
//  Card.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/05.
//

import UIKit

protocol CardInfomation {
    var animal: String { get }
    var number: Int { get }
    var back: Bool { get }
}

final class Card: CardInfomation, CustomStringConvertible {
    var animal: String
    var number: Int
    var back: Bool = false
    var image: UIImage? = nil
    var description: String {
        return "\(animal)\(String(format: "%02d", number))"
    }
    
    init(animalType: AnimalType, number: Int) {
        self.animal = animalType.rawValue
        self.number = number
    }
    
    init(animal: String, number: Int) {
        self.animal = animal
        self.number = number
    }
}
