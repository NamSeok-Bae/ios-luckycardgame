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
private protocol Divider {
    var deck: [Card] { get set }
    
    func deckShuffle()
    func divideToPlyers(_ playerCount: Int) -> [[Card]]
    func printDeck()
    func setDeck(_ deck: [Card])
}

final class DefaultDivider: Divider {
    fileprivate var deck: [Card]
    private var deckCount: Int
    
    init() {
        self.deck = []
        self.deckCount = 0
    }
    
    init(deck: [Card]) {
        self.deck = deck
        self.deckCount = deck.count
    }
    
    fileprivate func deckShuffle() {
        self.deck.shuffle()
    }
    
    func divideToPlyers(_ playerCount: Int) -> [[Card]] {
        deckShuffle()
        if playerCount == 3 {
            return divideThreePlayer(playerCount)
        } else {
            return divideMultiplePlayers(playerCount)
        }
    }
    
    private func divideThreePlayer(_ playerCount: Int) -> [[Card]] {
        var dividedCardToPlayers: [[Card]] = Array(repeating: [Card](), count: playerCount + 1)
        var curIndex = 0
        let excludeCardNumber = 12
        
        let filterDeck = deck.filter { $0.number != excludeCardNumber }
        let filterDeckCount = filterDeck.count
        
        filterDeck.enumerated().forEach { (idx, card) in
            if idx < (filterDeckCount / (playerCount + 1)) * playerCount {
                dividedCardToPlayers[curIndex].append(card)
                curIndex = (curIndex + 1) % playerCount
            } else {
                dividedCardToPlayers[playerCount].append(card)
            }
        }
        
        return dividedCardToPlayers
    }
    
    private func divideMultiplePlayers(_ playerCount: Int) -> [[Card]] {
        var dividedCardToPlayers: [[Card]] = Array(repeating: [Card](), count: playerCount + 1)
        var curIndex = 0
        for (idx, i) in deck.enumerated() {
            if idx < (deckCount / (playerCount + 1)) * playerCount {
                dividedCardToPlayers[curIndex].append(i)
                curIndex = (curIndex + 1) % playerCount
            } else {
                dividedCardToPlayers[playerCount].append(i)
            }
        }
        
        return dividedCardToPlayers
    }
    
    func setDeck(_ deck: [Card]) {
        self.deck = deck
        self.deckCount = deck.count
    }
    
    func printDeck() {
        print(deck.map { $0.description }.joined(separator: ", "))
    }
}
