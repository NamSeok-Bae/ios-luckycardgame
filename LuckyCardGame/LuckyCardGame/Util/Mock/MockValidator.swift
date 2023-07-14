//
//  MockValidator.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/13.
//

import Foundation

class MockValidator: Validator {
    func validateThreeSameCardInDeck(_ playerDeck: [LuckyCard]) -> Bool {
        return false
    }
    
    func validateCurrentFlippedCards(_ cards: [LuckyCard]) -> Bool {
        return true
    }
}
