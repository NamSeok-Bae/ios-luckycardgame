//
//  Card.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/05.
//

import UIKit

protocol LuckyCard: AnyObject, CustomStringConvertible {
    func setInformation(_ animalType: AnimalType, _ cardNumberType: CardNumberType)
    func getNumber() -> Int
    func getAnimal() -> String
}

class DefaultLuckyCard: LuckyCard, Hashable {
    private var animal: String
    private var number: Int
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
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(animal)
            hasher.combine(number)
        }
    
    static func == (lhs: DefaultLuckyCard, rhs: DefaultLuckyCard) -> Bool {
        return lhs.description == rhs.description
    }
    
    func setInformation(_ animalType: AnimalType, _ cardNumberType: CardNumberType) {
        self.animal = animalType.rawValue
        self.number = cardNumberType.rawValue
    }
    
    func getNumber() -> Int {
        return number
    }
    
    func getAnimal() -> String {
        return animal
    }
}
