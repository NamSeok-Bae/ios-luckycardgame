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
}

class DefaultPlayer: Player {
    private var board: Board
    
    init() {
        board = DefaultBoard()
    }
    
    init(board: Board) {
        self.board = board
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
}
