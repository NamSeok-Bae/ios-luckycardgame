//
//  LuckyGameTests.swift
//  LuckyGameTests
//
//  Created by 배남석 on 2023/07/13.
//

import XCTest
@testable import 럭키카드

final class LuckyGameTests: XCTestCase {
    var luckyGame: LuckyGame!

    override func setUpWithError() throws {
        let mockDivider = MockDivider()
        let mockValidator = MockValidator()
        let mockGround = MockGround()
        luckyGame = DefaultLuckyGame(divider: mockDivider,
                                     players: [DefaultPlayer(board: DefaultBoard(name: "A")),
                                               DefaultPlayer(board: DefaultBoard(name: "B")),
                                               DefaultPlayer(board: DefaultBoard(name: "C"))],
                                     ground: mockGround,
                                     validator: mockValidator)
    }

    override func tearDownWithError() throws {
        luckyGame = nil
    }
    
    func test_럭키게임_특정_플레이어_덱_정렬하기() {
        luckyGame.divideCard(3)
        luckyGame.sortPlayerDeck(0)
        XCTAssertEqual(luckyGame.getPlayer(0).getBoard().getDeck(),
                       [DefaultLuckyCard(.dog, .two), DefaultLuckyCard(.cat, .two), DefaultLuckyCard(.cat, .seven), DefaultLuckyCard(.cat, .eight), DefaultLuckyCard(.cow, .eight), DefaultLuckyCard(.dog, .eight), DefaultLuckyCard(.dog, .eleven),  DefaultLuckyCard(.cat, .eleven)],
                       "LuckyGame의 특정 플레이어 덱 정렬하기가 결과값이 다름.")
        
        luckyGame.sortGroundDeck()
        XCTAssertEqual(luckyGame.getGround().getDeck(),
                       [DefaultLuckyCard(.dog, .one), DefaultLuckyCard(.cat, .four), DefaultLuckyCard(.cat, .five), DefaultLuckyCard(.cow, .seven), DefaultLuckyCard(.dog, .seven), DefaultLuckyCard(.cat, .nine), DefaultLuckyCard(.cow, .ten), DefaultLuckyCard(.cat, .ten), DefaultLuckyCard(.cow, .eleven)],
                       "LuckyGame의 그라운드 덱 정렬하기가 결과값이 다름.")
    }
    
    func test_플레이어가_뽑은_카드들_검증하기() {
        let currentPlayer = 0
        luckyGame.divideCard(3)
        luckyGame.sortPlayerDeck(currentPlayer)
        let firstCard = luckyGame.requestFlippedCard(currentPlayer,
                                                     .first,
                                                     cardIndex: nil,
                                                     flippedCardType: .maxNumber)
        XCTAssertEqual(firstCard,
                       DefaultLuckyCard(.cat, .eleven)
                       , "LuckyGame의 특정 플레이가 해당 플레이어의 카드 뽑기가 결과값과 다름.")

        let secondCard = luckyGame.requestFlippedCard(currentPlayer,
                                                      .first,
                                                      cardIndex: nil,
                                                      flippedCardType: .maxNumber)
        XCTAssertEqual(secondCard,
                       DefaultLuckyCard(.dog, .eleven),
                       "LuckyGame의 특정 플레이가 해당 플레이어의 카드 뽑기가 결과값과 다름.")

        let thirdCard = luckyGame.requestFlippedCard(currentPlayer,
                                                     .ground,
                                                     cardIndex: 4,
                                                     flippedCardType: nil)
        XCTAssertEqual(thirdCard,
                       DefaultLuckyCard(.cow, .eleven),
                       "LuckyGame의 특정 플레이가 해당 플레이어의 카드 뽑기가 결과값과 다름.")

        XCTAssertTrue(luckyGame.validateCurrentFlippedCards(currentPlayer),
                      "LuckyGame의 특정 플레이어가 뽑은 3장의 카드가 같은지에 대한 검증이 결과값과 다름.")
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
