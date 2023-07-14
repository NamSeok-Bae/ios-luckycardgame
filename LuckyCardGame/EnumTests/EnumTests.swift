//
//  EnumTests.swift
//  EnumTests
//
//  Created by 배남석 on 2023/07/13.
//

import XCTest
@testable import 럭키카드

final class EnumTests: XCTestCase {
    func testPlayerDeckCount() {
        let playerSixDeckCount = DeckCountType.playerDeckCount.six
        let playerSevenDeckCount = DeckCountType.playerDeckCount.seven
        let playerEightDeckCount = DeckCountType.playerDeckCount.eight
        
        XCTAssertEqual(playerSixDeckCount.rawValue, 6, "Player DeckCount이 결과값과 다름.")
        XCTAssertEqual(playerSevenDeckCount.rawValue, 7, "Player DeckCount이 결과값과 다름.")
        XCTAssertEqual(playerEightDeckCount.rawValue, 8, "Player DeckCount이 결과값과 다름.")
        
        XCTAssertEqual(playerSixDeckCount.cardLeadingSpacing,
                       0,
                       "Player CardLeadingSpacing이 결과값과 다름.")
        XCTAssertEqual(playerSevenDeckCount.cardLeadingSpacing,
                       10,
                       "Player CardLeadingSpacing이 결과값과 다름.")
        XCTAssertEqual(playerEightDeckCount.cardLeadingSpacing,
                       17,
                       "Player CardLeadingSpacing이 결과값과 다름.")
    }
    
    func testFooterDeckCount() {
        let footerSixDeckCount = DeckCountType.footerDeckCount.six
        let footerEightDeckCount = DeckCountType.footerDeckCount.eight
        let footerNineDeckCount = DeckCountType.footerDeckCount.nine
        
        XCTAssertEqual(footerSixDeckCount.rawValue, 6, "Footer DeckCount가 결과값과 다름.")
        XCTAssertEqual(footerEightDeckCount.rawValue, 8, "Footer DeckCount가 결과값과 다름.")
        XCTAssertEqual(footerNineDeckCount.rawValue, 9, "Footer DeckCount가 결과값과 다름.")
        
        XCTAssertEqual(footerSixDeckCount.cardLeadingSpacing,
                       0,
                       "Footer CardLeadingSpacing이 결과값과 다름.")
        XCTAssertEqual(footerEightDeckCount.cardLeadingSpacing,
                       -38,
                       "Footer CardLeadingSpacing이 결과값과 다름.")
        XCTAssertEqual(footerNineDeckCount.cardLeadingSpacing,
                       -15,
                       "Footer CardLeadingSpacing이 결과값과 다름.")
    }
    
    func testBoardType() {
        let firstBoardName = BoardType.first
        let secondBoardName = BoardType.second
        let thirdBoardName = BoardType.third
        let fourthBoardName = BoardType.fourth
        let fifthBoardName = BoardType.fifth
        let groundBoardName = BoardType.ground
        
        XCTAssertEqual(firstBoardName.name, "A", "BoardType name과 결과값이 다름.")
        XCTAssertEqual(secondBoardName.name, "B", "BoardType name과 결과값이 다름.")
        XCTAssertEqual(thirdBoardName.name, "C", "BoardType name과 결과값이 다름.")
        XCTAssertEqual(fourthBoardName.name, "D", "BoardType name과 결과값이 다름.")
        XCTAssertEqual(fifthBoardName.name, "E", "BoardType name과 결과값이 다름.")
        XCTAssertEqual(groundBoardName.name, "바닥", "BoardType name과 결과값이 다름.")
    }
    
    func testPlayerCountType() {
        let threePlayer = PlayerCountType.three
        let fourPlayer = PlayerCountType.four
        let fivePlayer = PlayerCountType.five
        
        XCTAssertEqual(threePlayer.rawValue, 3, "PlayerCountType RawValue가 결과값과 다름.")
        XCTAssertEqual(fourPlayer.rawValue, 4, "PlayerCountType RawValue가 결과값과 다름.")
        XCTAssertEqual(fivePlayer.rawValue, 5, "PlayerCountType RawValue가 결과값과 다름.")
        
        XCTAssertEqual(threePlayer.string, "3명", "PlayerCountType String이 결과값과 다름.")
        XCTAssertEqual(fourPlayer.string, "4명", "PlayerCountType String이 결과값과 다름.")
        XCTAssertEqual(fivePlayer.string, "5명", "PlayerCountType String이 결과값과 다름.")
    }
    
    func testCardNumberType() {
        for (idx, i) in CardNumberType.allCases.enumerated() {
            XCTAssertEqual(i.rawValue, idx + 1, "CardNumberType RawValue가 결과값과 다름.")
        }
    }
    
    func testAnimalType() {
        let dog = AnimalType.dog
        let cat = AnimalType.cat
        let cow = AnimalType.cow
        
        XCTAssertEqual(dog.rawValue, "🐶", "AnimalType RawValue가 결과값과 다름.")
        XCTAssertEqual(cat.rawValue, "🐱", "AnimalType RawValue가 결과값과 다름.")
        XCTAssertEqual(cow.rawValue, "🐮", "AnimalType RawValue가 결과값과 다름.")
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
