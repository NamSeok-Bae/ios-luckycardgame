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
}

struct DefaultBoard: Board {
    private var deck: [DefaultLuckyCard]
    private var name: String
    
    init() {
        self.deck = [DefaultLuckyCard]()
        self.name = "Nil"
    }
    
    init(name: String) {
        self.name = name
        self.deck = [DefaultLuckyCard]()
    }
    
    init(deck: [DefaultLuckyCard], name: String) {
        self.deck = deck
        self.name = name
    }
    
    init(deck: [DefaultLuckyCard]) {
        self.deck = deck
        self.name = "Nil"
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
}
