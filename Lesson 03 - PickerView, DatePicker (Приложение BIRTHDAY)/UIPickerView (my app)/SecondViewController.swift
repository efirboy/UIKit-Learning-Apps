//
//  SecondViewController.swift
//  UIPickerView (my app)
//
//  Created by Alexandr Garkalin on 26.08.2024.
//

import UIKit

class SecondViewController: UIViewController {

    let upBlock = UIView()
    let labelNaming = UILabel()
    let image1 = UIImageView()
    let image2 = UIImageView()
    let image3 = UIImageView()
    let labelName1 = UILabel()
    let labelName2 = UILabel()
    let labelName3 = UILabel()
    let labelTextDownName1 = UILabel()
    let labelTextDownName2 = UILabel()
    let labelTextDownName3 = UILabel()
    let horizontLine1 = UIView()
    let horizontLine2 = UIView()
    let horizontLine3 = UIView()
    let labelDays1 = UILabel()
    let labelDays2 = UILabel()
    let labelDays3 = UILabel()
    let buttonPlus = UIButton()
    
    // из третьего контроллера
    var imageAdd = UIImageView()
    var StringNameAdd: String?
    var labelNameAdd = UILabel()
    var datePickerWithDateAdd = UIDatePicker()
    
    let labelDownAdd = UILabel()
    let horizontLineAdd = UILabel()
    let labelDaysAdd = UILabel()
    let labelColocolAdd = UILabel()
    
    let labelBirthday1 = UILabel()
    let labelBirthday2 = UILabel()
    let labelBirthday3 = UILabel()
    let datepickerBirthday1 = UIDatePicker()
    let datepickerBirthday2 = UIDatePicker()
    let datepickerBirthday3 = UIDatePicker()
    let labelColocol = UILabel()
    let labelColocol2 = UILabel()
    let labelColocol3 = UILabel()
    let labelColocol4 = UILabel()
    
    var stringDate1: String = ""
    var weekDay: String = ""
    var suffix: String = ""
    var suffix2: String = ""
    var itogDaysInt: Int = 0
    var itogDaysString: String = ""
    var ageBirthday: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем распознаватель жестов
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        self.view.backgroundColor = .white
        addUpBlock()
        addLabelNaming()
        addImage1()
        addLabelName1()
        addLabelTextDownName1()
        addLabelDays1()
        addHorizontLine1()
        addImage2()
        addLabelName2()
        addLabelTextDownName2()
        addLabelDays2()
        addHorizontLine2()
        addImage3()
        addLabelName3()
        addLabelTextDownName3()
        addLabelDays3()
        addHorizontLine3()
        addButton()
        addLabelBirthday1()
        addLabelBirthday2()
        addLabelBirthday3()
        addPickerBirthday1()
        addPickerBirthday2()
        addPickerBirthday3()
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true) // Закрывает клавиатуру
    }
    
    func addUpBlock() {
        upBlock.frame = CGRect(x: 0, y: 0, width: 500, height: 100)
        upBlock.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        self.view.addSubview(upBlock)
    }
    
    func addLabelNaming() {
        labelNaming.frame = CGRect(x: 155, y: 20, width: 200, height: 100)
        labelNaming.text = "Birthday"
        labelNaming.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        self.view.addSubview(labelNaming)
    }
    
    func addImage1() {
        image1.frame = CGRect(x: 20, y: 130, width: 60, height: 60)
        image1.image = UIImage(named: "Cat")
        image1.clipsToBounds = true
        image1.layer.cornerRadius = 30
        self.view.addSubview(image1)
    }
    
    func addLabelName1() {
        labelName1.frame = CGRect(x: 85, y: 130, width: 200, height: 20)
        labelName1.text = "Кот Барсик"
        labelName1.font = UIFont(name: "Arial-BoldMT", size: 16)
        self.view.addSubview(labelName1)
    }
    
    func addLabelTextDownName1() {
        labelTextDownName1.frame = CGRect(x: 85, y: 145, width: 300, height: 50)
        labelTextDownName1.text = ""
        labelTextDownName1.font = .boldSystemFont(ofSize: 14)
        labelTextDownName1.numberOfLines = 0
        labelTextDownName1.textColor = .lightGray
        self.view.addSubview(labelTextDownName1)
    }
    
    func addLabelDays1() {
        labelDays1.frame = CGRect(x: 320, y: 130, width: 100, height: 20)
        labelDays1.text = ""
        labelDays1.font = .boldSystemFont(ofSize: 14)
        labelDays1.textColor = .lightGray
        self.view.addSubview(labelDays1)
    }
    
    func addHorizontLine1() {
        horizontLine1.frame = CGRect(x: 30, y: 200, width: 500, height: 1)
        horizontLine1.backgroundColor = .lightGray
        self.view.addSubview(horizontLine1)
    }
    
    func addImage2() {
        image2.frame = CGRect(x: 20, y: 220, width: 60, height: 60)
        image2.image = UIImage(named: "Cat2")
        image2.clipsToBounds = true
        image2.layer.cornerRadius = 30
        self.view.addSubview(image2)
    }
    
    func addLabelName2() {
        labelName2.frame = CGRect(x: 85, y: 220, width: 200, height: 20)
        labelName2.text = "Кошка Агата"
        labelName2.font = UIFont(name: "Arial-BoldMT", size: 16)
        self.view.addSubview(labelName2)
    }
    
    func addLabelTextDownName2() {
        labelTextDownName2.frame = CGRect(x: 85, y: 235, width: 300, height: 50)
        labelTextDownName2.text = ""
        labelTextDownName2.font = .boldSystemFont(ofSize: 14)
        labelTextDownName2.numberOfLines = 0
        labelTextDownName2.textColor = .lightGray
        self.view.addSubview(labelTextDownName2)
    }
    
    func addLabelDays2() {
        labelDays2.frame = CGRect(x: 320, y: 220, width: 100, height: 20)
        labelDays2.text = ""
        labelDays2.font = .boldSystemFont(ofSize: 14)
        labelDays2.textColor = .lightGray
        self.view.addSubview(labelDays2)
    }
    
    func addHorizontLine2() {
        horizontLine2.frame = CGRect(x: 30, y: 290, width: 500, height: 1)
        horizontLine2.backgroundColor = .lightGray
        self.view.addSubview(horizontLine2)
    }
    
    func addImage3() {
        image3.frame = CGRect(x: 20, y: 310, width: 60, height: 60)
        image3.image = UIImage(named: "Cat3")
        image3.clipsToBounds = true
        image3.layer.cornerRadius = 30
        self.view.addSubview(image3)
    }
    
    func addLabelName3() {
        labelName3.frame = CGRect(x: 85, y: 310, width: 200, height: 20)
        labelName3.text = "Котёнок Рикки"
        labelName3.font = UIFont(name: "Arial-BoldMT", size: 16)
        self.view.addSubview(labelName3)
    }
    
    func addLabelTextDownName3() {
        labelTextDownName3.frame = CGRect(x: 85, y: 325, width: 300, height: 50)
        labelTextDownName3.text = ""
        labelTextDownName3.font = .boldSystemFont(ofSize: 14)
        labelTextDownName3.numberOfLines = 0
        labelTextDownName3.textColor = .lightGray
        self.view.addSubview(labelTextDownName3)
    }
    
    func addLabelDays3() {
        labelDays3.frame = CGRect(x: 320, y: 310, width: 100, height: 20)
        labelDays3.text = ""
        labelDays3.font = .boldSystemFont(ofSize: 14)
        labelDays3.textColor = .lightGray
        self.view.addSubview(labelDays3)
    }
    
    func addHorizontLine3() {
        horizontLine3.frame = CGRect(x: 30, y: 380, width: 500, height: 1)
        horizontLine3.backgroundColor = .lightGray
        self.view.addSubview(horizontLine3)
    }
    
    func addButton() {
        buttonPlus.frame = CGRect(x: 340, y: 50, width: 40, height: 40)
        buttonPlus.setTitle("+", for: .normal)
        buttonPlus.backgroundColor = .clear
        buttonPlus.setTitleColor(.systemBlue, for: .normal)
        buttonPlus.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        let barButton = UIBarButtonItem(customView: buttonPlus)
        self.navigationItem.rightBarButtonItem = barButton
        
        buttonPlus.addTarget(self, action: #selector(buttonPlusTapped), for: .touchUpInside)
    }
    
    @objc func buttonPlusTapped() {
        let thirdViewController = ThirdViewController()
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
    
    func addLabelBirthday1() {
        labelBirthday1.frame = CGRect(x: 20, y: 520, width: 300, height: 20)
        labelBirthday1.text = "Дата рождения кота Барсика"
        labelBirthday1.font = UIFont(name: "Arial-BoldMT", size: 15)
        self.view.addSubview(labelBirthday1)
    }
    
    func addLabelBirthday2() {
        labelBirthday2.frame = CGRect(x: 20, y: 570, width: 300, height: 20)
        labelBirthday2.text = "Дата рождения кошки Агаты"
        labelBirthday2.font = UIFont(name: "Arial-BoldMT", size: 15)
        self.view.addSubview(labelBirthday2)
    }
    
    func addLabelBirthday3() {
        labelBirthday3.frame = CGRect(x: 20, y: 620, width: 300, height: 20)
        labelBirthday3.text = "Дата рождения котёнка Рикки"
        labelBirthday3.font = UIFont(name: "Arial-BoldMT", size: 15)
        self.view.addSubview(labelBirthday3)
    }
    
    func addPickerBirthday1() {
        datepickerBirthday1.frame = CGRect(x: 140, y: 505, width: 245, height: 50)
        datepickerBirthday1.datePickerMode = .date
        datepickerBirthday1.maximumDate = .now
        datepickerBirthday1.locale = Locale(identifier: "ru_RU")
        self.view.addSubview(datepickerBirthday1)
        datepickerBirthday1.addTarget(self, action: #selector(datePickerBirthday1Change), for: .valueChanged)
    }
    
    func changeDate(param: UIDatePicker) {
        let date1 = DateFormatter()
        date1.dateFormat = "dd MMMM"
        date1.locale = Locale(identifier: "ru_RU")
        stringDate1 = date1.string(from: param.date)
        let currentDate = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: param.date, to: currentDate)
        let age = ageComponents.year!
        var nextBirthdayComponents = calendar.dateComponents([.day, .month, .year], from: param.date)
        nextBirthdayComponents.year = calendar.component(.year, from: currentDate)
        if let nextBirthday = calendar.date(from: nextBirthdayComponents), nextBirthday <= currentDate {
            nextBirthdayComponents.year! += 1
        }
        if let nextBirthdayDate = calendar.date(from: nextBirthdayComponents) {
            let weekday = calendar.component(.weekday, from: nextBirthdayDate)
            let day2 = calendar.dateComponents([.day, .month, .year], from: nextBirthdayDate)
            let day3 = calendar.dateComponents([.day, .month, .year], from: currentDate)
            if let date1 = calendar.date(from: day2), let date2 = calendar.date(from: day3) {
                let difference = calendar.dateComponents([.day], from: date2, to: date1)
                itogDaysInt = difference.day!
            }
            switch weekday {
            case 1: weekDay = "в воскресенье"
            case 2: weekDay = "в понедельник"
            case 3: weekDay = "во вторник"
            case 4: weekDay = "в среду"
            case 5: weekDay = "в четверг"
            case 6: weekDay = "в пятницу"
            case 7: weekDay = "в субботу"
            default: return
            }
        }
        ageBirthday = age + 1
        switch ageBirthday % 10 {
        case 1 where ageBirthday % 100 != 11:
            suffix = "год"
        case 2 where (ageBirthday % 100 < 10 || ageBirthday % 100 >= 20):
            suffix = "года"
        case 3 where (ageBirthday % 100 < 10 || ageBirthday % 100 >= 20):
            suffix = "года"
        case 4 where (ageBirthday % 100 < 10 || ageBirthday % 100 >= 20):
            suffix = "года"
        default:
            suffix = "лет"
        }
        
        switch itogDaysInt % 10 {
        case 1 where itogDaysInt % 100 != 11:
            suffix2 = "день"
        case 2 where (itogDaysInt % 100 < 12 || itogDaysInt % 100 > 14):
            suffix2 = "дня"
        case 3 where (itogDaysInt % 100 < 12 || itogDaysInt % 100 > 14):
            suffix2 = "дня"
        case 4 where (itogDaysInt % 100 < 12 || itogDaysInt % 100 > 14):
            suffix2 = "дня"
        default:
            suffix2 = "дней"
        }
        
    }
    
    @objc func datePickerBirthday1Change(_ param: UIDatePicker) {
        if param.isEqual(self.datepickerBirthday1) {
            changeDate(param: param)
            itogDaysString = String(itogDaysInt)
            
            labelTextDownName1.text = "\(stringDate1), \(weekDay), исполнится \(ageBirthday) \(suffix)"
            labelDays1.text = "\(itogDaysString) \(suffix2)"
            labelColocol.frame = CGRect(x: 295, y: 130, width: 100, height: 20)
            labelColocol.text = "🔔"
            self.view.addSubview(labelColocol)
        }
    }
    
    func addPickerBirthday2() {
        datepickerBirthday2.frame = CGRect(x: 140, y: 555, width: 245, height: 50)
        datepickerBirthday2.datePickerMode = .date
        datepickerBirthday2.maximumDate = .now
        datepickerBirthday2.locale = Locale(identifier: "ru_RU")
        self.view.addSubview(datepickerBirthday2)
        datepickerBirthday2.addTarget(self, action: #selector(datePickerBirthday2Change), for: .valueChanged)
    }
    
    @objc func datePickerBirthday2Change(_ param: UIDatePicker) {
        if param.isEqual(self.datepickerBirthday2) {
            changeDate(param: param)
            itogDaysString = String(itogDaysInt)
            
            labelTextDownName2.text = "\(stringDate1), \(weekDay), исполнится \(ageBirthday) \(suffix)"
            labelDays2.text = "\(itogDaysString) \(suffix2)"
            labelColocol2.frame = CGRect(x: 295, y: 220, width: 100, height: 20)
            labelColocol2.text = "🔔"
            self.view.addSubview(labelColocol2)
        }
    }
    
    func addPickerBirthday3() {
        datepickerBirthday3.frame = CGRect(x: 140, y: 605, width: 245, height: 50)
        datepickerBirthday3.datePickerMode = .date
        datepickerBirthday3.maximumDate = .now
        datepickerBirthday3.locale = Locale(identifier: "ru_RU")
        self.view.addSubview(datepickerBirthday3)
        datepickerBirthday3.addTarget(self, action: #selector(datePickerBirthday3Change), for: .valueChanged)
    }
    
    @objc func datePickerBirthday3Change(_ param: UIDatePicker) {
        if param.isEqual(self.datepickerBirthday3) {
            changeDate(param: param)
            itogDaysString = String(itogDaysInt)
            
            labelTextDownName3.text = "\(stringDate1), \(weekDay), исполнится \(ageBirthday) \(suffix)"
            labelDays3.text = "\(itogDaysString) \(suffix2)"
            labelColocol3.frame = CGRect(x: 295, y: 310, width: 100, height: 20)
            labelColocol3.text = "🔔"
            self.view.addSubview(labelColocol3)
        }
    }
    
    func addNewUser() {
        imageAdd.frame = CGRect(x: 20, y: 400, width: 60, height: 60)
        imageAdd.clipsToBounds = true
        imageAdd.layer.cornerRadius = 30
        self.view.addSubview(imageAdd)
        
        labelNameAdd.frame = CGRect(x: 85, y: 400, width: 200, height: 20)
        labelNameAdd.text = StringNameAdd
        labelNameAdd.font = UIFont(name: "Arial-BoldMT", size: 16)
        self.view.addSubview(labelNameAdd)
        
        horizontLineAdd.frame = CGRect(x: 30, y: 470, width: 500, height: 1)
        horizontLineAdd.backgroundColor = .lightGray
        self.view.addSubview(horizontLineAdd)
        
        labelDownAdd.frame = CGRect(x: 85, y: 415, width: 300, height: 50)
        labelDownAdd.text = ""
        labelDownAdd.font = .boldSystemFont(ofSize: 14)
        labelDownAdd.numberOfLines = 0
        labelDownAdd.textColor = .lightGray
        self.view.addSubview(labelDownAdd)
        
        labelDaysAdd.frame = CGRect(x: 320, y: 400, width: 100, height: 20)
        labelDaysAdd.text = ""
        labelDaysAdd.font = .boldSystemFont(ofSize: 14)
        labelDaysAdd.textColor = .lightGray
        self.view.addSubview(labelDaysAdd)
        
        if true {
            changeDate(param: datePickerWithDateAdd)
            labelDownAdd.text = "\(stringDate1), \(weekDay), исполнится \(ageBirthday) \(suffix)"
            labelDaysAdd.text = "\(itogDaysInt) \(suffix2)"
            labelColocolAdd.frame = CGRect(x: 295, y: 400, width: 100, height: 20)
            labelColocolAdd.text = "🔔"
            self.view.addSubview(labelColocolAdd)
            
        }
    }
}
