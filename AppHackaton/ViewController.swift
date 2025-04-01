//
//  ViewController.swift
//  AppHackaton
//
//  Created by Julián on 30/03/25.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        let titleLabel = UILabel()
        titleLabel.text = "Grutas de Tolantongo"
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.spacing = 10
        buttonStack.distribution = .fillEqually
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonStack)
        
        for _ in 0..<3 {
            let smallButton = UIButton(type: .system)
            smallButton.backgroundColor = .systemBlue
            smallButton.layer.cornerRadius = 15
            buttonStack.addArrangedSubview(smallButton)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: buttonStack.leadingAnchor, constant: -10),
            
            buttonStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            buttonStack.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            buttonStack.heightAnchor.constraint(equalToConstant: 60),
            buttonStack.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.spacing = 20
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(verticalStack)
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
        
        let firstRowStack = UIStackView()
        firstRowStack.axis = .horizontal
        firstRowStack.spacing = 20
        firstRowStack.distribution = .fillEqually
        firstRowStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.addArrangedSubview(firstRowStack)
        
        let squareImages = ["Cenote", "Cenote2"]
        
        for i in 0..<2 {
            let squareButton = UIButton(type: .system)
            squareButton.backgroundColor = .systemRed
            squareButton.heightAnchor.constraint(equalToConstant: 135).isActive = true
            if let image = UIImage(named: squareImages[i])?.withRenderingMode(.alwaysOriginal) {
                squareButton.setImage(image, for: .normal)
            }
            squareButton.imageView?.contentMode = .scaleAspectFill
            squareButton.clipsToBounds = true
            squareButton.layer.cornerRadius = squareButton.frame.height / 2
            squareButton.layer.cornerRadius = 15
            firstRowStack.addArrangedSubview(squareButton)
        }
        
        let buttonColors: [UIColor] = [.systemYellow, .systemGreen, .systemCyan, .systemBlue, .systemOrange, .systemPurple, .systemPink]
        
        for i in 0..<7 {
            let button = UIButton(type: .system)
            button.backgroundColor = buttonColors[i]
            button.heightAnchor.constraint(equalToConstant: 135).isActive = true
            button.layer.cornerRadius = 15
            verticalStack.addArrangedSubview(button)
        }
        
        let bottomBar = UIView()
                bottomBar.backgroundColor = .systemRed
                bottomBar.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(bottomBar)
                
                NSLayoutConstraint.activate([
                    bottomBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    bottomBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    bottomBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    bottomBar.heightAnchor.constraint(equalToConstant: 90)
                ])
                
                let bottomStack = UIStackView()
                bottomStack.axis = .horizontal
                bottomStack.spacing = 40
                bottomStack.distribution = .fillEqually
                bottomStack.translatesAutoresizingMaskIntoConstraints = false
                bottomBar.addSubview(bottomStack)
                
                NSLayoutConstraint.activate([
                    bottomStack.leadingAnchor.constraint(equalTo: bottomBar.leadingAnchor, constant: 30),
                    bottomStack.trailingAnchor.constraint(equalTo: bottomBar.trailingAnchor, constant: -30),
                    bottomStack.topAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 15),
                    bottomStack.bottomAnchor.constraint(equalTo: bottomBar.bottomAnchor, constant: -25)

                ])
        
                let bottomBarIcons = ["Lines", "Home", "Brochure", "Gear"]
                                
                for i in 0..<4 {
                    let bottomButton = UIButton(type: .system)
                    //bottomButton.backgroundColor = .black
                    if let image = UIImage(named: bottomBarIcons[i])?.withRenderingMode(.alwaysOriginal) {
                        bottomButton.setImage(image, for: .normal)
                    }
                    bottomButton.layer.cornerRadius = 15
                    bottomStack.addArrangedSubview(bottomButton)
                }
    }
}


