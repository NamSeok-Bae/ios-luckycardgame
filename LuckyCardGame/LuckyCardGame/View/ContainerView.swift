//
//  ContainerView.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/04.
//

import UIKit

final class ContainerView: UIView {
    // MARK: - UI Properties
    lazy var areaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray.withAlphaComponent(0.5)
        label.textAlignment = .center
        
        if let fontDescriptor = UIFontDescriptor().withSymbolicTraits([.traitBold, .traitItalic]) {
            label.font = UIFont(descriptor: fontDescriptor, size: 50)
        } else {
            label.font = .systemFont(ofSize: 50, weight: .bold)
        }
        
        return label
    }()
    
    // MARK: - LifeCycles
    init(areaName: String) {
        super.init(frame: CGRect())
        setupViews()
        configureUI(areaName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Funtions
    
    private func setupViews() {
        self.addSubview(areaLabel)
    }
    
    private func configureUI(_ areaName: String) {
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        
        areaLabel.text = areaName
        areaLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                   constant: 15).isActive = true
        areaLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                       constant: 15).isActive = true
        areaLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                      constant: -15).isActive = true
        areaLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
