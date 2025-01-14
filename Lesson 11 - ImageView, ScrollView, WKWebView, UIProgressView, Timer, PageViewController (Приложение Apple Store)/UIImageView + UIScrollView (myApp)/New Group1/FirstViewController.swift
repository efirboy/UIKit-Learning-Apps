//
//  FirstViewController.swift
//  UIImageView + UIScrollView (myApp)
//
//  Created by Alexandr Garkalin on 08.10.2024.
//

import UIKit

final class FirstViewController: BaseViewController {

    //MARK: - Objects
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // реализация методов
        onboardingImageView.image = UIImage(named: "Onboarding1")
        titleLabel.text = "ЗАКАЗ"
        infoLabel.text = "Наше приложение позволяет заказывать необходимые Вам товары всего в несколько нажатий. Выберите то, что вам нужно, и добавьте в корзину — всё просто!"
    }
}
