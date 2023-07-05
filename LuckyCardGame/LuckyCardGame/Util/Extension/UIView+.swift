//
//  UIView+.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/05.
//

import UIKit

extension UIView {
    func configureColorRoundView(_ color: UIColor? = nil) {
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color ?? .white
    }
}
