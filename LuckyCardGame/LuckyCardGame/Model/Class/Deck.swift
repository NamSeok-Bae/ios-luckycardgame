//
//  Deck.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/05.
//

import Foundation

protocol Deck {
    func printShuffeldDeck()
    func divideCard()
}

final class DefaultDeck: Deck {
    var deck: [Card]
    
    init(deck: [Card]) {
        self.deck = deck
    }
    
    func printShuffeldDeck() {
        let shuffledDeck = deck.shuffled()
        for (index, i) in shuffledDeck.enumerated() {
            if index == shuffledDeck.count - 1 {
                print(i.description)
            } else {
                print(i.description, terminator: ", ")
            }
        }
    }
    
    func divideCard() {
        
    }
}
