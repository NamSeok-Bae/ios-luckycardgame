//
//  MockGround.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/13.
//

import Foundation

class MockGround: Board {
    
    var deck: [DefaultLuckyCard]
    var name: String
    var currentFlippedCard: [DefaultLuckyCard]
    
    init(deck: [DefaultLuckyCard]) {
        self.deck = deck
        self.name = "바닥"
        currentFlippedCard = []
    }
    
    init() {
        deck = []
        name = "바닥"
        currentFlippedCard = []
    }
    
    func setDeck(_ deck: [DefaultLuckyCard]) {
        self.deck = deck
    }
    
    func sortDeck() {
        deck.sort {
            $0.getNumber() < $1.getNumber()
        }
    }
    
    func getDeck() -> [DefaultLuckyCard] {
        return deck
    }
    
    func getName() -> String {
        return name
    }
    
    func flippedCard(_ cardIndex: Int) -> DefaultLuckyCard {
        let flippedCard = deck.remove(at: cardIndex)
        currentFlippedCard.append(flippedCard)
        return flippedCard
    }
    
    func deFlippedCard(_ flippedCards: [DefaultLuckyCard]) {
        flippedCards.filter { currentFlippedCard.contains($0) }.forEach {
            deck.append($0)
        }
        sortDeck()
    }
}
