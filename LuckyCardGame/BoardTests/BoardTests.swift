//
//  BoardTests.swift
//  BoardTests
//
//  Created by 배남석 on 2023/07/12.
//

import XCTest
@testable import 럭키카드

final class BoardTests: XCTestCase {
    
    func test_보드_초기화() {
        var board = DefaultBoard()
        
        XCTAssertEqual(board.getDeck(), [], "Player의 초기화 결과가 결과값과 다름.")
        XCTAssertEqual(board.getName(), "Nil", "Player의 초기화 결과가 결과값과 다름.")
        
        board = DefaultBoard(deck: [DefaultLuckyCard(.dog, .one)])
        XCTAssertEqual(board.getDeck(), [DefaultLuckyCard(.dog, .one)], "Player의 초기화 결과가 결과값과 다름.")
        XCTAssertEqual(board.getName(), "Nil", "Player의 초기화 결과가 결과값과 다름.")
        
        board = DefaultBoard(name: "A")
        XCTAssertEqual(board.getDeck(), [], "Player의 초기화 결과가 결과값과 다름.")
        XCTAssertEqual(board.getName(), "A", "Player의 초기화 결과가 결과값과 다름.")
        
        board = DefaultBoard(deck: [DefaultLuckyCard(.dog, .one)], name: "A")
        XCTAssertEqual(board.getDeck(), [DefaultLuckyCard(.dog, .one)], "Player의 초기화 결과가 결과값과 다름.")
        XCTAssertEqual(board.getName(), "A", "Player의 초기화 결과가 결과값과 다름.")
    }
    
    func test_보드의_덱_설정하기() {
        var board = DefaultBoard()
        
        board.setDeck([DefaultLuckyCard(.dog, .one)])
        XCTAssertEqual(board.getDeck(), [DefaultLuckyCard(.dog, .one)], "Player의 초기화 결과가 결과값과 다름.")
    }
    
    func test_보드의_덱에서_카드_뽑기() {
        var board = DefaultBoard()
        let ascendingSortedDeck = [DefaultLuckyCard(.dog, .one),
                                   DefaultLuckyCard(.cat, .eight)]
        board.setDeck(ascendingSortedDeck)
        
        XCTAssertEqual(board.flippedCard(1), DefaultLuckyCard(.cat, .eight), "Board의 카드 뽑기 함수가 결과값과 다름.")
        XCTAssertEqual(board.flippedCard(0), DefaultLuckyCard(.dog, .one), "Board의 카드 뽑기 함수가 결과값과 다름.")
        XCTAssertTrue(board.getDeck().isEmpty, "Board의 카드 뽑기 함수에서 Card Remove가 결과값과 다름.")
        
        board.setDeck(ascendingSortedDeck)
        XCTAssertEqual(board.flippedCard(0), DefaultLuckyCard(.dog, .one), "Board의 카드 뽑기 함수가 결과값과 다름.")
        XCTAssertEqual(board.flippedCard(0), DefaultLuckyCard(.cat, .eight), "Board의 카드 뽑기 함수가 결과값과 다름.")
        XCTAssertTrue(board.getDeck().isEmpty, "Board의 카드 뽑기 함수에서 Card Remove가 결과값과 다름.")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
