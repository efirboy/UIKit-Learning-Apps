//
//  SecondViewController.swift
//  UILabel(my app)
//
//  Created by Alexandr Garkalin on 12.09.2024.
//

import UIKit

class SecondViewController: UIViewController {

    var firstVC: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // реализация методов
        addTabBarItem()
        addRightButton()
        
    }
    
    //MARK: - Methods
    
    func addTabBarItem() {
        let tabBarItem = UITabBarItem()
        tabBarItem.image = UIImage(systemName: "gearshape.fill")
        tabBarItem.title = "Настройки"
        self.tabBarItem = tabBarItem
    }
    
    func addRightButton() {
        let rightButton = UIBarButtonItem(title: "Добавить текст", style: .plain, target: self, action: #selector(rightButtonTapped))
        rightButton.tintColor = .systemOrange
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func rightButtonTapped() {
        let alert = UIAlertController(title: "Введите текст", message: nil, preferredStyle: .alert)
        alert.addTextField()
        let actionOK = UIAlertAction(title: "ОК", style: .default) { [weak self] _ in
            self?.firstVC?.tekst = alert.textFields![0].text
            self?.firstVC?.addMyLabel()
            
        }
        alert.addAction(actionOK)
        present(alert, animated: true)
        
    }
}
