//
//  UILabel.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/07.
//

import UIKit

extension UILabel {
    func configureCardNumberLabel() {
        self.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = .systemFont(ofSize: 15, weight: .bold)
        self.textColor = .black
        self.text = ""
        self.sizeToFit()
    }
}
