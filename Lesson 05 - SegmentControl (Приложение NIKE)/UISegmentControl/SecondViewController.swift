//
//  SecondViewController.swift
//  UISegmentControl
//
//  Created by Alexandr Garkalin on 03.09.2024.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerSize && nameItem == "Nike W Air Zoom Pegasus 40" {
            return 6
        } else if pickerView == pickerSize && nameItem == "Nike Air Winflo" {
            return 4
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerSize {
            return arraySize[row]
        }
        return nil
    }
    
    var arraySize: Array<String> = []
    var nameItem: String?
    
    let upView = UIView()
    let buttonShopping = UIButton()
    let labelName = UILabel()
    let labelPrice = UILabel()
    let labelPriceInt = UILabel()
    let labelSize = UILabel()
    let buttonSize = UIButton()
    let labelQuantity = UILabel()
    let buttonQuantity = UIButton()
    var sum: Int = 0
    var sumX: Int = 0
    let labelColor = UILabel()
    let labelCard = UILabel()
    let switchCard = UISwitch()
    let pickerSize = UIPickerView()
    var segmentController = UISegmentedControl()
    var menuArray: Array<String> = []
    var imageArray: [UIImage?] = []
    var segmentChoiseArray = ["Покупка", "Информация"]
    let labelDate = UILabel()
    let buttonDate = UIButton()
    let datePicker = UIDatePicker()
    let labelInfo = UILabel()
    
    let buttonAddItem = UIButton()
    var segmentChoise = UISegmentedControl()
    var imageView = UIImageView()
    let buttonShoppingFull = UIButton()

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
        
        let rightBarButtonItem = UIBarButtonItem(customView: buttonShopping)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        addView()
        addButtonShopping()
        addLabelName()
        addImage()
        addLabelPrice()
        addLabelPriceInt()
        addLabelSize()
        addButtonSize()
        addLabelQuantity()
        addButtonQuantity()
        addLabelCard()
        addSwitchCard()
        addLabelColor()
        addSegmentControl()
        addLabelDate()
        addDatePicker()
        addSegmentChoise()
        addLabelInfo()
        addButtonAddItem()
    }
    
    func addView() {
        upView.frame = CGRect(x: 0, y: 0, width: 500, height: 90)
        upView.backgroundColor = .systemGray6
        self.view.addSubview(upView)
    }
    
    func addButtonShopping() {
        buttonShopping.frame = CGRect(x: 340, y: 50, width: 40, height: 40)
        buttonShopping.setImage(UIImage(systemName: "basket"), for: .normal)
        buttonShopping.tintColor = .black
        self.view.addSubview(buttonShopping)
        buttonShopping.addTarget(self, action: #selector(buttonShoppingTapped), for: .touchUpInside)
    }
    
    @objc func buttonShoppingTapped() {
        let thirdVC = ThirdViewController()
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    func addLabelName() {
        labelName.frame = CGRect(x: 50, y: 100, width: 300, height: 100)
        labelName.text = nameItem
        labelName.textAlignment = .center
        labelName.font = UIFont(name: "AvenirNext-BoldItalic", size: 20)
        labelName.textColor = .black
        self.view.addSubview(labelName)
    }
    
    func addImage() {
        imageView.frame = CGRect(x: 50, y: 200, width: 300, height: 200)
        imageView.image = imageArray[0]
        self.view.addSubview(imageView)
    }
    
    func addLabelPrice() {
        labelPrice.frame = CGRect(x: 50, y: 450, width: 100, height: 50)
        labelPrice.text = "Стоимость"
        labelPrice.textAlignment = .center
        labelPrice.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        self.view.addSubview(labelPrice)
    }
    
    func addLabelPriceInt() {
        labelPriceInt.frame = CGRect(x: 240, y: 450, width: 100, height: 50)
        labelPriceInt.text = "\(sum) ₽"
        labelPriceInt.textAlignment = .center
        labelPriceInt.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        labelPriceInt.alpha = 0.7
        self.view.addSubview(labelPriceInt)
    }
    
    func addLabelSize() {
        labelSize.frame = CGRect(x: 50, y: 500, width: 100, height: 50)
        labelSize.text = "Размер"
        labelSize.textAlignment = .center
        labelSize.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        self.view.addSubview(labelSize)
    }
    
    func addButtonSize() {
        buttonSize.frame = CGRect(x: 215, y: 500, width: 150, height: 50)
        buttonSize.setTitle("Выбрать", for: .normal)
        buttonSize.setTitleColor(UIColor(_colorLiteralRed: 199/255, green: 199/255, blue: 205/255, alpha: 1.0), for: .normal)
        buttonSize.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        self.view.addSubview(buttonSize)
        buttonSize.addTarget(self, action: #selector(buttonSizeTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonSizeTapped() {
        pickerSize.delegate = self
        pickerSize.dataSource = self
        let alert = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        pickerSize.frame = CGRect(x: 0, y: 0, width: alert.view.bounds.width, height: 150)
        let alertOK = UIAlertAction(title: "OK", style: .default) { actionOK in
            let selectIndex = self.pickerSize.selectedRow(inComponent: 0)
            let text = self.arraySize[selectIndex]
            self.buttonSize.setTitle(text, for: .normal)
            self.buttonSize.setTitleColor(.black, for: .normal)
        }
        alert.addAction(alertOK)
        alert.view.addSubview(pickerSize)
        present(alert, animated: true)
        
    }
    
    func addLabelQuantity() {
        labelQuantity.frame = CGRect(x: 35, y: 550, width: 130, height: 50)
        labelQuantity.text = "Количество"
        labelQuantity.textAlignment = .center
        labelQuantity.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        self.view.addSubview(labelQuantity)
    }
    
    func addButtonQuantity() {
        buttonQuantity.frame = CGRect(x: 215, y: 550, width: 150, height: 50)
        buttonQuantity.setTitle("Выбрать", for: .normal)
        buttonQuantity.setTitleColor(UIColor(_colorLiteralRed: 199/255, green: 199/255, blue: 205/255, alpha: 1.0), for: .normal)
        buttonQuantity.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        self.view.addSubview(buttonQuantity)
        buttonQuantity.addTarget(self, action: #selector(buttonQuantityTapped), for: .touchUpInside)
    }
    
    @objc func buttonQuantityTapped() {
        let alert = UIAlertController(title: "Введите количество", message: "Максимум 5 штук", preferredStyle: .alert)
        let alertCancel = UIAlertAction(title: "Отмена", style: .cancel)
        let alertOK = UIAlertAction(title: "OK", style: .default) { actionOK in
            guard let textField = alert.textFields![0].text, !textField.isEmpty, (textField.contains("1") || textField.contains("2") || textField.contains("3") || textField.contains("4") || textField.contains("5")) else {
                let alert2 = UIAlertController(title: "Введите корректное значение", message: "От 1 до 5", preferredStyle: .alert)
                let alertOK = UIAlertAction(title: "OK", style: .default) { actionOK in
                    alert.textFields?[0].text = ""
                    self.present(alert, animated: true)
                }
                alert2.addAction(alertOK)
                self.present(alert2, animated: true)
                return
            }
            self.buttonQuantity.setTitle(alert.textFields?[0].text, for: .normal)
            self.buttonQuantity.setTitleColor(.black, for: .normal)
            let intQuantity = Int((alert.textFields?[0].text)!)
            self.sumX = self.sum * intQuantity!
            self.labelPriceInt.text = "\(self.sumX) ₽"
            self.labelPriceInt.textColor = .black
            if self.switchCard.isOn == true {
                self.labelPriceInt.text = "\(Int(Double(self.sumX) * 0.9)) ₽"
                self.labelPriceInt.textColor = .systemGreen
            }
        }
        alert.addAction(alertOK)
        alert.addAction(alertCancel)
        alert.addTextField()
        present(alert, animated: true)
    }
    
    func addLabelCard() {
        labelCard.frame = CGRect(x: 15, y: 600, width: 170, height: 50)
        labelCard.text = "Скидочная карта"
        labelCard.textAlignment = .center
        labelCard.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        self.view.addSubview(labelCard)
    }
    
    func addSwitchCard() {
        switchCard.frame = CGRect(x: 260, y: 610, width: 100, height: 100)
        self.view.addSubview(switchCard)
        switchCard.addTarget(self, action: #selector(switchCardChange), for: .valueChanged)
    }
    
    @objc func switchCardChange(target: UISwitch) {
        if target == switchCard {
            if switchCard.isOn {
                let sumXWithCard = Int(Double(sumX) * 0.9)
                self.labelPriceInt.text = "\(sumXWithCard) ₽"
                self.labelPriceInt.textColor = .systemGreen
            } else if !switchCard.isOn {
                self.labelPriceInt.text = "\(sumX) ₽"
                self.labelPriceInt.textColor = .black
            }
        }
    }
    
    func addLabelColor() {
        labelColor.frame = CGRect(x: 30, y: 650, width: 100, height: 50)
        labelColor.text = "Цвет"
        labelColor.textAlignment = .center
        labelColor.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        self.view.addSubview(labelColor)
    }
    
    func addSegmentControl() {
        segmentController = UISegmentedControl(items: menuArray)
        segmentController.frame = CGRect(x: 110, y: 660, width: 270, height: 30)
        segmentController.selectedSegmentIndex = 0
        self.view.addSubview(segmentController)
        segmentController.addTarget(self, action: #selector(segmentControllerValue), for: .valueChanged)
    }
    
    @objc func segmentControllerValue(target: UISegmentedControl) {
        if target == segmentController {
            let selectIndex = target.selectedSegmentIndex
            self.imageView.image = imageArray[selectIndex]
        }
    }
    
    func addLabelDate() {
        labelDate.frame = CGRect(x: 10, y: 700, width: 170, height: 50)
        labelDate.text = "Дата доставки"
        labelDate.textAlignment = .center
        labelDate.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        self.view.addSubview(labelDate)
    }
    
    func addDatePicker() {
        datePicker.datePickerMode = .dateAndTime
        datePicker.minuteInterval = 60
        var calendar = Calendar.current
        calendar.firstWeekday = 2
        let now = Date()
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: now)!
        let startFfTomorrow = calendar.date(bySettingHour: 8, minute: 0, second: 0, of: tomorrow)!
        let endOfWeek = calendar.date(byAdding: .weekOfMonth, value: 1, to: startFfTomorrow)!
        let endOfWeekEnd = calendar.date(bySettingHour: 18, minute: 0, second: 0, of: endOfWeek)!
        datePicker.minimumDate = startFfTomorrow
        datePicker.maximumDate = endOfWeekEnd
        datePicker.calendar = calendar
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.frame = CGRect(x: 130, y: 700, width: 250, height: 50)
        self.view.addSubview(datePicker)
        datePicker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
    }
    
    @objc func datePickerChanged() {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ru_RU")
        let formattedDate = formatter.string(from: datePicker.date)
        buttonDate.frame = CGRect(x: 160, y: 700, width: 250, height: 50)
        self.buttonDate.setTitle(formattedDate, for: .normal)
        self.buttonDate.setTitleColor(.black, for: .normal)
        datePicker.removeFromSuperview()
        self.view.addSubview(self.buttonDate)
        buttonDate.addTarget(self, action: #selector(buttonDateTapped), for: .touchUpInside)
    }
    
    @objc func buttonDateTapped() {
        addDatePicker()
        buttonDate.setTitle("", for: .normal)
    }
    
    func addSegmentChoise() {
        segmentChoise = UISegmentedControl(items: segmentChoiseArray)
        segmentChoise.frame = CGRect(x: 50, y: 80, width: 300, height: 40)
        segmentChoise.selectedSegmentIndex = 0
        self.view.addSubview(segmentChoise)
        segmentChoise.addTarget(self, action: #selector(segmentChoiseChange), for: .valueChanged)
    }
    
    @objc func segmentChoiseChange(target: UISegmentedControl) {
        if target == segmentChoise {
            let selectIndex = target.selectedSegmentIndex
            if selectIndex == 1 {
                labelPrice.removeFromSuperview()
                labelPriceInt.removeFromSuperview()
                labelSize.removeFromSuperview()
                buttonSize.removeFromSuperview()
                labelQuantity.removeFromSuperview()
                buttonQuantity.removeFromSuperview()
                labelCard.removeFromSuperview()
                switchCard.removeFromSuperview()
                labelColor.removeFromSuperview()
                segmentController.removeFromSuperview()
                labelDate.removeFromSuperview()
                buttonAddItem.removeFromSuperview()
                if buttonDate.titleLabel?.text == nil {
                    datePicker.removeFromSuperview()
                } else {
                    buttonDate.removeFromSuperview()
                }
                self.view.addSubview(labelInfo)
                
                
            } else {
                self.view.addSubview(labelPrice)
                self.view.addSubview(labelPriceInt)
                self.view.addSubview(labelSize)
                self.view.addSubview(buttonSize)
                self.view.addSubview(labelQuantity)
                self.view.addSubview(buttonQuantity)
                self.view.addSubview(labelCard)
                self.view.addSubview(switchCard)
                self.view.addSubview(labelColor)
                self.view.addSubview(segmentController)
                self.view.addSubview(labelDate)
                self.view.addSubview(buttonAddItem)
                if buttonDate.titleLabel?.text == nil {
                    self.view.addSubview(datePicker)
                } else {
                    self.view.addSubview(buttonDate)
                }
                labelInfo.removeFromSuperview()
            }
        }
    }
    
    func addLabelInfo() {
        labelInfo.frame = CGRect(x: 50, y: 410, width: 300, height: 350)
        if nameItem == "Nike W Air Zoom Pegasus 40" {
            labelInfo.text = "Nike W Air Zoom Pegasus 40 — это популярная модель беговых кроссовок от Nike, которая известна своей комфортной посадкой и хорошей амортизацией. Pegasus 40 оснащены технологией Nike Zoom Air в передней и задней частях подошвы, что обеспечивает отличную амортизацию и возвращение энергии при каждом шаге. Верх кроссовок выполнен из сетчатого материала, что обеспечивает хорошую вентиляцию и удобную посадку. Также они имеют поддержку средней части стопы и мягкий воротник для дополнительного комфорта. Подошва выполнена из прочной резины, что обеспечивает хорошее сцепление с различными поверхностями. Конструкция подошвы улучшает устойчивость и предотвращает скольжение. Эти кроссовки предназначены для бегунов и активных людей. Они подходят для тренировок, соревнований и повседневного использования, предоставляя отличную поддержку и комфорт. Кроссовки оснащены системой Flyknit, которая обеспечивает легкость и эластичность."
        } else if nameItem == "Nike Air Winflo" {
            labelInfo.text = "Nike Air Winflo — это серия кроссовок от Nike, предназначенная для бега. Модели этой серии предлагают баланс между комфортом, поддержкой и стилем, что делает их популярными среди бегунов всех уровней, от новичков до опытных спортсменов. Nike Air Winflo оснащены технологией Nike Air, которая обеспечивает хорошую амортизацию и защиту от ударов при беге. Это помогает уменьшить нагрузку на суставы и мышцы, особенно при длительных пробежках. Эти кроссовки обеспечивают надежную фиксацию стопы благодаря дизайну верха из сетчатого материала, который одновременно дышит и поддерживает. Это помогает избежать скольжения ноги внутри кроссовка и снижает риск травм. Материалы, использованные в конструкции Nike Air Winflo, обеспечивают долговечность кроссовок, делая их устойчивыми к износу даже при интенсивном использовании. Nike Air Winflo — отличный выбор для тех, кто ищет надежные и комфортные беговые кроссовки с хорошей поддержкой и стильным внешним видом."
        }
        
        labelInfo.font = UIFont(name: "Copperplate", size: 24)
        labelInfo.textColor = .black
        labelInfo.adjustsFontSizeToFitWidth = true
        labelInfo.minimumScaleFactor = 0.5
        labelInfo.numberOfLines = 0
    }
    
    func addButtonAddItem() {
        buttonAddItem.frame = CGRect(x: 80, y: 760, width: 250, height: 50)
        buttonAddItem.setTitle("Добавить в корзину", for: .normal)
        buttonAddItem.backgroundColor = .black
        buttonAddItem.setTitleColor(.white, for: .normal)
        buttonAddItem.layer.cornerRadius = 12
        self.view.addSubview(buttonAddItem)
        buttonAddItem.addTarget(self, action: #selector(buttonAddItemTapped), for: .touchUpInside)
    }
    
    @objc func buttonAddItemTapped() {
        guard buttonSize.titleLabel?.text != "Выбрать" && buttonQuantity.titleLabel?.text != "Выбрать" else {
            let alert = UIAlertController(title: "Укажите размер и количество", message: nil, preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default)
            alert.addAction(actionOK)
            present(alert, animated: true)
            return
        }
        let rightBarButtonItemFull = UIBarButtonItem(customView: buttonShoppingFull)
        self.navigationItem.rightBarButtonItem = rightBarButtonItemFull
        buttonShoppingFull.frame = CGRect(x: 340, y: 50, width: 40, height: 40)
        buttonShoppingFull.setImage(UIImage(systemName: "basket.fill"), for: .normal)
        buttonShoppingFull.tintColor = .black
        buttonShoppingFull.addTarget(self, action: #selector(buttonShoppingFullTapped), for: .touchUpInside)
    }
    
    @objc func buttonShoppingFullTapped() {
        let thirdVC = ThirdViewController()
        thirdVC.name = labelName.text
        thirdVC.image.image = imageView.image
        thirdVC.size = buttonSize.titleLabel?.text
        thirdVC.price = labelPriceInt.text
        if let text = buttonQuantity.titleLabel?.text {
            let intText = Int(text)
            thirdVC.quanity = intText!
        }
        thirdVC.delivery = buttonDate.titleLabel?.text
        let index = segmentController.selectedSegmentIndex
        thirdVC.color = menuArray[index]
        self.navigationController?.pushViewController(thirdVC, animated: true)
        
    }
}

