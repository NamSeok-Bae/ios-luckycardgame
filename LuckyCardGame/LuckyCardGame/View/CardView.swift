//
//  CardView.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/06.
//

import UIKit

final class CardView: UIView {
    // MARK: - UI Properties
    private lazy var topNumberLabel: UILabel = {
        let label = UILabel()
        label.configureCardNumberLabel()
        return label
    }()
    
    private lazy var bottomNumberLabel: UILabel = {
        let label = UILabel()
        label.configureCardNumberLabel()
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // MARK: - Properties
    
    // MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureUI()
    }
    
    convenience init(_ card: Card) {
        self.init()
        setupViews()
        configureUI()
        bindCardData(card)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        configureUI()
    }
    
    // MARK: - Functions
    private func setupViews() {
        [topNumberLabel,
         bottomNumberLabel,
         imageView
        ].forEach {
            addSubview($0)
        }
    }
    
    private func configureUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1
        self.widthAnchor.constraint(equalToConstant: 60).isActive = true
        self.heightAnchor.constraint(equalToConstant: 90).isActive = true
        self.configureColorRoundView(.white)
        configureTopNumberLabel()
        configureBottomNumberLabel()
        configureImageView()
    }
    
    private func configureImageView() {
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func configureTopNumberLabel() {
        topNumberLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                            constant: 5).isActive = true
        topNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant: 5).isActive = true
    }
    
    private func configureBottomNumberLabel() {
        bottomNumberLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                  constant: -5).isActive = true
        bottomNumberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                    constant: -5).isActive = true
    }
    
    func bindCardData(_ card: Card) {
        imageView.image = card.animal.emojiToImage(CGSize(width: 30, height: 30), 30)
        topNumberLabel.text = "\(card.number)"
        bottomNumberLabel.text = "\(card.number)"
    }
    
    func lotation(_ isFront: Bool, _ card: Card) {
        topNumberLabel.isHidden = !isFront
        bottomNumberLabel.isHidden = !isFront
        imageView.image = isFront ? card.animal.emojiToImage(CGSize(width: 30, height: 30), 30) : UIImage.cardBackImage
    }
}
