//
//  ViewController.swift
//  Auto Layout (stackView)
//
//  Created by Alexandr Garkalin on 15.10.2024.
//

import UIKit

final class ViewController: UIViewController {

    private let redTrafficLightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    } ()
    
    private let yellowTrafficLightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    } ()
    
    private let greenTrafficLightView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    } ()
    
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackViewSetup()
        view.layoutIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        makeCircles()
    }
    
    // Настраиваем stackView
    private func stackViewSetup() {
        stackView.axis = .vertical
        stackView.alignment = .fill // выравнивание - элементы растягиваются
        stackView.distribution = .fillEqually // одинковый размер элементов
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .black
        stackView.addArrangedSubview(redTrafficLightView)
        stackView.addArrangedSubview(yellowTrafficLightView)
        stackView.addArrangedSubview(greenTrafficLightView)
        
        // устанавливаем отступы со всех сторон
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        
        view.addSubview(stackView)
        
        // констрейты для stackView
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: view.bounds.width / 3),
            stackView.heightAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 3),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    // Настраиваем внутренние элементы, делаем их круглыми
    private func makeCircles() {
        for element in stackView.arrangedSubviews {
            element.heightAnchor.constraint(equalTo: element.widthAnchor).isActive = true
            element.layer.cornerRadius = element.bounds.height / 2
            element.clipsToBounds = true
        }
    }
}

