//
//  Deck.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/05.
//

import Foundation

protocol Deck {
    var deck: [Card] { get set }
    
    func shuffle()
    func printDeck()
}

final class DefaultDeck: Deck {
    var deck: [Card]
    
    init(deck: [Card]) {
        self.deck = deck
    }
    
    func shuffle() {
        self.deck.shuffle()
    }
    
    func printDeck() {
        for (index, i) in deck.enumerated() {
            if index == deck.count - 1 {
                print(i.description)
            } else {
                print(i.description, terminator: ", ")
            }
        }
    }
}
