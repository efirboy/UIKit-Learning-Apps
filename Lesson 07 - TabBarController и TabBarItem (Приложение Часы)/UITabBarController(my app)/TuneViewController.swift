//
//  TuneViewController.swift
//  UITabBarController(my app)
//
//  Created by Alexandr Garkalin on 10.09.2024.
//

import UIKit

class TuneViewController: UIViewController {

    let buttonCancel = UIButton()
    let bedView = UIImageView()
    let labelInfo = UILabel()
    let labelInfo2 = UILabel()
    let buttonHealth = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)

        // реализация методов
        addButtonCancel()
        addBedView()
        addLabelInfo()
        addLabelInfo2()
        addButtonHealth()
        
    }
    
    func addButtonCancel() {
        buttonCancel.frame = CGRect(x: 10, y: 10, width: 100, height: 50)
        buttonCancel.setTitle("Отменить", for: .normal)
        buttonCancel.setTitleColor(.systemOrange, for: .normal)
        buttonCancel.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(buttonCancel)
        buttonCancel.addTarget(self, action: #selector(buttonCancelTapped), for: .touchUpInside)
    }
    
    @objc func buttonCancelTapped() {
        dismiss(animated: true)
    }
    
    func addBedView() {
        bedView.frame = CGRect(x: 120, y: 50, width: 150, height: 100)
        bedView.image = UIImage(named: "view")
        view.addSubview(bedView)
    }
    
    func addLabelInfo() {
        labelInfo.frame = CGRect(x: 70, y: 120, width: 250, height: 180)
        labelInfo.text = "Функция ‎«Сон» теперь доступна в Здоровье"
        labelInfo.textColor = .white
        labelInfo.textAlignment = .center
        labelInfo.font = UIFont.systemFont(ofSize: 29, weight: .bold)
        labelInfo.numberOfLines = 0
        view.addSubview(labelInfo)
    }
    
    func addLabelInfo2() {
        labelInfo2.frame = CGRect(x: 70, y: 300, width: 250, height: 180)
        labelInfo2.text = "Настроив новое расписание сна, Вы сможете изменять настройки будильника в приложении «Часы». \n\n Можно также настроить цель по длительности сна, действия в период отдыха и другие параметры."
        labelInfo2.textColor = .white
        labelInfo2.textAlignment = .center
        labelInfo2.font = UIFont.systemFont(ofSize: 16)
        labelInfo2.numberOfLines = 0
        labelInfo2.minimumScaleFactor = 0.5
        view.addSubview(labelInfo2)
    }
    
    func addButtonHealth() {
        buttonHealth.frame = CGRect(x: 15, y: 670, width: 365, height: 45)
        buttonHealth.setTitle("Настроить в Здоровье", for: .normal)
        buttonHealth.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        buttonHealth.setTitleColor(.white, for: .normal)
        buttonHealth.backgroundColor = .systemOrange
        buttonHealth.layer.cornerRadius = 10
        view.addSubview(buttonHealth)
        buttonHealth.addTarget(self, action: #selector(buttonHealthTapped), for: .touchUpInside)
    }
    
    @objc func buttonHealthTapped() {
        // вызывваем приложение Здоровье
        // URL-схема для раздела "Сон" в приложении "Здоровье"
            if let healthSleepURL = URL(string: "x-apple-health://sleep") {
                if UIApplication.shared.canOpenURL(healthSleepURL) {
                    // Открываем приложение "Здоровье" на странице "Сон"
                    UIApplication.shared.open(healthSleepURL, options: [:], completionHandler: nil)
                } else {
                    print("Приложение Здоровье недоступно.")
                }
            }
    }
}
