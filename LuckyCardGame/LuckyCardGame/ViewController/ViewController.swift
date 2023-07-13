//
//  ViewController.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/04.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - UI Properties
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: PlayerCountType.allCases.map { $0.string })
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(didChangeControlValue(segment:)), for: .valueChanged)
        self.didChangeControlValue(segment: segmentedControl)
        return segmentedControl
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.configureColorRoundView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var footerView: UIView = {
        let view = UIView()
        view.configureColorRoundView(.gray)
        return view
    }()
    
    private var footerViewHeightConstraint: NSLayoutConstraint?
    
    // MARK: - Properties
    var luckyGame: LuckyGame!
    
    // MARK: - LifeCycles
    init() {
        luckyGame = DefaultLuckyGame()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        luckyGame = DefaultLuckyGame()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configureUI()
    }
    
    // MARK: - Functions
    private func setupViews() {
        setupContainerStackVeiw()
        
        [segmentedControl,
         containerStackView,
         footerView
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupContainerStackVeiw() {
        BoardNameType.allCases.dropLast(1).forEach {
            containerStackView.addArrangedSubview(ContainerView(areaName: $0.name))
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        configureSegmentedControl()
        configureContainerStackView()
        configurefooterView()
    }
    
    private func configureSegmentedControl() {
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                  constant: 5).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                      constant: 10).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                       constant: -10).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private func configureContainerStackView() {
        containerStackView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor,
                                                constant: 10).isActive = true
        containerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                    constant: 10).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                     constant: -10).isActive = true
        containerStackView.heightAnchor.constraint(lessThanOrEqualToConstant: 600).isActive = true
    }
    
    private func configurefooterView() {
        footerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                            constant: 10).isActive = true
        footerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                             constant: -10).isActive = true
        footerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                           constant: -5).isActive = true
    }
    
    private func initContainerViews(_ playerCount: Int) {
        containerStackView.arrangedSubviews.enumerated().forEach { (idx, view) in
            view.subviews.forEach { $0.removeFromSuperview() }
            view.isHidden = !(idx < playerCount)
        }
    }
    
    private func initfooterView() {
        footerView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func addCardViewsInContainerView(_ playerCount: Int) {
        for idx in 0..<playerCount {
            let board = luckyGame.getPlayer(idx).getBoard()
            
            if let containerView = containerStackView.arrangedSubviews[idx] as? ContainerView {
                containerView.areaLabel.isHidden = true
                
                let playerDeckCountType = DeckCountType.playerDeckCount(rawValue: board.getDeck().count) ?? .eight
                let cardLeadingSpacing = playerDeckCountType.cardLeadingSpacing
                let cardViewWidth = 60
                
                for (cardIndex, card) in board.getDeck().enumerated() {
                    let cardView = CardView(card)
                    containerView.addSubview(cardView)
                    if idx > 0 {
                        cardView.flippedCard(card)
                    }
                    cardView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                      constant: CGFloat(6 + cardIndex * (cardViewWidth - cardLeadingSpacing))).isActive = true
                    cardView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
                }
            }
        }
    }
    
    private func addCardViewsInfooterView(_ playerCount: Int) {
        updatefooterViewConstraint(playerCount)
        
        let board = luckyGame.getGround()
        let footerDeckCountType = DeckCountType.footerDeckCount(rawValue: board.getDeck().count) ?? .nine
        let cardLeadingSpacing = footerDeckCountType.cardLeadingSpacing
        let cardViewWidth = 60
        
        for (cardIndex, card) in board.getDeck().enumerated() {
            let cardView = CardView(card)
            let cardTopSpacing = footerDeckCountType.calculateCardTopSpacing(cardIndex)
            let locationIndex = cardIndex % footerDeckCountType.cardCountInTop
            footerView.addSubview(cardView)
            cardView.flippedCard(card)
            cardView.leadingAnchor.constraint(equalTo: footerView.leadingAnchor,
                                              constant: CGFloat(6 + locationIndex * (cardViewWidth - cardLeadingSpacing))).isActive = true
            cardView.topAnchor.constraint(equalTo: footerView.topAnchor,
                                          constant: CGFloat(cardTopSpacing)).isActive = true
        }
    }
    
    private func updatefooterViewConstraint(_ playerCount: Int) {
        footerViewHeightConstraint?.isActive = false
        footerViewHeightConstraint = footerView.heightAnchor.constraint(equalToConstant: playerCount == 5 ? 140 : 260)
        footerViewHeightConstraint?.isActive = true
    }
    
    // MARK: - Objc Functions
    @objc private func didChangeControlValue(segment: UISegmentedControl) {
        let playerCount = PlayerCountType.allCases[segment.selectedSegmentIndex].rawValue
        luckyGame.initGame(playerCount)
        
        initContainerViews(playerCount)
        initfooterView()
        addCardViewsInContainerView(playerCount)
        addCardViewsInfooterView(playerCount)
    }
}
