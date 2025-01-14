//
//  SecondViewController.swift
//  Switch (CAFE)
//
//  Created by Alexandr Garkalin on 21.08.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    let labelNaming = UILabel()
    let labelFIO = UILabel()
    let textfieldFIO = UITextField()
    let labelGhosts = UILabel()
    let textfieldGhosts = UITextField()
    let labelNumberTable = UILabel()
    let textfieldNumberTable = UITextField()
    let labelBronedTable = UILabel()
    let labelPreOrder = UILabel()
    let labelVIPRoom = UILabel()
    let switchBronedTable = UISwitch()
    let switchPreOrder = UISwitch()
    let switchVIPRoom = UISwitch()
    let buttonCheck = UIButton()
    let plateImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addPlate()
        addLabelNaming()
        addLabelFIO()
        addTextFieldFIO()
        addLabelGhosts()
        addTextFieldGhosts()
        addLabelBronedTable()
        addLabelPreOrder()
        addLabelVIPRoom()
        addSwitchBronedTable()
        addSwitchPreOrder()
        addSwitchVIPRooms()
        addButtonCheck()
        isSwitch()
        
        // Создаем распознаватель жестов
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true) // Закрывает клавиатуру
    }
    
    func addLabelNaming() {
        labelNaming.frame = CGRect(x: 100, y: 50, width: 300, height: 100)
        labelNaming.text = " Food & Drink "
        labelNaming.font = UIFont(name: "Zapfino", size: 20)
        self.view.addSubview(labelNaming)
    }
    
    func addLabelFIO() {
        labelFIO.frame = CGRect(x: 30, y: 100, width: 100, height: 100)
        labelFIO.text = "ФИО"
        labelFIO.font = UIFont(name: "MuktaMahee-Bold", size: 16)
        labelFIO.textColor = UIColor.systemPink
        self.view.addSubview(labelFIO)
    }
    
    func addTextFieldFIO() {
        textfieldFIO.frame = CGRect(x: 30, y: 130, width: 350, height: 100)
        textfieldFIO.placeholder = "Введите ФИО"
        textfieldFIO.font = UIFont(name: "MuktaMahee-Bold", size: 20)
        textfieldFIO.autocorrectionType = .no
        self.view.addSubview(textfieldFIO)
    }
    
    func addLabelGhosts() {
        labelGhosts.frame = CGRect(x: 30, y: 200, width: 400, height: 100)
        labelGhosts.text = "Количество гостей"
        labelGhosts.font = UIFont(name: "MuktaMahee-Bold", size: 16)
        labelGhosts.textColor = UIColor.systemPink
        self.view.addSubview(labelGhosts)
    }
    
    func addTextFieldGhosts() {
        textfieldGhosts.frame = CGRect(x: 30, y: 230, width: 300, height: 100)
        textfieldGhosts.placeholder = "Введите количество"
        textfieldGhosts.font = UIFont(name: "MuktaMahee-Bold", size: 20)
        textfieldGhosts.autocorrectionType = .no
        self.view.addSubview(textfieldGhosts)
    }
    
    func addLabelNumberTable() {
        labelNumberTable.frame = CGRect(x: 30, y: 300, width: 400, height: 100)
        labelNumberTable.text = "Номер стола"
        labelNumberTable.font = UIFont(name: "MuktaMahee-Bold", size: 16)
        labelNumberTable.textColor = UIColor.systemPink
        self.view.addSubview(labelNumberTable)
    }
    
    func addTextFieldNumberTable() {
        textfieldNumberTable.frame = CGRect(x: 30, y: 330, width: 300, height: 100)
        textfieldNumberTable.placeholder = "Введите номер стола"
        textfieldNumberTable.font = UIFont(name: "MuktaMahee-Bold", size: 20)
        textfieldNumberTable.autocorrectionType = .no
        self.view.addSubview(textfieldNumberTable)
    }
    
    func addLabelBronedTable() {
        labelBronedTable.frame = CGRect(x: 50, y: 430, width: 400, height: 100)
        labelBronedTable.text = "Бронировать стол"
        labelBronedTable.font = UIFont(name: "MuktaMahee-Bold", size: 16)
        labelBronedTable.textColor = UIColor.systemPink
        self.view.addSubview(labelBronedTable)
    }
    
    func addLabelPreOrder() {
        labelPreOrder.frame = CGRect(x: 50, y: 500, width: 400, height: 100)
        labelPreOrder.text = "Предоплата?"
        labelPreOrder.font = UIFont(name: "MuktaMahee-Bold", size: 16)
        labelPreOrder.textColor = UIColor.systemPink
        self.view.addSubview(labelPreOrder)
    }
    
    func addLabelVIPRoom() {
        labelVIPRoom.frame = CGRect(x: 50, y: 570, width: 400, height: 100)
        labelVIPRoom.text = "VIP комната"
        labelVIPRoom.font = UIFont(name: "MuktaMahee-Bold", size: 16)
        labelVIPRoom.textColor = UIColor.systemPink
        self.view.addSubview(labelVIPRoom)
    }
    
    func addSwitchBronedTable() {
        switchBronedTable.frame = CGRect(x: 270, y: 465, width: 400, height: 100)
        self.view.addSubview(switchBronedTable)
        switchBronedTable.addTarget(self, action: #selector(switches(_:)), for: .valueChanged)
    }
    
    func addSwitchPreOrder() {
        switchPreOrder.frame = CGRect(x: 270, y: 535, width: 400, height: 100)
        self.view.addSubview(switchPreOrder)
    }
    
    func addSwitchVIPRooms() {
        switchVIPRoom.frame = CGRect(x: 270, y: 605, width: 400, height: 100)
        self.view.addSubview(switchVIPRoom)
        switchVIPRoom.isEnabled = false
    }
    
    func addButtonCheck() {
        buttonCheck.frame = CGRect(x: 50, y: 700, width: 300, height: 50)
        buttonCheck.setTitle("Выставить счёт", for: .normal)
        buttonCheck.setTitleColor(.white, for: .normal)
        buttonCheck.backgroundColor = .systemPink
        buttonCheck.titleLabel?.font = UIFont(name: "MuktaMahee-Bold", size: 18)
        buttonCheck.layer.cornerRadius = 15
        buttonCheck.clipsToBounds = true
        buttonCheck.addTarget(self, action: #selector(buttonCheckTapped), for: .touchUpInside)
        self.view.addSubview(buttonCheck)
    }
    
    func addPlate() {
        plateImageView.frame = CGRect(x: 250, y: 200, width: 200, height: 200)
        plateImageView.image = UIImage(named: "tarelka")
        plateImageView.clipsToBounds = true
        self.view.addSubview(plateImageView)
    }
    
    func isSwitch() {
        switchBronedTable.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
    }
    
    @objc func switchChanged(_ sender: UISwitch) {
        labelNumberTable.isHidden = !sender.isOn
        textfieldNumberTable.isHidden = !sender.isOn
        if sender.isOn {
            addLabelNumberTable()
            addTextFieldNumberTable()
        }
    }
    
    @objc func switches(_ sender: UISwitch) {
        if sender.isOn {
            switchVIPRoom.isEnabled = true
        } else {
            switchVIPRoom.isOn = false
            switchVIPRoom.isEnabled = false
        }
    }
    
    @objc func buttonCheckTapped() {
        let alert = UIAlertController(title: "Выставить чек?", message: nil, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "Да", style: .default) { (actionOK) in
            var flag = true
            var text3: String? = nil
            if self.switchBronedTable.isOn {
                text3 = self.textfieldNumberTable.text
            } else {
                text3 = nil
            }
            
            if text3 == nil {
                flag = false
            } else {
                if let itogText3 = text3 {
                    if !itogText3.isEmpty, let texttPr3 = Int(itogText3) {
                        flag = false} else {
                            flag = true
                    }
                }
            }
            
            guard let text = self.textfieldFIO.text, let text2 = self.textfieldGhosts.text, !text.isEmpty, !text2.isEmpty, let textPr2 = Int(text2), !text.contains("0"), !text.contains("1"), !text.contains("2"), !text.contains("3"), !text.contains("4"), !text.contains("5"), !text.contains("6"), !text.contains("7"), !text.contains("8"), !text.contains("9"), flag == false
            else {
                let alertWarning = UIAlertController(title: "Заполните регистрационные данные корректно", message: nil, preferredStyle: .alert)
                let actionOK = UIAlertAction(title: "OK", style: .default)
                alertWarning.addAction(actionOK)
                self.present(alertWarning, animated: true)
                return
            }
            let thirdViewController = ThirdViewController()
            thirdViewController.ghostsText = self.textfieldGhosts.text
            thirdViewController.isBronedTable = self.switchBronedTable.isOn
            thirdViewController.isPreOrder = self.switchPreOrder.isOn
            thirdViewController.isVIPRoom = self.switchVIPRoom.isOn
            thirdViewController.userName = self.textfieldFIO.text
            self.navigationController?.pushViewController(thirdViewController, animated: true)
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(actionOK)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
}
