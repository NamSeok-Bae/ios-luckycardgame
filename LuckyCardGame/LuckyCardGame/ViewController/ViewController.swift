//
//  ViewController.swift
//  LuckyCardGame
//
//  Created by 배남석 on 2023/07/04.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - UI Properties
    private lazy var headerView: UIView = {
        let view = UIView()
        view.configureColorRoundView(.yellow)
        return view
    }()
    
    private lazy var firstAreaView = ContainerView(areaName: "A")
    private lazy var secondAreaView = ContainerView(areaName: "B")
    private lazy var thirdAreaView = ContainerView(areaName: "C")
    private lazy var fourthAreaView = ContainerView(areaName: "D")
    private lazy var fifthAreaView = ContainerView(areaName: "E")
    
    private lazy var fotterView: UIView = {
        let view = UIView()
        view.configureColorRoundView(.gray)
        return view
    }()
    
    // MARK: - Properties
    private var containerViewHeight: CGFloat?
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        configureUI()
        createCardFactory()
    }
    
    // MARK: - Functions
    private func setupViews() {
        [headerView,
         firstAreaView,
         secondAreaView,
         thirdAreaView,
         fourthAreaView,
         fifthAreaView,
         fotterView
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        containerViewHeight = (view.frame.height - 350) / 5
        configureHeaderView()
        configureFirstAreaView()
        configureSecondAreaView()
        configureThirdAreaView()
        configureFourthAreaView()
        configureFifthAreaView()
        configureFotterView()
    }
    
    private func configureHeaderView() {
        headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                  constant: 5).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                      constant: 10).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                       constant: -10).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private func configureFirstAreaView() {
        firstAreaView.topAnchor.constraint(equalTo: headerView.bottomAnchor,
                                           constant: 10).isActive = true
        firstAreaView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                               constant: 10).isActive = true
        firstAreaView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: -10).isActive = true
        firstAreaView.heightAnchor.constraint(equalToConstant: containerViewHeight ?? 100).isActive = true
    }
    
    private func configureSecondAreaView() {
        secondAreaView.topAnchor.constraint(equalTo: firstAreaView.bottomAnchor,
                                            constant: 10).isActive = true
        secondAreaView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                constant: 10).isActive = true
        secondAreaView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                 constant: -10).isActive = true
        secondAreaView.heightAnchor.constraint(equalToConstant: containerViewHeight ?? 100).isActive = true
    }
    
    private func configureThirdAreaView() {
        thirdAreaView.topAnchor.constraint(equalTo: secondAreaView.bottomAnchor,
                                            constant: 10).isActive = true
        thirdAreaView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                               constant: 10).isActive = true
        thirdAreaView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: -10).isActive = true
        thirdAreaView.heightAnchor.constraint(equalToConstant: containerViewHeight ?? 100).isActive = true
    }
    
    private func configureFourthAreaView() {
        fourthAreaView.topAnchor.constraint(equalTo: thirdAreaView.bottomAnchor,
                                            constant: 10).isActive = true
        fourthAreaView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                constant: 10).isActive = true
        fourthAreaView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                 constant: -10).isActive = true
        fourthAreaView.heightAnchor.constraint(equalToConstant: containerViewHeight ?? 100).isActive = true
    }
    
    private func configureFifthAreaView() {
        fifthAreaView.topAnchor.constraint(equalTo: fourthAreaView.bottomAnchor,
                                            constant: 10).isActive = true
        fifthAreaView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                               constant: 10).isActive = true
        fifthAreaView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: -10).isActive = true
        fifthAreaView.heightAnchor.constraint(equalToConstant: containerViewHeight ?? 100).isActive = true
    }
    
    private func configureFotterView() {
        fotterView.topAnchor.constraint(equalTo: fifthAreaView.bottomAnchor,
                                        constant: 10).isActive = true
        fotterView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                            constant: 10).isActive = true
        fotterView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                             constant: -10).isActive = true
        fotterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                           constant: -5).isActive = true
    }
    
    private func createCardFactory() {
        let cardFactory = DefaultCardFactory()
        cardFactory.createCard()
        let deck = DefaultDeck(deck: cardFactory.returnDeck())
        deck.printShuffeldDeck()
    }
}
