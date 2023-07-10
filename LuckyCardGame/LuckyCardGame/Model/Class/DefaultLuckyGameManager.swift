//
//  LuckyGameManager.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/06.
//

import Foundation

private protocol LuckyGameManager {
    static var shared: Self { get }
    var divider: DefaultDivider { get set }
    var players: [Board] { get set }
    var ground: Board { get set }
    var currentGamePlayerCount: Int { get set }
}

final class DefaultLuckyGameManager: LuckyGameManager {
    static let shared = DefaultLuckyGameManager()
    fileprivate var divider: DefaultDivider
    fileprivate var players: [Board]
    fileprivate var ground: Board
    fileprivate var currentGamePlayerCount: Int
    
    init() {
        currentGamePlayerCount = 0
        players = BoardNameType.allCases.dropLast(1).map { Board(name: $0.name) }
        ground = Board(name: BoardNameType.ground.name)
        
        let cardFactory = DefaultCardFactory()
        cardFactory.createDeck()
        divider = DefaultDivider(deck: cardFactory.returnDeck())
    }
    
    fileprivate func initPlayerAndGroundDeck(_ playerCount: Int) {
        for i in 0..<playerCount {
            players[i].deck = []
        }
        ground.deck = []
    }
    
    func divideCardToPlayers(_ playerCount: Int)
    {
        currentGamePlayerCount = playerCount
        initPlayerAndGroundDeck(playerCount)
        divider.divideToPlyers(playerCount).enumerated().forEach { (idx, deck) in
            if idx == playerCount {
                ground.deck = deck
            } else {
                players[idx].deck = deck
            }
        }
    }
    
    func fetchPlayers(_ playerCount: Int) -> [Board] {
        return Array(players.prefix(playerCount))
    }
    
    func fetchGround() -> Board {
        return ground
    }
    
    func printDescription() {
        for i in 0...currentGamePlayerCount {
            if i != currentGamePlayerCount {
                print(players[i].deck)
            } else {
                print(ground.deck)
            }
        }
    }
}
