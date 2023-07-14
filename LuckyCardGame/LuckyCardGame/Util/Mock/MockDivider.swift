//
//  MockDivider.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/12.
//

import Foundation

class MockDivider: Divider {
    var deck: [DefaultLuckyCard]
    var deckCount: Int
    
    init() {
        deck = []
        deckCount = 0
    }
    
    init(deck: [DefaultLuckyCard]) {
        self.deck = deck
        self.deckCount = deck.count
    }
    
    func setDeck(_ deck: [DefaultLuckyCard]) {
        self.deck = deck
        self.deckCount = deck.count
    }
    
    func getDeck() -> [DefaultLuckyCard] {
        return deck
    }
    
    func getDeckCount() -> Int {
        return deckCount
    }
    
    func divideToPlayers(_ playerCount: Int) -> [[DefaultLuckyCard]] {
        return [
            [DefaultLuckyCard(.dog, .eleven), DefaultLuckyCard(.dog, .two), DefaultLuckyCard(.cat, .eight), DefaultLuckyCard(.cat, .eleven), DefaultLuckyCard(.cat, .two), DefaultLuckyCard(.cow, .eight), DefaultLuckyCard(.dog, .eight), DefaultLuckyCard(.cat, .seven)],
            [DefaultLuckyCard(.cat, .three), DefaultLuckyCard(.dog, .nine), DefaultLuckyCard(.dog, .four), DefaultLuckyCard(.cat, .six), DefaultLuckyCard(.dog, .three), DefaultLuckyCard(.cow, .five), DefaultLuckyCard(.cow, .six)],
            [DefaultLuckyCard(.cat, .one), DefaultLuckyCard(.cat, .two), DefaultLuckyCard(.cow, .four), DefaultLuckyCard(.dog, .five), DefaultLuckyCard(.dog, .six), DefaultLuckyCard(.dog, .ten), DefaultLuckyCard(.cow, .five), DefaultLuckyCard(.cow, .six)],
            [DefaultLuckyCard(.cow, .ten), DefaultLuckyCard(.cow, .seven), DefaultLuckyCard(.cat, .ten), DefaultLuckyCard(.cat, .four), DefaultLuckyCard(.cow, .eleven), DefaultLuckyCard(.cat, .nine), DefaultLuckyCard(.cat, .five), DefaultLuckyCard(.dog, .seven), DefaultLuckyCard(.dog, .one)]
        ]
    }
}
