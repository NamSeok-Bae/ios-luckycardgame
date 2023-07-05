//
//  Deck.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/05.
//

import Foundation

/*
 Deck은 카드 보관 뿐만 아니라 섞이고, 출력하는 기능을 담당합니다.
 */
private protocol Deck {
    var deck: [Card] { get set }
    
    func shuffle()
    func printDeck()
}

final class DefaultDeck: Deck {
    fileprivate var deck: [Card]
    
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
