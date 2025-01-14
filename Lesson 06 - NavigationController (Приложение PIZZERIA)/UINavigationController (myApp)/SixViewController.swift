//
//  SixViewController.swift
//  UINavigationController (myApp)
//
//  Created by Alexandr Garkalin on 06.09.2024.
//

import UIKit

class SixViewController: UIViewController {

    var name: String = ""
    let labelName = UILabel()
    let labelInformation = UILabel()
    let labelInfo = UILabel()
    let labelCCal = UILabel()
    let labelCcalInfo = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "pizzaBackground")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)

        // реализация методов
        addLabelName()
        addLabelInformation()
        addLabelInfo()
        addLabelCCal()
        addLabelCCalInfo()
    }
    

    func addLabelName() {
        labelName.frame = CGRect(x: 50, y: 30, width: 300, height: 50)
        labelName.text = name
        labelName.textAlignment = .center
        labelName.font = UIFont(name: "Cochin-Bold", size: 42)
        view.addSubview(labelName)
    }
    
    func addLabelInformation() {
        labelInformation.frame = CGRect(x: 0, y: 100, width: 400, height: 50)
        labelInformation.text = "Состав"
        labelInformation.textAlignment = .center
        labelInformation.font = UIFont(name: "Cochin-Bold", size: 24)
        labelInformation.backgroundColor = .systemRed
        labelInformation.layer.cornerRadius = 12
        labelInformation.textColor = .white
        view.addSubview(labelInformation)
    }
    
    func addLabelInfo() {
        labelInfo.frame = CGRect(x: 20, y: 180, width: 400, height: 300)
        if labelName.text == "Пепперони" {
            labelInfo.text = "• Тесто \n• томатный соус \n• сыр моцарелла \n• колбаса пепперони \n• орегано"
        } else if labelName.text == "Маргарита" {
            labelInfo.text = "• Тесто \n• томатный соус \n• сыр моцарелла \n• помидоры \n• базилик"
        }
        labelInfo.textAlignment = .left
        labelInfo.font = UIFont(name: "Cochin-Bold", size: 24)
        labelInfo.numberOfLines = 0
        labelInfo.sizeToFit()
        view.addSubview(labelInfo)
    }
    
    func addLabelCCal() {
        labelCCal.frame = CGRect(x: 0, y: 350, width: 400, height: 50)
        labelCCal.text = "Калорийность (на 100 грамм)"
        labelCCal.textAlignment = .center
        labelCCal.font = UIFont(name: "Cochin-Bold", size: 24)
        labelCCal.backgroundColor = .systemRed
        labelCCal.layer.cornerRadius = 12
        labelCCal.textColor = .white
        view.addSubview(labelCCal)
    }
    
    func addLabelCCalInfo() {
        labelCcalInfo.frame = CGRect(x: 20, y: 430, width: 400, height: 300)
        if labelName.text == "Пепперони" {
            labelCcalInfo.text = "• Белки: 10 грамм \n• Жиры: 9 грамм \n• Углеводы: 26 грамм \n• Калорийность: 230 ккал"
        } else if labelName.text == "Маргарита" {
            labelCcalInfo.text = "• Белки: 12 грамм \n• Жиры: 13 грамм \n• Углеводы: 24 грамм \n• Калорийность: 271 ккал"
        }
        labelCcalInfo.textAlignment = .left
        labelCcalInfo.font = UIFont(name: "Cochin-Bold", size: 24)
        labelCcalInfo.numberOfLines = 0
        labelCcalInfo.sizeToFit()
        view.addSubview(labelCcalInfo)
    }
}
