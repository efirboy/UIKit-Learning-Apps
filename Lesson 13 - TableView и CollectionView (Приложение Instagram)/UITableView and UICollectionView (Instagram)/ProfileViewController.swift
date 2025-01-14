//
//  ProfileViewController.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 17.10.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Реализация методов
        addTabBarItem()
    }
    
    //MARK: - Methods
    
    // Настраиваем элемент tabBar
    private func addTabBarItem() {
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "unselectUser"), selectedImage: UIImage(named: "selectUser"))
        tabBarItem.imageInsets = UIEdgeInsets(top: 7, left: 0, bottom: 0, right: 0)
        self.tabBarItem = tabBarItem
    }
}
