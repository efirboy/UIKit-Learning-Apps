//
//  ThirdViewController.swift
//  Switch (CAFE)
//
//  Created by Alexandr Garkalin on 21.08.2024.
//

import UIKit

class ThirdViewController: UIViewController {

    var userName: String?
    var ghostsText: String?
    var isBronedTable: Bool = false
    var isPreOrder: Bool = false
    var isVIPRoom: Bool = false
    
    let labelNaming = UILabel()
    let labelCheck = UILabel()
    let labelProductNameOne = UILabel()
    let labelProductNameOneIngridients = UILabel()
    let labelProductNameTwo = UILabel()
    let labelProductNameTwoIngridients = UILabel()
    let horizontLine = UIView()
    let horizontLine2 = UIView()
    let labelPriceOne = UILabel()
    let labelPriceTwo = UILabel()
    let labelSumOne = UILabel()
    let labelSumTwo = UILabel()
    let labelRouble = UILabel()
    let labelRouble2 = UILabel()
    let buttomSum = UIButton()
    let labelRentTable = UILabel()
    let horizontLine3 = UIView()
    let labelSumTabel = UILabel()
    let labelRouble3 = UILabel()
    let labelRentVIP = UILabel()
    let horizontLine4 = UIView()
    let labelSumVIP = UILabel()
    let labelRouble4 = UILabel()
    let labelTextPreOrder = UILabel()
    
    var ghostsInt: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addLabelNaming()
        addLabelCheck()
        addLabelProductNameOne()
        addlabelProductNameOneIngridients()
        addHorizontalLine()
        addLabelProductNameTwo()
        addLabelProductTwoIngridient()
        addhorizontalLine2()
        addSumOne()
        addLabelRouble()
        addSumTwo()
        addLabelRouble2()
        addButtonPay()
            if isBronedTable == true {
                addRentTable()
            }
            if isVIPRoom == true {
                addVIPRoom()
            }
        if isPreOrder == true {
            addTextPreOrder()
        }
    }
    
    func addLabelNaming() {
        labelNaming.frame = CGRect(x: 100, y: 50, width: 300, height: 100)
        labelNaming.text = " Food & Drink "
        labelNaming.font = UIFont(name: "Zapfino", size: 20)
        self.view.addSubview(labelNaming)
    }
    
    func addLabelCheck() {
        labelCheck.frame = CGRect(x: 180, y: 100, width: 300, height: 100)
        labelCheck.text = "ЧЕК"
        labelCheck.font = UIFont(name: "Impact", size: 26)
        self.view.addSubview(labelCheck)
    }
    
    func addLabelProductNameOne() {
        labelProductNameOne.frame = CGRect(x: 20, y: 150, width: 300, height: 100)
        labelProductNameOne.text = "Салат Цезарь"
        labelProductNameOne.font = UIFont(name: "MuktaMahee-Bold", size: 16)
        self.view.addSubview(labelProductNameOne)
    }
    
    func addlabelProductNameOneIngridients() {
        labelProductNameOneIngridients.frame = CGRect(x: 20, y: 165, width: 500, height: 100)
        labelProductNameOneIngridients.text = "Помидор, салат айсберг, сухарики, курица"
        labelProductNameOneIngridients.font = UIFont(name: "MuktaMahee-Bold", size: 12)
        labelProductNameOneIngridients.textColor = .lightGray
        self.view.addSubview(labelProductNameOneIngridients)
    }
    
    func addHorizontalLine() {
        horizontLine.frame = CGRect(x: 20, y: 240, width: 1000, height: 2)
        horizontLine.backgroundColor = UIColor.gray
        self.view.addSubview(horizontLine)
        
    }
    
    func addLabelProductNameTwo() {
        labelProductNameTwo.frame = CGRect(x: 20, y: 270, width: 300, height: 100)
        labelProductNameTwo.text = "Салат Греческий"
        labelProductNameTwo.font = UIFont(name: "MuktaMahee-Bold", size: 16)
        self.view.addSubview(labelProductNameTwo)
    }
    
    func addLabelProductTwoIngridient() {
        labelProductNameTwoIngridients.frame = CGRect(x: 20, y: 285, width: 500, height: 100)
        labelProductNameTwoIngridients.text = "Помидор, огурцы, сыр фета, маслины"
        labelProductNameTwoIngridients.font = UIFont(name: "MuktaMahee-Bold", size: 12)
        labelProductNameTwoIngridients.textColor = .lightGray
        self.view.addSubview(labelProductNameTwoIngridients)
    }
    
    func addhorizontalLine2() {
        horizontLine2.frame = CGRect(x: 20, y: 350, width: 1000, height: 2)
        horizontLine2.backgroundColor = UIColor.gray
        self.view.addSubview(horizontLine2)
    }
    
    func addSumOne() {
        ghostsInt = Int(ghostsText!)!
        labelSumOne.frame = CGRect(x: 320, y: 140, width: 300, height: 100)
        labelSumOne.text = "\(ghostsInt * 300)"
        labelSumOne.font = UIFont(name: "MuktaMahee-Bold", size: 18)
        labelSumOne.textColor = .lightGray
        self.view.addSubview(labelSumOne)
    }
    
    func addLabelRouble() {
        labelRouble.frame = CGRect(x: 370, y: 140, width: 300, height: 100)
        labelRouble.text = "₽"
        labelRouble.font = UIFont(name: "MuktaMahee-Bold", size: 18)
        self.view.addSubview(labelRouble)
    }
    
    func addSumTwo() {
        ghostsInt = Int(ghostsText!)!
        labelSumTwo.frame = CGRect(x: 320, y: 280, width: 300, height: 100)
        labelSumTwo.text = "\(ghostsInt * 400)"
        labelSumTwo.font = UIFont(name: "MuktaMahee-Bold", size: 18)
        labelSumTwo.textColor = .lightGray
        self.view.addSubview(labelSumTwo)
    }
    
    func addLabelRouble2() {
        labelRouble2.frame = CGRect(x: 370, y: 280, width: 300, height: 100)
        labelRouble2.text = "₽"
        labelRouble2.font = UIFont(name: "MuktaMahee-Bold", size: 18)
        self.view.addSubview(labelRouble2)
    }
    
    func addButtonPay() {
        var sum2 = 0
        let sum = Int(labelSumOne.text!)! + Int(labelSumTwo.text!)!
        if isBronedTable == true, isVIPRoom == false {
            sum2 = 500
        } else if isBronedTable == true, isVIPRoom == true {
            sum2 = 1500
        }
        var itog: Int {
            if isPreOrder == true {
                return (sum + sum2) / 2
            } else {
                return sum + sum2
            }
        }
        buttomSum.frame = CGRect(x: 150, y: 700, width: 200, height: 50)
        buttomSum.setTitle("Итого: \(itog) ₽ ", for: .normal)
        buttomSum.backgroundColor = .systemPink
        buttomSum.titleLabel?.font = UIFont(name: "MuktaMahee-Bold", size: 18)
        buttomSum.layer.cornerRadius = 15
        buttomSum.clipsToBounds = true
        buttomSum.addTarget(self, action: #selector(touchedItogo), for: .touchUpInside)
        self.view.addSubview(buttomSum)
    }
    
    @objc func touchedItogo() {
        let alert = UIAlertController(title: "Оплатить", message: nil, preferredStyle: .alert)
        let actionApplePay = UIAlertAction(title: "Apple Pay", style: .default) { (actionApplePay) in
            let alert = UIAlertController(title: "Спасибо \(self.userName!)!", message: "Ваш заказ зарезервирован", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "Спасибо!", style: .default)
            alert.addAction(actionOK)
            self.present(alert, animated: true)
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(actionApplePay)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    
    func addRentTable() {
        labelRentTable.frame = CGRect(x: 20, y: 380, width: 300, height: 100)
        labelRentTable.text = "Аренда стола"
        labelRentTable.font = UIFont(name: "MuktaMahee-Bold", size: 16)
        self.view.addSubview(labelRentTable)
        horizontLine3.frame = CGRect(x: 20, y: 455, width: 1000, height: 2)
        horizontLine3.backgroundColor = UIColor.gray
        self.view.addSubview(horizontLine3)
        labelSumTabel.frame = CGRect(x: 320, y: 380, width: 300, height: 100)
        labelSumTabel.text = "500"
        labelSumTabel.font = UIFont(name: "MuktaMahee-Bold", size: 18)
        labelSumTabel.textColor = .lightGray
        self.view.addSubview(labelSumTabel)
        labelRouble3.frame = CGRect(x: 370, y: 380, width: 300, height: 100)
        labelRouble3.text = "₽"
        labelRouble3.font = UIFont(name: "MuktaMahee-Bold", size: 18)
        self.view.addSubview(labelRouble3)
    }
    
    func addVIPRoom() {
        labelRentVIP.frame = CGRect(x: 20, y: 485, width: 300, height: 100)
        labelRentVIP.text = "Аренда VIP-комнаты"
        labelRentVIP.font = UIFont(name: "MuktaMahee-Bold", size: 16)
        self.view.addSubview(labelRentVIP)
        horizontLine4.frame = CGRect(x: 20, y: 560, width: 1000, height: 2)
        horizontLine4.backgroundColor = UIColor.gray
        self.view.addSubview(horizontLine4)
        labelSumVIP.frame = CGRect(x: 320, y: 485, width: 300, height: 100)
        labelSumVIP.text = "1000"
        labelSumVIP.font = UIFont(name: "MuktaMahee-Bold", size: 18)
        labelSumVIP.textColor = .lightGray
        self.view.addSubview(labelSumVIP)
        labelRouble4.frame = CGRect(x: 370, y: 485, width: 300, height: 100)
        labelRouble4.text = "₽"
        labelRouble4.font = UIFont(name: "MuktaMahee-Bold", size: 18)
        self.view.addSubview(labelRouble4)
    }
    
    func addTextPreOrder() {
        labelTextPreOrder.frame = CGRect(x: 50, y: 600, width: 300, height: 120)
        labelTextPreOrder.text = "Вы выбрали предоплату, поэтому сейчас платите половину суммы"
        labelTextPreOrder.textAlignment = .center
        labelTextPreOrder.numberOfLines = 0
        labelTextPreOrder.textColor = .red
        labelTextPreOrder.font = UIFont(name: "MuktaMahee-Bold", size: 16)
        self.view.addSubview(labelTextPreOrder)
    }
}
   

