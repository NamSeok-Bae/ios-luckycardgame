//
//  CardFactory.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/05.
//

import Foundation

protocol LuckyCardFactory: AnyObject {
    func createDeck()
    func returnDeck() -> [DefaultLuckyCard]
    func getDeck() -> [DefaultLuckyCard]
}

class DefaultLuckyCardFactory: LuckyCardFactory {
    private var deck: [DefaultLuckyCard]
    
    init() {
        deck = []
    }
    
    func createDeck() {
        for i in AnimalType.allCases {
            for j in CardNumberType.allCases {
                let newCard = DefaultLuckyCard(i, j)
                deck.append(newCard)
            }
        }
    }
    
    func returnDeck() -> [DefaultLuckyCard] {
        return deck
    }
    
    func getDeck() -> [DefaultLuckyCard] {
        return deck
    }
}
