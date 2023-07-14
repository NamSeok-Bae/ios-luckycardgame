//
//  PlayerTests.swift
//  PlayerTests
//
//  Created by 배남석 on 2023/07/12.
//

import XCTest
@testable import 럭키카드

final class PlayerTests: XCTestCase {
    var player: DefaultPlayer!

    override func setUpWithError() throws {
        player = DefaultPlayer()
    }

    override func tearDownWithError() throws {
        player = nil
    }
    
    func test_플레이어_초기화() {
        player.setBoard(DefaultBoard(name: "A"))
        XCTAssertTrue(player.getBoard().getDeck().isEmpty, "Player의 초기화 결과가 결과값과 다름.")
        XCTAssertEqual(player.getBoard().getName(), "A", "Player의 초기화 결과가 결과값과 다름.")
        
        let player = DefaultPlayer()
        XCTAssertTrue(player.getBoard().getDeck().isEmpty, "Player의 초기화 결과가 결과값과 다름.")
        XCTAssertEqual(player.getBoard().getName(), "Nil", "Player의 초기화 결과가 결과값과 다름.")
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
