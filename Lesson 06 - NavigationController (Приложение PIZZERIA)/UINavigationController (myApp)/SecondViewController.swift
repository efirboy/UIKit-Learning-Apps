//
//  SecondViewController.swift
//  UINavigationController (myApp)
//
//  Created by Alexandr Garkalin on 05.09.2024.
//

import UIKit

class SecondViewController: UIViewController {

    let imagePizza = UIImageView()
    let buttonPizza = UIButton()
    let imageSushi = UIImageView()
    let buttonSushi = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Food"
        
        // Настройка внешнего вида навигационной панели
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() // // В зависимости от потребностей можно использовать прозрачный фон
        appearance.backgroundColor = UIColor.systemGray6
        
        // установка стиля заголовка
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        // применение настроек к текущему navigationController
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // Скрываем кнопку возвращения на первый контроллер(экран авторизации)
        navigationItem.hidesBackButton = true
        
        // установка фона
        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "backgroundImage")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        // убираем надпись Back с NavigationTabBar
        navigationItem.backButtonDisplayMode = .minimal
        
        // реализация методов
        addImagePizza()
        addButtonPizza()
        addImageSushi()
        addButtonSushi() // Кнопка Суши неактивна (нет перехода) согласно ДЗ Swift Developers
    }
    
    //MARK: - Methods
    
    func addImagePizza() {
        imagePizza.frame = CGRect(x: 20, y: 195, width: 350, height: 200)
        imagePizza.image = UIImage(named: "pizza")
        imagePizza.layer.cornerRadius = 12
        imagePizza.layer.masksToBounds = true
        view.addSubview(imagePizza)
    }
    
    func addButtonPizza() {
        buttonPizza.frame = CGRect(x: 20, y: 195, width: 350, height: 200)
        buttonPizza.setTitle("Пицца", for: .normal)
        buttonPizza.layer.cornerRadius = 12
        buttonPizza.backgroundColor = .clear
        buttonPizza.setTitleColor(UIColor.white, for: .normal)
        buttonPizza.titleLabel?.font = UIFont(name: "Cochin-Bold", size: 36)
        view.addSubview(buttonPizza)
        buttonPizza.addTarget(self, action: #selector(buttonPizzaTapped), for: .touchUpInside)
    }
    
    @objc func buttonPizzaTapped() {
        let thirdVC = ThirdViewController()
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    func addImageSushi() {
        imageSushi.frame = CGRect(x: 20, y: 415, width: 350, height: 200)
        imageSushi.image = UIImage(named: "sushi")
        imageSushi.layer.cornerRadius = 12
        imageSushi.layer.masksToBounds = true
        view.addSubview(imageSushi)
    }
    
    func addButtonSushi() {
        buttonSushi.frame = CGRect(x: 20, y: 415, width: 350, height: 200)
        buttonSushi.setTitle("                 Суши", for: .normal)
        buttonSushi.layer.cornerRadius = 12
        buttonSushi.backgroundColor = .clear
        buttonSushi.setTitleColor(UIColor.white, for: .normal)
        buttonSushi.titleLabel?.font = UIFont(name: "Cochin-Bold", size: 36)
        view.addSubview(buttonSushi)
    }
}
