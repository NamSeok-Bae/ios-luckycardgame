//
//  DividerTests.swift
//  DividerTests
//
//  Created by 배남석 on 2023/07/12.
//

import XCTest
@testable import 럭키카드

final class DividerTests: XCTestCase {
    var divider: DefaultDivider!
    
    override func setUpWithError() throws {
        divider = DefaultDivider()
    }

    override func tearDownWithError() throws {
        divider = nil
    }
    
    func test_디바이더_초기화() {
        divider.setDeck([DefaultLuckyCard(.dog, .one), DefaultLuckyCard(.cat, .one), DefaultLuckyCard(.cow, .one)])
        XCTAssertEqual(divider.getDeck(),
                       [DefaultLuckyCard(.dog, .one), DefaultLuckyCard(.cat, .one), DefaultLuckyCard(.cow, .one)],
                       "Divider의 초기화된 상태가 결과값과 다름.")
        XCTAssertEqual(divider.getDeckCount(), 3, "Divider의 초기화된 상태가 결과값과 다름.")
        
        let divider = DefaultDivider(deck: [DefaultLuckyCard(.dog, .one), DefaultLuckyCard(.cat, .one), DefaultLuckyCard(.cow, .one)])
        XCTAssertEqual(divider.getDeck(),
                       [DefaultLuckyCard(.dog, .one), DefaultLuckyCard(.cat, .one), DefaultLuckyCard(.cow, .one)],
                       "Divider의 초기화된 상태가 결과값과 다름.")
        XCTAssertEqual(divider.getDeckCount(), 3, "Divider의 초기화된 상태가 결과값과 다름.")
    }
    
    func test_디바이더가_3명에게_카드_나눠주기() {
        let cardFactory = DefaultLuckyCardFactory()
        cardFactory.createDeck()
        let baseDeck = cardFactory.returnDeck()
        let divider = DefaultDivider(deck: baseDeck)
        
        let result = divider.divideToPlayers(3)
        let realResult = [
            ["🐶01", "🐶04", "🐶07", "🐶10", "🐱02", "🐱05", "🐱08", "🐱11"],
            ["🐶02", "🐶05", "🐶08", "🐶11", "🐱03", "🐱06", "🐱09", "🐮01"],
            ["🐶03", "🐶06", "🐶09", "🐱01", "🐱04", "🐱07", "🐱10", "🐮02"],
            ["🐮03", "🐮04", "🐮05", "🐮06", "🐮07", "🐮08", "🐮09", "🐮10", "🐮11"]]
        
        var check = true
        for i in 0...3 {
            if result[i].map({ $0.description }) != realResult[i] {
                check = false
            }
        }
        
        XCTAssertFalse(check, "Divider가 플레이어에게 카드를 나눠주기위한 값이 결과값과 다름.")
    }
    
    func test_디바이더가_4명에게_카드_나눠주기() {let cardFactory = DefaultLuckyCardFactory()
        cardFactory.createDeck()
        let baseDeck = cardFactory.returnDeck()
        let divider = DefaultDivider(deck: baseDeck)
        
        let result = divider.divideToPlayers(4)
        let realResult = [
            ["🐶01", "🐶05", "🐶09", "🐱01", "🐱05", "🐱09", "🐮01"],
            ["🐶02", "🐶06", "🐶10", "🐱02", "🐱06", "🐱10", "🐮02"],
            ["🐶03", "🐶07", "🐶11", "🐱03", "🐱07", "🐱11", "🐮03"],
            ["🐶04", "🐶08", "🐶12", "🐱04", "🐱08", "🐱12", "🐮04"],
            ["🐮05", "🐮06", "🐮07", "🐮08", "🐮09", "🐮10", "🐮11", "🐮12"]]
        
        var check = true
        for i in 0...4 {
            if result[i].map({ $0.description }) != realResult[i] {
                check = false
            }
        }
        
        XCTAssertFalse(check, "Divider가 플레이어에게 카드를 나눠주기위한 값이 결과값과 다름.")
    }
    
    func test_디바이더가_5명에게_카드_나눠주기() {let cardFactory = DefaultLuckyCardFactory()
        cardFactory.createDeck()
        let baseDeck = cardFactory.returnDeck()
        let divider = DefaultDivider(deck: baseDeck)
        
        let result = divider.divideToPlayers(5)
        let realResult = [
            ["🐶01", "🐶06", "🐶11", "🐱04", "🐱09", "🐮02"],
            ["🐶02", "🐶07", "🐶12", "🐱05", "🐱10", "🐮03"],
            ["🐶03", "🐶08", "🐱01", "🐱06", "🐱11", "🐮04"],
            ["🐶04", "🐶09", "🐱02", "🐱07", "🐱12", "🐮05"],
            ["🐶05", "🐶10", "🐱03", "🐱08", "🐮01", "🐮06"],
            ["🐮07", "🐮08", "🐮09", "🐮10", "🐮11", "🐮12"]]
        
        var check = true
        for i in 0...5 {
            if result[i].map({ $0.description }) != realResult[i] {
                check = false
            }
        }
        
        XCTAssertFalse(check, "Divider가 플레이어에게 카드를 나눠주기위한 값이 결과값과 다름.")
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
