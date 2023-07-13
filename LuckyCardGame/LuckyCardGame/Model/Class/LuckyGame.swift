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
}

class DefaultLuckyGame: LuckyGame {
    private var divider: Divider
    private var players: [Player]
    private var ground: Board
    private var currentGamePlayer: Int
    
    init() {
        
        let cardFactory = DefaultLuckyCardFactory()
        cardFactory.createDeck()
        divider = DefaultDivider(deck: cardFactory.returnDeck())
        
        var boardNameTypeAllCases = BoardNameType.allCases
        ground = DefaultBoard(name: boardNameTypeAllCases.removeLast().name)
        players = boardNameTypeAllCases.map { DefaultPlayer(board: DefaultBoard(name: $0.name)) }
        
        currentGamePlayer = 0
    }
    
    init(divider: Divider,
         players: [Player],
         ground: Board) {
        self.divider = divider
        self.players = players
        self.ground = ground
        self.currentGamePlayer = 0
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
}
