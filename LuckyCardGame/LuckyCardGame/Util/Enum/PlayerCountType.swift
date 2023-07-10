//
//  PlayerCountType.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/06.
//

import Foundation

enum PlayerCountType: Int, CaseIterable {
    case three = 3, four, five
    
    var string: String {
        switch self {
        case .three:
            return "3명"
        case .four:
            return "4명"
        case .five:
            return "5명"
        }
    }
}
