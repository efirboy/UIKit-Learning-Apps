//
//  ThirdViewController.swift
//  UISegmentControl
//
//  Created by Alexandr Garkalin on 03.09.2024.
//

import UIKit

class ThirdViewController: UIViewController {

    let upView = UIView()
    let basketEmpty = UIImageView()
    let buttonExit = UIButton()
    let buttonCancel = UIButton()
    var name: String?
    var image = UIImageView()
    var price: String?
    var size: String?
    var quanity: Int = 1
    var color: String?
    var delivery: String?
    let labelName = UILabel()
    let labelAboutItem = UILabel()
    let buttonPay = UIButton()
    let labelDelivery = UILabel()
    let textFieldDelivery = UITextField()
    let labelStars = UILabel()
    let sliderStars = UISlider()
    let labelNumberStar = UILabel()
    var segmentTakeItem = UISegmentedControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "backgroundImage")
        
        // Устанавливаем режим отображения, чтобы изображение заполнило весь экран
        backgroundImage.contentMode = .scaleAspectFill
        
        // Добавляем UIImageView как подвид (subview) перед добавлением других view
        self.view.addSubview(backgroundImage)
        
        // Перемещаем backgroundImageView на задний план
        self.view.sendSubviewToBack(backgroundImage)
        addView()
        
        if name == nil {
            addBasketEmpty()
            addButtonExit()
        } else {
            addImageItem()
            addLabelName()
            addLabelAboutItem()
            addButtonPay()
            addSegmentTakeItem()
            addLabelDelivery()
            addTextFiledDelivery()
            addLabelStars()
            addSliderStars()
            addLabelNumberStar()
            addButtonCancel()
        }
        
    }
    
    func addView() {
        upView.frame = CGRect(x: 0, y: 0, width: 500, height: 90)
        upView.backgroundColor = .systemGray6
        self.view.addSubview(upView)
    }
    
    func addBasketEmpty() {
        basketEmpty.frame = CGRect(x: 50, y: 100, width: 300, height: 300)
        basketEmpty.image = UIImage(named: "basketEmpty")
        self.view.addSubview(basketEmpty)
    }
    
    func addButtonExit() {
        buttonExit.frame = CGRect(x: 75, y: 400, width: 250, height: 50)
        buttonExit.setTitle("Вернуться к покупкам", for: .normal)
        buttonExit.backgroundColor = .systemBlue
        buttonExit.setTitleColor(.white, for: .normal)
        buttonExit.layer.cornerRadius = 12
        self.view.addSubview(buttonExit)
        buttonExit.addTarget(self, action: #selector(buttonExitTapped), for: .touchUpInside)
    }
    
    @objc func buttonExitTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func addImageItem() {
        image.frame = CGRect(x: 20, y: 120, width: 150, height: 80)
        self.view.addSubview(image)
    }
    
    func addLabelName() {
        labelName.frame = CGRect(x: 105, y: 80, width: 300, height: 100)
        labelName.text = name
        labelName.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        labelName.textAlignment = .center
        labelName.adjustsFontSizeToFitWidth = true
        labelName.minimumScaleFactor = 0.5
        labelName.numberOfLines = 0
        self.view.addSubview(labelName)
    }
    
    func addLabelAboutItem() {
        labelAboutItem.frame = CGRect(x: 170, y: 110, width: 200, height: 100)
        labelAboutItem.text = "Размер: \(size!), Количество: \(quanity), Цвет: \(color!)"
        labelAboutItem.font = UIFont(name: "AmericanTypewriter-Bold", size: 12)
        labelAboutItem.textAlignment = .left
        labelAboutItem.adjustsFontSizeToFitWidth = true
        labelAboutItem.minimumScaleFactor = 0.5
        labelAboutItem.numberOfLines = 0
        self.view.addSubview(labelAboutItem)
    }
    
    func addTextFiledDelivery() {
        textFieldDelivery.frame = CGRect(x: 50, y: 400, width: 300, height: 50)
        textFieldDelivery.placeholder = " Введите адрес"
        textFieldDelivery.borderStyle = .none
        textFieldDelivery.layer.borderWidth = 2.0
        textFieldDelivery.layer.cornerRadius = 5.0
        textFieldDelivery.layer.masksToBounds = true
        self.view.addSubview(textFieldDelivery)
    }
    
    func addLabelDelivery() {
        labelDelivery.frame = CGRect(x: 50, y: 300, width: 300, height: 100)
        labelDelivery.text = "Доставка будет осуществлена \(delivery ?? "(Не выбрана дата доставки!)"). Введите свой адрес:"
        labelDelivery.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        labelDelivery.textAlignment = .center
        labelDelivery.adjustsFontSizeToFitWidth = true
        labelDelivery.minimumScaleFactor = 0.5
        labelDelivery.numberOfLines = 0
        self.view.addSubview(labelDelivery)
    }
    
    
    func addSegmentTakeItem() {
        segmentTakeItem = UISegmentedControl(items: ["Доставка", "Самовывоз"])
        segmentTakeItem.frame = CGRect(x: 50, y: 250, width: 300, height: 25)
        segmentTakeItem.backgroundColor = .black
        segmentTakeItem.selectedSegmentTintColor = .systemRed
        segmentTakeItem.selectedSegmentIndex = 0
        segmentTakeItem.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        self.view.addSubview(segmentTakeItem)
        segmentTakeItem.addTarget(self, action: #selector(segmentTakeItemChange), for: .valueChanged)
    }
    
    @objc func segmentTakeItemChange(target: UISegmentedControl) {
        if target == segmentTakeItem {
            if target.selectedSegmentIndex == 0 {
                labelDelivery.text = "Доставка будет осуществлена \(delivery ?? "(Не выбрана дата доставки!)"). Введите свой адрес:"
                self.view.addSubview(textFieldDelivery)
            } else if target.selectedSegmentIndex == 1 {
                labelDelivery.text = "Вы можете забрать заказ в магазине Nike NYC - House of Innovation, Адрес: 650 5th Ave, New York, NY 10019, режим работы: Понедельник - Суббота 11:00 - 20:00, Воскресенье: 11:00 - 19:00"
                textFieldDelivery.removeFromSuperview()
            }
        }
    }
    
    func addLabelStars() {
        labelStars.frame = CGRect(x: 50, y: 500, width: 300, height: 100)
        labelStars.text = "Пожалуйста, оцените наш магазин по 10-бальной шкале"
        labelStars.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        labelStars.textAlignment = .center
        labelStars.adjustsFontSizeToFitWidth = true
        labelStars.minimumScaleFactor = 0.5
        labelStars.numberOfLines = 0
        self.view.addSubview(labelStars)
    }
    
    func addSliderStars() {
        sliderStars.frame = CGRect(x: 50, y: 600, width: 300, height: 50)
        sliderStars.minimumValue = 1
        sliderStars.maximumValue = 10
        sliderStars.value = 1
        sliderStars.minimumTrackTintColor = .red
        sliderStars.thumbTintColor = .white
        sliderStars.maximumTrackTintColor = .black
        self.view.addSubview(sliderStars)
        sliderStars.addTarget(self, action: #selector(sliderStarsChange), for: .valueChanged)
    }
    
    @objc func sliderStarsChange(target: UISlider) {
        if target == sliderStars {
            let sliderValue = Int(round(target.value))
            labelNumberStar.text = "\(sliderValue)"
        }
    }
    
    func addLabelNumberStar() {
        labelNumberStar.frame = CGRect(x: 175, y: 630, width: 50, height: 50)
        labelNumberStar.text = "0"
        labelNumberStar.font = UIFont(name: "AmericanTypewriter-Bold", size: 42)
        labelNumberStar.textAlignment = .center
        labelNumberStar.adjustsFontSizeToFitWidth = true
        labelNumberStar.minimumScaleFactor = 0.5
        labelNumberStar.numberOfLines = 0
        self.view.addSubview(labelNumberStar)
    }
    
    func addButtonPay() {
        buttonPay.frame = CGRect(x: 180, y: 760, width: 200, height: 50)
        buttonPay.setTitle("Оплатить \(price!)", for: .normal)
        buttonPay.backgroundColor = .black
        buttonPay.setTitleColor(.white, for: .normal)
        buttonPay.layer.cornerRadius = 12
        self.view.addSubview(buttonPay)
        buttonPay.addTarget(self, action: #selector(buttonPayTapped), for: .touchUpInside)
    }
    
    func emptyBusket() {
        self.image.removeFromSuperview()
        self.labelName.removeFromSuperview()
        self.labelAboutItem.removeFromSuperview()
        self.buttonPay.removeFromSuperview()
        self.segmentTakeItem.removeFromSuperview()
        self.labelDelivery.removeFromSuperview()
        self.textFieldDelivery.removeFromSuperview()
        self.labelStars.removeFromSuperview()
        self.sliderStars.removeFromSuperview()
        self.labelNumberStar.removeFromSuperview()
        self.addBasketEmpty()
        self.addButtonExit()
        
        let customButton = UIBarButtonItem(customView: UIView())
        self.navigationItem.leftBarButtonItem = customButton
    }
    
    
    @objc func buttonPayTapped() {
        let alert = UIAlertController(title: "Оплатить", message: nil, preferredStyle: .alert)
        let actionApplePay = UIAlertAction(title: "ApplePay", style: .default) { actionApplePay in
            let alert2 = UIAlertController(title: "Спасибо за заказ!", message: "Когда-нибудь Apple Pay обязательно вернётся в Россию 😔", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { actionOK in
                self.emptyBusket()
                self.buttonCancel.removeFromSuperview()
            }
            alert2.addAction(actionOK)
            self.present(alert2, animated: true)
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(actionApplePay)
        alert.addAction(actionCancel)
        present(alert, animated: true)
        
    }
    
    func addButtonCancel() {
        buttonCancel.frame = CGRect(x: 20, y: 760, width: 150, height: 50)
        buttonCancel.setTitle("Очистить корзину", for: .normal)
        buttonCancel.backgroundColor = .systemRed
        buttonCancel.titleLabel?.font = UIFont(name: "AmericanTypewriter-Condensed", size: 16)
        buttonCancel.setTitleColor(.white, for: .normal)
        buttonCancel.layer.cornerRadius = 12
        self.view.addSubview(buttonCancel)
        buttonCancel.addTarget(self, action: #selector(buttonCancelTapped), for: .touchUpInside)
    }
    
    @objc func buttonCancelTapped() {
        self.emptyBusket()
        self.buttonCancel.removeFromSuperview()
    }
}
