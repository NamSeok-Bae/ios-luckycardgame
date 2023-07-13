//
//  ValidatorTests.swift
//  ValidatorTests
//
//  Created by 배남석 on 2023/07/13.
//

import XCTest
@testable import 럭키카드

final class ValidatorTests: XCTestCase {
    var validator: DefaultValidator!
    
    override func setUpWithError() throws {
        validator = DefaultValidator()
    }

    override func tearDownWithError() throws {
        validator = nil
    }
    
    func test_플레이어_덱에서_같은_숫자_3장_검증하기() {
        var playerDeck = [DefaultLuckyCard(.dog, .one), DefaultLuckyCard(.cat, .one), DefaultLuckyCard(.cow, .one)]
        XCTAssertTrue(validator.validateThreeSameCardInDeck(playerDeck),
                      "Validator의 덱에서 같은 숫자 3장 검증하기 결과값이 다름.")
        
        playerDeck = [DefaultLuckyCard(.dog, .one), DefaultLuckyCard(.cat, .one), DefaultLuckyCard(.cow, .two)]
        XCTAssertFalse(validator.validateThreeSameCardInDeck(playerDeck),
                       "Validator의 덱에서 같은 숫자 3장 검증하기 결과값이 다름.")
    }
    
    func test_플레이가_뽑은_카드의_숫자가_모두_같은지_검증하기() {
        var flippedCards = [DefaultLuckyCard]()
        XCTAssertFalse(validator.validateCurrentFlippedCards(flippedCards),
                      "Validator의 뒤집은 카드들이 모두 같은지 검증하기 결과값이 다름.")
        flippedCards = [DefaultLuckyCard(.dog, .one)]
        XCTAssertTrue(validator.validateCurrentFlippedCards(flippedCards),
                      "Validator의 뒤집은 카드들이 모두 같은지 검증하기 결과값이 다름.")
        
        flippedCards = [DefaultLuckyCard(.dog, .one), DefaultLuckyCard(.cat, .one)]
        XCTAssertTrue(validator.validateCurrentFlippedCards(flippedCards),
                      "Validator의 뒤집은 카드들이 모두 같은지 검증하기 결과값이 다름.")
        
        flippedCards = [DefaultLuckyCard(.dog, .one), DefaultLuckyCard(.cat, .two)]
        XCTAssertFalse(validator.validateCurrentFlippedCards(flippedCards),
                      "Validator의 뒤집은 카드들이 모두 같은지 검증하기 결과값이 다름.")
        
        flippedCards = [DefaultLuckyCard(.dog, .one), DefaultLuckyCard(.cat, .one), DefaultLuckyCard(.cow, .one)]
        XCTAssertTrue(validator.validateCurrentFlippedCards(flippedCards),
                      "Validator의 뒤집은 카드들이 모두 같은지 검증하기 결과값이 다름.")
        flippedCards = [DefaultLuckyCard(.dog, .one), DefaultLuckyCard(.cat, .one), DefaultLuckyCard(.cow, .two)]
        XCTAssertFalse(validator.validateCurrentFlippedCards(flippedCards),
                      "Validator의 뒤집은 카드들이 모두 같은지 검증하기 결과값이 다름.")
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
