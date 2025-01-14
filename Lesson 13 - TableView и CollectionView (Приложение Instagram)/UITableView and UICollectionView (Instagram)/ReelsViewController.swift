//
//  ReelsViewController.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 17.10.2024.
//

import UIKit

final class ReelsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Реализация методов
        addTabBarItem()
    }
    
    //MARK: - Methods
    
    // Настраиваем элемент tabBar
    private func addTabBarItem() {
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "unselectReels"), selectedImage: UIImage(named: "selectReels"))
        tabBarItem.imageInsets = UIEdgeInsets(top: 7, left: 0, bottom: 0, right: 0)
        self.tabBarItem = tabBarItem
    }
}
