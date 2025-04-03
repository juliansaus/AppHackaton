//
//  ViewController.swift
//  AppHackaton
//
//  Created by Julián on 30/03/25.
//

import UIKit

class ViewController: UIViewController {
    var selectedButton: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? .black : .white
        }
        
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
        titleLabel.text = "Ruta de los Cenotes"
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.spacing = 10
        buttonStack.distribution = .fillEqually
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonStack)
        
        let topBarIcons = ["Weather", "Clock", "Pin"]
        
        for i in 0..<3 {
            let smallButton = UIButton(type: .system)
            buttonStack.addArrangedSubview(smallButton)
            if let image = UIImage(named: topBarIcons[i])?.withRenderingMode(.alwaysTemplate) {
                smallButton.setImage(image, for: .normal)
                smallButton.tintColor = UIColor { traitCollection in
                    return traitCollection.userInterfaceStyle == .dark ? .white : .black
                }
            }

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
        
        let moreInfoButton = UIButton(type: .system)
        moreInfoButton.setTitle("   Más sobre la ruta                                                 >", for: .normal)
        moreInfoButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        moreInfoButton.layer.borderWidth = 1
        moreInfoButton.layer.cornerRadius = 15
        moreInfoButton.layer.borderColor = UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? .white : .black
        }.cgColor
        moreInfoButton.contentHorizontalAlignment = .left
        moreInfoButton.tintColor = UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? .white : .black
        }
        verticalStack.addArrangedSubview(moreInfoButton)

        let buttonColors: [UIColor] = [.systemYellow, .systemGreen, .systemBlue, .systemOrange, .systemCyan, .systemPurple, .systemPink]
        
        func createCustomButton(title: String, lines: [String], color: UIColor) -> UIButton {
            let button = UIButton(type: .system)
            button.backgroundColor = color
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 1

            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 5
            stackView.translatesAutoresizingMaskIntoConstraints = false

            // 🏷️ Título
            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
            titleLabel.textAlignment = .left
            stackView.addArrangedSubview(titleLabel)
            
            let titleSeparator = UIView()
            titleSeparator.backgroundColor = UIColor.systemGray6
                titleSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
                stackView.addArrangedSubview(titleSeparator)

            // 🔽 Líneas de texto con separadores
            for (index, lineText) in lines.enumerated() {
                let lineLabel = UILabel()
                lineLabel.text = lineText
                lineLabel.font = UIFont.systemFont(ofSize: 14)
                lineLabel.textAlignment = .left
                stackView.addArrangedSubview(lineLabel)

                // Agregar línea divisoria, excepto después del último renglón
                if index < lines.count - 1 {
                    let separator = UIView()
                    separator.backgroundColor = UIColor.systemGray6
                    separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
                    stackView.addArrangedSubview(separator)
                }
                
            }
            
            // 🔘 Botón pequeño con "+"
            let addButton = UIButton(type: .system)
            addButton.setTitle("+", for: .normal)
            addButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            addButton.setTitleColor(.white, for: .normal)
            addButton.backgroundColor = .systemTeal
            addButton.layer.cornerRadius = 15  // Hace el botón redondo
            addButton.translatesAutoresizingMaskIntoConstraints = false

            button.addSubview(stackView)
            button.addSubview(addButton)

            // 📏 Constraints para que el texto se acomode dentro del botón
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10),
                stackView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -10),
                stackView.topAnchor.constraint(equalTo: button.topAnchor, constant: 10),
                stackView.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -10),
                
                addButton.widthAnchor.constraint(equalToConstant: 30),
                addButton.heightAnchor.constraint(equalToConstant: 30),
                addButton.centerXAnchor.constraint(equalTo: button.centerXAnchor),
                addButton.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -1.5)
            ])

            return button
        }

        // 📌 En tu `setupUI()`, reemplaza el ciclo for dentro de `verticalStack`:
        let buttonData: [(String, [String])] = [
            ("Zonas arqueológicas", ["Cenote azul", "Ek Balam", "Coba"," "]),
            ("Actividades extremas", ["Buceo en cavernas", "Tirolesa", "Rappel"," "]),
            ("Cultura", ["Museos", "Eventos culturales y festivales", "Visitas a pueblos mágicos"," "]),
            ("Transporte", ["Renta de auto", "Taxi", "Avión"," "]),
            ("Hospedaje", ["Coqui Coqui Tulum", "El Mesón del Marqués", "Costa Maya Inn"," "]),
            ("Tiendas", ["Plaza La Perla", "Mercado Artesanal de Mahahual", "Galería Tulum"," "]),
            ("Comida", ["La Habichuela", "Sale e Pepe", "El Naranjo"," "])
        ]

        // 🔄 Crear botones y agregarlos a `verticalStack`
        for (i, data) in buttonData.enumerated() {
            let buttonColor = buttonColors[i % buttonColors.count]
            let customButton = createCustomButton(title: data.0, lines: data.1, color: buttonColor)
            customButton.heightAnchor.constraint(equalToConstant: 160).isActive = true
            verticalStack.addArrangedSubview(customButton)
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

            if let image = UIImage(named: bottomBarIcons[i])?.withRenderingMode(.alwaysTemplate) {
                bottomButton.setImage(image, for: .normal)
                bottomButton.tintColor = .black // Color inicial
            }

            bottomButton.tag = i
            bottomButton.addTarget(self, action: #selector(bottomButtonTapped(_:)), for: .touchUpInside)
            bottomStack.addArrangedSubview(bottomButton)

            // Seleccionamos el primer botón por defecto
            if i == 0 {
                bottomButton.tintColor = .white
                selectedButton = bottomButton
            }
        }
    }

    @objc func bottomButtonTapped(_ sender: UIButton) {
        // Restaurar color de todos los botones
        selectedButton?.tintColor = .black

        // Marcar el botón tocado como seleccionado
        sender.tintColor = .white
        selectedButton = sender
        
        
    }
}


