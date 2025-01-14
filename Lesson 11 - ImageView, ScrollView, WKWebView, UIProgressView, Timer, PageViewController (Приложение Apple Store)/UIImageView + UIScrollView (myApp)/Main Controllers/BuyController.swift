//
//  ViewController.swift
//  UIImageView + UIScrollView (myApp)
//
//  Created by Alexandr Garkalin on 24.09.2024.
//

import UIKit

class BuyController: UIViewController {

    //MARK: - Объекты
    let infoText = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Реализация методов
        addTabBarItem()
        addInfoText()
        
    }

    //MARK: - Methods
    
    // создаем и настраиваем элемент tabBar
    func addTabBarItem() {
        let tabBarItem = UITabBarItem()
        tabBarItem.image = UIImage(systemName: "macbook.and.iphone")
        tabBarItem.title = "Купить"
        self.tabBarItem = tabBarItem
    }
    
    // добавляем текст, что страница находится в разработке
    func addInfoText() {
        infoText.frame = CGRect(x: 30, y: 400, width: 360, height: 50)
        infoText.text = "Данная страница находится в разработке"
        infoText.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        infoText.textColor = .white
        infoText.textAlignment = .center
        infoText.sizeToFit()
        view.addSubview(infoText)
    }
}

