//
//  Player.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/06.
//

import Foundation

protocol Board {
    func getDeck() -> [DefaultLuckyCard]
    func getName() -> String
    mutating func setDeck(_ deck: [DefaultLuckyCard])
    mutating func sortDeck()
    mutating func flippedCard(_ cardIndex: Int) -> DefaultLuckyCard
    mutating func deFlippedCard(_ flippedCards: [DefaultLuckyCard])
}

struct DefaultBoard: Board {
    private var deck: [DefaultLuckyCard]
    private var name: String
    private var currentFlippedCard: [DefaultLuckyCard]
    
    init() {
        self.deck = [DefaultLuckyCard]()
        self.name = "Nil"
        currentFlippedCard = []
    }
    
    init(name: String) {
        self.name = name
        self.deck = [DefaultLuckyCard]()
        currentFlippedCard = []
    }
    
    init(deck: [DefaultLuckyCard], name: String) {
        self.deck = deck
        self.name = name
        currentFlippedCard = []
    }
    
    init(deck: [DefaultLuckyCard]) {
        self.deck = deck
        self.name = "Nil"
        currentFlippedCard = []
    }
    
    func getDeck() -> [DefaultLuckyCard] {
        return deck
    }
    
    func getName() -> String {
        return name
    }
    
    mutating func setDeck(_ deck: [DefaultLuckyCard]) {
        self.deck = deck
    }
    
    mutating func sortDeck() {
        deck.sort {
            $0.getNumber() < $1.getNumber()
        }
    }
    
    mutating func flippedCard(_ cardIndex: Int) -> DefaultLuckyCard {
        let flippedCard = deck.remove(at: cardIndex)
        currentFlippedCard.append(flippedCard)
        return flippedCard
    }
    
    mutating func deFlippedCard(_ flippedCards: [DefaultLuckyCard]) {
        flippedCards.filter { currentFlippedCard.contains($0) }.forEach {
            deck.append($0)
        }
        sortDeck()
    }
}
