//
//  Player.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/11.
//

import Foundation

protocol Player: AnyObject {
    func setBoard(_ board: Board)
    func getBoard() -> Board
    func setDeck(_ deck: [DefaultLuckyCard])
    func sortDeck()
    func appedMatchedCards(_ flippedCards: [DefaultLuckyCard])
    func flippedCard(_ flippedCardType: FlippedCardType) -> DefaultLuckyCard
    func deFlippedCard(_ flippedCards: [DefaultLuckyCard])
}

class DefaultPlayer: Player {
    private var board: Board
    private var matchedCards: [[DefaultLuckyCard]]
    
    init() {
        board = DefaultBoard()
        matchedCards = []
    }
    
    init(board: Board) {
        self.board = board
        matchedCards = []
    }
    
    func setBoard(_ board: Board) {
        self.board = board
    }
    
    func getBoard() -> Board {
        return board
    }
    
    func setDeck(_ deck: [DefaultLuckyCard]) {
        self.board.setDeck(deck)
    }
    
    func sortDeck() {
        board.sortDeck()
    }
    
    func appedMatchedCards(_ flippedCards: [DefaultLuckyCard]) {
        self.matchedCards.append(flippedCards)
    }
    
    func flippedCard(_ flippedCardType: FlippedCardType) -> DefaultLuckyCard {
        board.flippedCard(flippedCardType == .maxNumber ? board.getDeck().count - 1 : 0)
    }
    
    func deFlippedCard(_ flippedCards: [DefaultLuckyCard]) {
        board.deFlippedCard(flippedCards)
    }
}
