//
//  BoardNameType.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/06.
//

import Foundation

enum BoardNameType: CaseIterable {
    case first
    case second
    case third
    case fourth
    case fifth
    case ground
    
    var name: String {
        switch self {
        case .first:
            return "A"
        case .second:
            return "B"
        case .third:
            return "C"
        case .fourth:
            return "D"
        case .fifth:
            return "E"
        case .ground:
            return "바닥"
        }
    }
}
