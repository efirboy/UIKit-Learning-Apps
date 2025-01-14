//
//  ViewController.swift
//  UITextView(myApp)
//
//  Created by Alexandr Garkalin on 17.09.2024.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Объекты
    
    let petCemetryButton = UIButton()
    let petCemetryLabel = UILabel()
    let shineButton = UIButton()
    let shineLabel = UILabel()
    let miseryButton = UIButton()
    let miseryLabel = UILabel()
    let longWalkButton = UIButton()
    let longWalkLabel = UILabel()
    
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Библиотека"
        
        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "backgroundImage")
        
        // Устанавливаем режим отображения, чтобы изображение заполнило весь экран
        backgroundImage.contentMode = .scaleAspectFill
        
        // Добавляем UIImageView как подвид (subview) перед добавлением других view
        self.view.addSubview(backgroundImage)
        
        // Перемещаем backgroundImageView на задний план
        self.view.sendSubviewToBack(backgroundImage)
        
        // Реализация методов
        addPetCemetryButton()
        addPetCemetryLabel()
        addShineButton()
        addShineLabel()
        addMiseryButton()
        addMiseryLabel()
        addLongWalkButton()
        addLongWalkLabel()
    }
    
    //MARK: - Methods
    
    func addPetCemetryButton() {
        petCemetryButton.frame = CGRect(x: 20, y: 110, width: 165, height: 250)
        petCemetryButton.setImage(UIImage(named: "petCemetry"), for: .normal)
        view.addSubview(petCemetryButton)
        petCemetryButton.addTarget(self, action: #selector(petCemetryButtonTapped), for: .touchUpInside)
    }
    
    @objc func petCemetryButtonTapped() {
        let petCemetryVC = PetCemetery()
        petCemetryVC.nameBook = "Кладбище домашних животных"
        petCemetryVC.modalPresentationStyle = .fullScreen
        UIView.transition(with: navigationController!.view, duration: 0.3, options: .transitionCrossDissolve) {
            self.navigationController?.pushViewController(petCemetryVC, animated: false)
        }
    }
    
    func addPetCemetryLabel() {
        petCemetryLabel.frame = CGRect(x: 20, y: 365, width: 165, height: 50)
        petCemetryLabel.text = "С. Кинг: Кладбище домашних животных"
        petCemetryLabel.font = UIFont.systemFont(ofSize: 12)
        petCemetryLabel.numberOfLines = 0
        petCemetryLabel.lineBreakMode = .byWordWrapping
        petCemetryLabel.sizeToFit()
        view.addSubview(petCemetryLabel)
    }
    
    func addShineButton() {
        shineButton.frame = CGRect(x: 205, y: 110, width: 165, height: 250)
        shineButton.setImage(UIImage(named: "shine"), for: .normal)
        view.addSubview(shineButton)
        shineButton.addTarget(self, action: #selector(shineButtonTapped), for: .touchUpInside)
    }
    
    @objc func shineButtonTapped() {
        let shineVC = Shine()
        shineVC.nameBook = "Сияние"
        shineVC.modalPresentationStyle = .fullScreen
        UIView.transition(with: navigationController!.view, duration: 0.3, options: .transitionCrossDissolve) {
            self.navigationController?.pushViewController(shineVC, animated: false)
        }
    }
    
    func addShineLabel() {
        shineLabel.frame = CGRect(x: 205, y: 365, width: 165, height: 50)
        shineLabel.text = "С. Кинг: Сияние"
        shineLabel.font = UIFont.systemFont(ofSize: 12)
        shineLabel.numberOfLines = 0
        shineLabel.lineBreakMode = .byWordWrapping
        shineLabel.sizeToFit()
        view.addSubview(shineLabel)
    }
    
    func addMiseryButton() {
        miseryButton.frame = CGRect(x: 20, y: 410, width: 165, height: 250)
        miseryButton.setImage(UIImage(named: "misery"), for: .normal)
        view.addSubview(miseryButton)
        miseryButton.addTarget(self, action: #selector(miseryButtonTapped), for: .touchUpInside)
    }
    
    @objc func miseryButtonTapped() {
        let miseryVC = Misery()
        miseryVC.nameBook = "Мизери"
        miseryVC.modalPresentationStyle = .fullScreen
        UIView.transition(with: navigationController!.view, duration: 0.3, options: .transitionCrossDissolve) {
            self.navigationController?.pushViewController(miseryVC, animated: false)
        }
    }
    
    func addMiseryLabel() {
        miseryLabel.frame = CGRect(x: 20, y: 665, width: 165, height: 50)
        miseryLabel.text = "С. Кинг: Мизери"
        miseryLabel.font = UIFont.systemFont(ofSize: 12)
        miseryLabel.numberOfLines = 0
        miseryLabel.lineBreakMode = .byWordWrapping
        miseryLabel.sizeToFit()
        view.addSubview(miseryLabel)
    }
    
    func addLongWalkButton() {
        longWalkButton.frame = CGRect(x: 205, y: 410, width: 165, height: 250)
        longWalkButton.setImage(UIImage(named: "longWalk"), for: .normal)
        view.addSubview(longWalkButton)
        longWalkButton.addTarget(self, action: #selector(longWalkButtonTapped), for: .touchUpInside)
    }
    
    @objc func longWalkButtonTapped() {
        let longWalkVC = LongWalk()
        longWalkVC.nameBook = "Долгая прогулка"
        longWalkVC.modalPresentationStyle = .fullScreen
        UIView.transition(with: navigationController!.view, duration: 0.3, options: .transitionCrossDissolve) {
            self.navigationController?.pushViewController(longWalkVC, animated: false)
        }
    }
    
    func addLongWalkLabel() {
        longWalkLabel.frame = CGRect(x: 205, y: 665, width: 165, height: 50)
        longWalkLabel.text = "С. Кинг: Долгая прогулка"
        longWalkLabel.font = UIFont.systemFont(ofSize: 12)
        longWalkLabel.numberOfLines = 0
        longWalkLabel.lineBreakMode = .byWordWrapping
        longWalkLabel.sizeToFit()
        view.addSubview(longWalkLabel)
    }
}

