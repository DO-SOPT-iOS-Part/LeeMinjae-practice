//
//  ViewController.swift
//  sopt33-second-seminar
//
//  Created by 민 on 10/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private var viewOne: UIView = {
        var view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private var viewTwo: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var viewThree: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var viewFour: UIView = {
        var view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private var viewFive: UIView = {
        var view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private var viewSix: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var viewSeven: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var viewEight: UIView = {
        var view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private var stackViewOne: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private var scrollViewOne: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.setLayout()
        // self.setupUI()
        // setupGestureRecognizer()
    }
    
    // MARK: - @IBAction Properties
    
    // MARK: - @Functions
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
        
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)])
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        
        [greenView, blueView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        
        NSLayoutConstraint.activate([greenView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                     greenView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     greenView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                     greenView.heightAnchor.constraint(equalToConstant: 800)])
        
        NSLayoutConstraint.activate([blueView.topAnchor.constraint(equalTo: self.greenView.bottomAnchor),
                                     blueView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                     blueView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                     blueView.heightAnchor.constraint(equalToConstant: 800),
                                     blueView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)])
    }
    
    // UI 세팅 작업
    private func setupUI() {
        self.view.addSubview(stackViewOne)
        stackViewOne.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([stackViewOne.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     stackViewOne.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                     stackViewOne.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     stackViewOne.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)])
        
        [viewTwo, viewThree].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackViewOne.addArrangedSubview($0)
        }
        """
        [viewOne, viewTwo, viewThree, viewFour, viewFive, viewSix, viewSeven, viewEight].forEach { [weak self] view in
            guard let self else { return }
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([viewOne.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
                                     viewOne.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     viewOne.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2),
                                     viewOne.heightAnchor.constraint(equalToConstant: self.view.frame.height / 4)
                                    ])
        
        NSLayoutConstraint.activate([viewTwo.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
                                     viewTwo.leadingAnchor.constraint(equalTo: self.viewOne.trailingAnchor, constant: 0),
                                     viewTwo.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2),
                                     viewTwo.heightAnchor.constraint(equalToConstant: self.view.frame.height / 4)
                                    ])
        
        NSLayoutConstraint.activate([viewThree.topAnchor.constraint(equalTo: self.viewOne.bottomAnchor, constant: 0),
                                     viewThree.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     viewThree.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2),
                                     viewThree.heightAnchor.constraint(equalToConstant: self.view.frame.height / 4)
                                    ])
        NSLayoutConstraint.activate([viewFour.topAnchor.constraint(equalTo: self.viewTwo.bottomAnchor, constant: 0),
                                     viewFour.leadingAnchor.constraint(equalTo: self.viewThree.trailingAnchor, constant: 0),
                                     viewFour.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2),
                                     viewFour.heightAnchor.constraint(equalToConstant: self.view.frame.height / 4)
                                    ])
        """
    }
    
}
