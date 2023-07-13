//
//  LuckyCardFactoryTests.swift
//  LuckyCardFactoryTests
//
//  Created by 배남석 on 2023/07/12.
//

import XCTest
@testable import 럭키카드

final class LuckyCardFactoryTests: XCTestCase {
    var luckyCardFactory: LuckyCardFactory!

    override func setUpWithError() throws {
        luckyCardFactory = DefaultLuckyCardFactory()
    }

    override func tearDownWithError() throws {
        luckyCardFactory = nil
    }
    
    func test_카드팩토리_덱_생성() {
        luckyCardFactory.createDeck()
        
        XCTAssertEqual(luckyCardFactory.getDeck().count, 36, "카드 팩토리에서 덱 생성 함수가 올바르지 않음.")
        
        var deckIndex = 0;
        for i in AnimalType.allCases {
            for j in CardNumberType.allCases {
                XCTAssertEqual(luckyCardFactory.getDeck()[deckIndex], DefaultLuckyCard(i, j), "카드 팩토리에서 생성한 카드가 올바르지 않음.")
                deckIndex += 1
            }
        }
    }
    
    func test_카드팩토리_덱_반환() {
        luckyCardFactory.createDeck()
        let deck = luckyCardFactory.returnDeck()
        let deckDescription = deck.map { $0.description }
        
        XCTAssertEqual(deckDescription,
                       ["🐶01", "🐶02", "🐶03", "🐶04", "🐶05", "🐶06", "🐶07", "🐶08", "🐶09", "🐶10", "🐶11", "🐶12", "🐱01", "🐱02", "🐱03", "🐱04", "🐱05", "🐱06", "🐱07", "🐱08", "🐱09", "🐱10", "🐱11", "🐱12", "🐮01", "🐮02", "🐮03", "🐮04", "🐮05", "🐮06", "🐮07", "🐮08", "🐮09", "🐮10", "🐮11", "🐮12"],
                       "카드 팩토리에서 생성한 카드 반환값이 결과값과 다름.")
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
