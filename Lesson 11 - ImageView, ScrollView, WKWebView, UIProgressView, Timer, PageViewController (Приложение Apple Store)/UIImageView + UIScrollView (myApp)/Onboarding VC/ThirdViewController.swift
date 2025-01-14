//
//  ThirdViewController.swift
//  UIImageView + UIScrollView (myApp)
//
//  Created by Alexandr Garkalin on 08.10.2024.
//

import UIKit

final class ThirdViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        onboardingImageView.image = UIImage(named: "Onboarding3")
        titleLabel.text = "ДОСТАВКА"
        infoLabel.text = "Наслаждайтесь быстрым и удобным получением ваших заказов! Вы можете выбрать доставку на дом или забрать свои покупки в ближайшем пункте выдачи. Ваши желания — наш приоритет!"
    }
}
