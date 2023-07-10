//
//  Player.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/06.
//

import Foundation

private protocol BoardInfomation {
    var deck: [Card] { get set }
    var name: String { get set }
    
    mutating func takeDeck(_ deck: [Card])
}

extension BoardInfomation {
    mutating func takeDeck(_ deck: [Card]) {
        self.deck = deck
    }
}

struct Board: BoardInfomation {
    var deck: [Card]
    var name: String
    
    init(name: String) {
        self.name = name
        self.deck = []
    }
    
    init(deck: [Card], name: String) {
        self.deck = deck
        self.name = name
    }
    
    mutating func takeDeck(_ deck: [Card]) {
        self.deck = deck
    }
}
