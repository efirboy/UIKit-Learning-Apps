//
//  SecondViewController.swift
//  UIImageView + UIScrollView (myApp)
//
//  Created by Alexandr Garkalin on 08.10.2024.
//

import UIKit

final class SecondViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingImageView.image = UIImage(named: "Onboarding2")
        titleLabel.text = "ОПЛАТА"
        infoLabel.text = "Мы предлагаем различные способы оплаты, чтобы вы могли выбрать наиболее удобный для вас. Безопасные и быстрые транзакции гарантируют защиту ваших данных."
        
    }
}
