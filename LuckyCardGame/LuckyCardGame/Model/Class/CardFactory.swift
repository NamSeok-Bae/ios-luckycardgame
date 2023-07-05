//
//  CardFactory.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/05.
//

import Foundation

/*
 CardFactory는 Card를 생성하고 모든 카드들이 모여 Deck을 완성했을 때 반환해주는 역할을 담당합니다.
 */
private protocol CardFactory {
    var deck: [Card] { get }
    
    func createCard()
    func returnDeck() -> [Card]
}

final class DefaultCardFactory: CardFactory {
    fileprivate var deck: [Card] = []
    
    func createCard() {
        for i in AnimalType.allCases {
            for j in CardNumberType.allCases {
                let newCard = Card(animalType: i, cardNumberType: j)
                deck.append(newCard)
            }
        }
    }
    
    func returnDeck() -> [Card] {
        return deck
    }
}
