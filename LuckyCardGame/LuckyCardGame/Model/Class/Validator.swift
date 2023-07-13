//
//  Validator.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/12.
//

import Foundation

protocol Validator {
    func validateThreeSameCardInDeck(_ playerDeck: [LuckyCard]) -> Bool
    func validateCurrentFlippedCards(_ cards: [LuckyCard]) -> Bool
}

class DefaultValidator: Validator {
    func validateThreeSameCardInDeck(_ playerDeck: [LuckyCard]) -> Bool {
        let playerDeckNumberArray = playerDeck.map { $0.getNumber() }
        let playerDeckSet = Set(playerDeckNumberArray)
        let countedArray = NSCountedSet(array: playerDeckNumberArray)
        
        for i in playerDeckSet {
            if countedArray.count(for: i) == 3 {
                return true
            }
        }
        
        return false
    }
    
    func validateCurrentFlippedCards(_ cards: [LuckyCard]) -> Bool {
        var currentNumber = -1
        for i in cards {
            if currentNumber == -1 {
                currentNumber = i.getNumber()
            } else if currentNumber != i.getNumber() {
                return false
            }
        }
        
        return currentNumber == -1 ? false : true
    }
}
