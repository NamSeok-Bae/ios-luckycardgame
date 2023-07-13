//
//  Deck.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/05.
//

import Foundation

protocol Divider: AnyObject {
    func divideToPlayers(_ playerCount: Int) -> [[DefaultLuckyCard]]
    func setDeck(_ deck: [DefaultLuckyCard])
    func getDeck() -> [DefaultLuckyCard]
    func getDeckCount() -> Int
}

class DefaultDivider: Divider {
    private var deck: [DefaultLuckyCard]
    private var deckCount: Int
    
    init() {
        self.deck = []
        self.deckCount = 0
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
    
    private func shuffleDeck() {
        self.deck.shuffle()
    }
    
    // 덱을 섞은 후 사람 수에 따라 카드 분배 순서를 계산해 반환해줍니다.
    func divideToPlayers(_ playerCount: Int) -> [[DefaultLuckyCard]] {
        shuffleDeck()
        if playerCount == 3 {
            return divideThreePlayer(playerCount)
        } else {
            return divideMultiplePlayers(playerCount)
        }
    }
    
    private func divideThreePlayer(_ playerCount: Int) -> [[DefaultLuckyCard]] {
        var dividedCardToPlayers: [[DefaultLuckyCard]] = Array(repeating: [DefaultLuckyCard](), count: playerCount + 1)
        var curIndex = 0
        let excludeCardNumber = 12
        
        let filterDeck = deck.filter { $0.getNumber() != excludeCardNumber }
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
    
    private func divideMultiplePlayers(_ playerCount: Int) -> [[DefaultLuckyCard]] {
        var dividedCardToPlayers: [[DefaultLuckyCard]] = Array(repeating: [DefaultLuckyCard](), count: playerCount + 1)
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
}
