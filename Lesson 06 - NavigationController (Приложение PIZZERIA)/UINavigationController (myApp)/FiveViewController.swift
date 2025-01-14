//
//  FiveViewController.swift
//  UINavigationController (myApp)
//
//  Created by Alexandr Garkalin on 06.09.2024.
//

import UIKit

class FiveViewController: UIViewController {

    var name: String?
    var imageView = UIImage()
    var flagCheese = false
    var flagHam = false
    var flagMushrooms = false
    var flagOlives = false
    let labelOrder = UILabel()
    let imagePizzaOrder = UIImageView()
    let labelName = UILabel()
    let labelIngridients = UILabel()
    let labelPrice = UILabel()
    let labelPayCard = UILabel()
    let switchPayCard = UISwitch()
    let labelPayCush = UILabel()
    let switchPayCush = UISwitch()
    let buttonPay = UIButton()
    let labelReview = UILabel()
    let textFieldReview = UITextField()
    var ingridients: [String] = []
    var sumResult: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Оплата"

        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "pizzaBackground")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        // клавиатура
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        // реализация методов
        addLabelOrder()
        addImagePizzaOrder()
        addLabelName()
        addLabelIngridients()
        addLabelPrice()
        addLabelPayCard()
        addLabelPayCush()
        addSwitchPayCard()
        addSwitchPayCush()
        addButtonPay()
        addLabelReview()
        addTextFieldReview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    //MARK: - Methods
    
    @objc func dismissKeyboard() {
        view.endEditing(true) // Закрывает клавиатуру
    }
    
    func addLabelOrder() {
        labelOrder.frame = CGRect(x: 15, y: 130, width: 300, height: 50)
        labelOrder.text = "Ваш заказ:"
        labelOrder.textAlignment = .left
        labelOrder.font = UIFont(name: "Cochin-Bold", size: 42)
        view.addSubview(labelOrder)
    }
    
    func addImagePizzaOrder() {
        imagePizzaOrder.frame = CGRect(x: 3, y: 200, width: 200, height: 200)
        imagePizzaOrder.image = imageView
        view.addSubview(imagePizzaOrder)
    }
    
    func addLabelName() {
        labelName.frame = CGRect(x: 210, y: 200, width: 300, height: 50)
        labelName.text = name
        labelName.textAlignment = .left
        labelName.font = UIFont(name: "Cochin-BoldItalic", size: 32)
        view.addSubview(labelName)
    }
    
    func addLabelIngridients() {
        labelIngridients.frame = CGRect(x: 210, y: 250, width: 165, height: 50)
        labelIngridients.textAlignment = .left
        labelIngridients.font = UIFont(name: "Cochin-Bold", size: 20)
        labelIngridients.alpha = 0.5
        labelIngridients.adjustsFontSizeToFitWidth = true
        labelIngridients.minimumScaleFactor = 0.5
        labelIngridients.numberOfLines = 0
        if flagCheese {
            ingridients.append("Сыр моцарелла")
        }
        if flagHam {
            ingridients.append("Ветчина")
        }
        if flagMushrooms {
            ingridients.append("Грибы")
        }
        if flagOlives {
            ingridients.append("Маслины")
        }
        let ingredientsText = ingridients.joined(separator: ", ")
        labelIngridients.text = "\(ingredientsText)"
        view.addSubview(labelIngridients)
    }
    
    func addLabelPrice() {
        labelPrice.frame = CGRect(x: 235, y: 330, width: 100, height: 50)
        labelPrice.text = "\(sumResult) ₽"
        labelPrice.font = UIFont(name: "Cochin-Bold", size: 28)
        labelPrice.textAlignment = .center
        labelPrice.textColor = .white
        labelPrice.backgroundColor = .systemRed
        labelPrice.layer.cornerRadius = 12
        labelPrice.layer.masksToBounds = true
        view.addSubview(labelPrice)
    }
    
    func addLabelPayCard() {
        labelPayCard.frame = CGRect(x: 30, y: 600, width: 200, height: 50)
        labelPayCard.text = "Оплата картой"
        labelPayCard.textAlignment = .left
        labelPayCard.font = UIFont(name: "Cochin-Bold", size: 22)
        view.addSubview(labelPayCard)
    }
    
    func addLabelPayCush() {
        labelPayCush.frame = CGRect(x: 30, y: 660, width: 200, height: 50)
        labelPayCush.text = "Оплата наличными"
        labelPayCush.textAlignment = .left
        labelPayCush.font = UIFont(name: "Cochin-Bold", size: 22)
        view.addSubview(labelPayCush)
    }
    
    func addSwitchPayCard() {
        switchPayCard.frame = CGRect(x: 300, y: 610, width: 100, height: 50)
        switchPayCard.isOn = true
        view.addSubview(switchPayCard)
        switchPayCard.addTarget(self, action: #selector(switchPayCardChange), for: .valueChanged)
    }
    
    @objc func switchPayCardChange() {
        if switchPayCard.isOn {
            self.view.addSubview(buttonPay)
            switchPayCush.isOn = false
        } else if switchPayCard.isOn == false {
            buttonPay.removeFromSuperview()
            switchPayCush.isOn = true
        }
    }
    
    func addSwitchPayCush() {
        switchPayCush.frame = CGRect(x: 300, y: 670, width: 100, height: 50)
        switchPayCush.isOn = false
        view.addSubview(switchPayCush)
        switchPayCush.addTarget(self, action: #selector(switchPayCushChange), for: .valueChanged)
    }
    
    @objc func switchPayCushChange() {
        if switchPayCush.isOn {
            switchPayCard.isOn = false
            buttonPay.removeFromSuperview()
        } else if switchPayCush.isOn == false {
            switchPayCard.isOn = true
            self.view.addSubview(buttonPay)
        }
    }
    
    func addButtonPay() {
        buttonPay.frame = CGRect(x: 70, y: 720, width: 270, height: 70)
        buttonPay.setImage(UIImage(named: "applePay"), for: .normal)
        buttonPay.backgroundColor = .systemRed
        buttonPay.layer.cornerRadius = 12
        buttonPay.clipsToBounds = true
        view.addSubview(buttonPay)
        buttonPay.addTarget(self, action: #selector(buttonPayTapped), for: .touchUpInside)
    }
    
    @objc func buttonPayTapped() {
        let alert = UIAlertController(title: "Заказ оплачен", message: "Ваш заказ будет готов в течение 15 минут! Приятного аппетита", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default) { actionOK in
            let secondVC = SecondViewController()
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
        alert.addAction(actionOK)
        present(alert, animated: true)
    }
    
    func addLabelReview() {
        labelReview.frame = CGRect(x: 40, y: 450, width: 320, height: 30)
        labelReview.text = "Оставьте, пожалуйста, отзыв"
        labelReview.font = UIFont(name: "Cochin-Bold", size: 20)
        labelReview.backgroundColor = .systemRed
        labelReview.textColor = .white
        labelReview.textAlignment = .center
        labelReview.layer.cornerRadius = 12
        labelReview.layer.masksToBounds = true
        view.addSubview(labelReview)
    }
    
    func addTextFieldReview() {
        textFieldReview.frame = CGRect(x: 40, y: 490, width: 320, height: 100)
        textFieldReview.placeholder = "Напишите что-нибудь"
        textFieldReview.borderStyle = .roundedRect
        view.addSubview(textFieldReview)
    }
}
