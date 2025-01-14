//
//  BaseViewController.swift
//  UIImageView + UIScrollView (myApp)
//
//  Created by Alexandr Garkalin on 09.10.2024.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK: - Objects
    let onboardingImageView = UIImageView()
    let titleLabel = UILabel()
    let infoLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // реализация методов
        addOnboardingImageView()
        addtTitleLabel()
        addInfoLabel()
        
    }
    
    // Вызываем анимации после того, как представление стало видимым
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateImageView()
        animateTitleLabel()
        animateInfoLabel()
    }
    
    //MARK: - Methods
    
    // Добавляем картинку
    func addOnboardingImageView() {
        onboardingImageView.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        onboardingImageView.alpha = 0
        view.addSubview(onboardingImageView)
    }
    
    // Функция анимации появления картинки
    func animateImageView() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            self.onboardingImageView.alpha = 1
            self.onboardingImageView.frame.origin = CGPoint(x: 50, y: 100)
        })
    }
    
    // Добавляем название текущего экрана
    func addtTitleLabel() {
        titleLabel.frame = CGRect(x: view.frame.width, y: 500, width: 200, height: 100)
        titleLabel.font = UIFont(name: "Georgia-Bold", size: 28)
        titleLabel.textAlignment = .center
        titleLabel.alpha = 0
        titleLabel.textColor = #colorLiteral(red: 0, green: 0.4972938895, blue: 0.6069428921, alpha: 1) //#colorLiteral(red: , green: , blue: , alpha: )
        view.addSubview(titleLabel)
    }
    
    // Функция анимации появления названия текущего экрана
    func animateTitleLabel() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
            self.titleLabel.frame.origin = CGPoint(x: 100, y: 500)
            self.titleLabel.alpha = 1
        })
    }
    
    // Добавляем информацию о текущем экране
    func addInfoLabel() {
        infoLabel.frame = CGRect(x: 40, y: 580, width: 300, height: 150)
        infoLabel.font = UIFont(name: "Cochin", size: 18)
        infoLabel.textAlignment = .justified
        infoLabel.numberOfLines = 0
        infoLabel.alpha = 0
        infoLabel.textColor = #colorLiteral(red: 0, green: 0.4972938895, blue: 0.6069428921, alpha: 1) //#colorLiteral(red: , green: , blue: , alpha: )
        view.addSubview(infoLabel)
    }
    
    // Функция анимации появления информации о текущем экране
    func animateInfoLabel() {
        UIView.animate(withDuration: 1.0, delay: 0.3, options: .curveEaseIn, animations: {
            self.infoLabel.alpha = 1
        })
    }
}
