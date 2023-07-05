//
//  CardFactory.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/05.
//

import Foundation

protocol CardFactory {
    var deck: [Card] { get }
    
    func createCard()
    func returnDeck() -> [Card]
}

final class DefaultCardFactory: CardFactory {
    var deck: [Card] = []
    
    func createCard() {
        for i in AnimalType.allCases {
            for j in 1...12 {
                let newCard = Card(animalType: i, number: j)
                deck.append(newCard)
            }
        }
    }
    
    func returnDeck() -> [Card] {
        return deck
    }
}
