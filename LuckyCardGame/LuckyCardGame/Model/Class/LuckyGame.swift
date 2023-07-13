//
//  LuckyGame.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/12.
//

import Foundation

protocol LuckyGame: AnyObject {
    func getPlayer(_ playerIndex: Int) -> Player
    func getGround() -> Board
    func initGame(_ playerCount: Int)
    func initPlayersAndGroundDeck()
    func sortPlayerDeck(_ playerIndex: Int)
    func sortGroundDeck()
    func divideCard(_ playerCount: Int)
    func requestFlippedCard(_ requestPlayerIndex: Int,
                            _ targetType: BoardNameType,
                            cardIndex: Int?,
                            flippedCardType: FlippedCardType?) -> DefaultLuckyCard
    func validatePlayerHaveThreeSameCard() -> [Bool]
    func validateCurrentFlippedCards(_ requestPlayerIndex: Int) -> Bool
    func turnOver()
}

class DefaultLuckyGame: LuckyGame {
    private var divider: Divider
    private var players: [Player]
    private var ground: Board
    private var validator: Validator
    private var currentGamePlayer: Int
    private var currentFlippedCard: [DefaultLuckyCard]
    
    init() {
        validator = DefaultValidator()
        
        let cardFactory = DefaultLuckyCardFactory()
        cardFactory.createDeck()
        divider = DefaultDivider(deck: cardFactory.returnDeck())
        
        var boardNameTypeAllCases = BoardNameType.allCases
        ground = DefaultBoard(name: boardNameTypeAllCases.removeLast().name)
        players = boardNameTypeAllCases.map { DefaultPlayer(board: DefaultBoard(name: $0.name)) }
        
        currentGamePlayer = 0
        currentFlippedCard = []
    }
    
    init(divider: Divider,
         players: [Player],
         ground: Board,
         validator: Validator) {
        self.divider = divider
        self.players = players
        self.ground = ground
        self.validator = validator
        self.currentGamePlayer = 0
        self.currentFlippedCard = []
    }
    
    func getPlayer(_ playerIndex: Int) -> Player {
        return players[playerIndex]
    }
    
    func getGround() -> Board {
        return ground
    }
    
    func initGame(_ playerCount: Int) {
        currentGamePlayer = playerCount
        initPlayersAndGroundDeck()
        divideCard(playerCount)
    }
    
    func initPlayersAndGroundDeck() {
        for i in players {
            i.setDeck([])
        }
        ground.setDeck([])
    }
    
    // Divider에게 사람 수에 따른 카드 배분 순서를 받고, 순서대로 Player와 Board에 할당
    func divideCard(_ playerCount: Int) {
        divider.divideToPlayers(playerCount).enumerated().forEach { (idx, deck) in
            if idx == playerCount {
                ground.setDeck(deck)
            } else {
                players[idx].setDeck(deck)
            }
        }
    }
    
    func sortPlayerDeck(_ playerIndex: Int) {
        players[playerIndex].sortDeck()
    }
    
    func sortGroundDeck() {
        ground.sortDeck()
    }
    
    // 현재 차례 플레이어가 특정 플레이어 또는 바닥에 있는 카드를 요청합니다.
    func requestFlippedCard(_ requestPlayerIndex: Int,
                            _ targetType: BoardNameType,
                            cardIndex: Int? = nil,
                            flippedCardType: FlippedCardType? = nil) -> DefaultLuckyCard {
        var flippedCard = DefaultLuckyCard()

        if let cardIndex, targetType.rawValue == 5 {
            flippedCard = ground.flippedCard(cardIndex)
        } else if (targetType.rawValue >= 0 && targetType.rawValue < 5), let flippedCardType {
            flippedCard = players[targetType.rawValue].flippedCard(flippedCardType)
        }

        currentFlippedCard.append(flippedCard)
        return flippedCard
    }
    
    // Player에게 카드가 분배되고 각 Player의 Deck에서 같은 숫자 카드가 3장 있는지 검증
    func validatePlayerHaveThreeSameCard() -> [Bool] {
        return players.map { validator.validateThreeSameCardInDeck($0.getBoard().getDeck()) }
    }
    
    // 현재 차례 플레이어가 뽑은 카드들이 각각 숫자가 같은지 검증합니다.
    func validateCurrentFlippedCards(_ requestPlayerIndex: Int) -> Bool {
        if validator.validateCurrentFlippedCards(currentFlippedCard) {
            if currentFlippedCard.count == 3 {
                players[requestPlayerIndex].appedMatchedCards(currentFlippedCard)
                currentFlippedCard = []
                return true
            }
            return false
        } else {
            return false
        }
    }
    
    func turnOver() {
        if !currentFlippedCard.isEmpty {
            for player in players {
                player.deFlippedCard(currentFlippedCard)
            }
        }
    }
}
