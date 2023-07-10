//
//  DeckCountType.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/08.
//

import Foundation

enum DeckCountType: CaseIterable {
    enum playerDeckCount: Int {
        case six = 6
        case seven = 7
        case eight = 8
        
        var cardLeadingSpacing: Int {
            let containerViewWidth = 360
            let allCardViewWidth = self.rawValue * 60
            let cardViewBetweenCardViewMargin = (allCardViewWidth - containerViewWidth) / self.rawValue
            var additinalMargin = 0
            if cardViewBetweenCardViewMargin / self.rawValue > 0 {
                additinalMargin = (cardViewBetweenCardViewMargin / self.rawValue) + 1
            }
            
            return cardViewBetweenCardViewMargin + additinalMargin
        }
    }
    
    enum footerDeckCount: Int {
        case six = 6
        case eight = 8
        case nine = 9
        
        /*
         다양한 케이스에 대응되지않음.. ex) 13
         
         11 이상의 수들에 대해선 규칙이 더 필요하다고 봄. 3단으로 쌓을지 2단으로 쌓을지
         */
        var cardCountInTop: Int {
            switch self {
            case .six:
                return self.rawValue
            default:
                return (self.rawValue + 1)/2
            }
        }
        
        var cardLeadingSpacing: Int {
            switch self {
            case .six:
                return 0
            default:
                let cardViewWidth = 60
                let containerViewWidth = 360
                let cardCountInTop = self.cardCountInTop
                let allCardViewWidthInTop = cardCountInTop * cardViewWidth
                let cardViewBetweenCardViewMargin = (allCardViewWidthInTop - containerViewWidth) / cardCountInTop
                var additinalMargin = 0
                if cardViewBetweenCardViewMargin / cardCountInTop > 0 {
                    additinalMargin = (cardViewBetweenCardViewMargin / cardCountInTop) + 1
                } else if cardViewBetweenCardViewMargin / cardCountInTop < 0 {
                    additinalMargin = (cardViewBetweenCardViewMargin / cardCountInTop) - 1
                }
                
                return cardViewBetweenCardViewMargin + additinalMargin
            }
        }
        
        func calculateCardTopSpacing(_ cardIndex: Int) -> Int {
            let defaultSpacing = 20
            let cardViewHeight = 90
            switch self {
            case .six:
                return defaultSpacing
            default:
                if cardIndex < self.cardCountInTop {
                    return defaultSpacing
                }
                
                return defaultSpacing * 3 + cardViewHeight
            }
        }
    }
}
