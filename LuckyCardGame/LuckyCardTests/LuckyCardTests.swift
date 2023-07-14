//
//  LuckyCardTests.swift
//  LuckyCardTests
//
//  Created by 배남석 on 2023/07/12.
//

import XCTest
@testable import 럭키카드

final class LuckyCardTests: XCTestCase {
    var luckyCard: DefaultLuckyCard!

    override func setUpWithError() throws {
        luckyCard = DefaultLuckyCard()
    }

    override func tearDownWithError() throws {
        luckyCard = nil
    }
    
    func test_럭키카드_초기화() {
        luckyCard.setInformation(.dog, .one)
        XCTAssertEqual(luckyCard, DefaultLuckyCard(.dog, .one), "럭키카드 초기화가 결과값과 다름.")
        XCTAssertEqual(luckyCard.getAnimal(), "🐶", "럭키카드 초기화가 결과값과 다름.")
        XCTAssertEqual(luckyCard.getNumber(), 1, "럭키카드 초기화가 결과값과 다름.")
        
        var newLuckyCard = DefaultLuckyCard(.cat, .eight)
        XCTAssertEqual(newLuckyCard, DefaultLuckyCard(.cat, .eight), "럭키카드 초기화가 결과값과 다름.")
        XCTAssertEqual(newLuckyCard.getAnimal(), "🐱", "럭키카드 초기화가 결과값과 다름.")
        XCTAssertEqual(newLuckyCard.getNumber(), 8, "럭키카드 초기화가 결과값과 다름.")
        
        newLuckyCard = DefaultLuckyCard(animal: "🐶", number: 2)
        XCTAssertEqual(newLuckyCard, DefaultLuckyCard(.dog, .two), "럭키카드 초기화가 결과값과 다름.")
        XCTAssertEqual(newLuckyCard.getAnimal(), "🐶", "럭키카드 초기화가 결과값과 다름.")
        XCTAssertEqual(newLuckyCard.getNumber(), 2, "럭키카드 초기화가 결과값과 다름.")
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
