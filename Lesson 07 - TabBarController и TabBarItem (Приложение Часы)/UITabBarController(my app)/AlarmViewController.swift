//
//  AlarmViewController.swift
//  UITabBarController(my app)
//
//  Created by Alexandr Garkalin on 10.09.2024.
//

import UIKit

class AlarmViewController: UIViewController, UITextFieldDelegate {

    var alarmVC: SecondViewController?
    
    let buttonCancel = UIButton()
    let labelAddAlarm = UILabel()
    let buttonSave = UIButton()
    let datePicker = UIDatePicker()
    let labels = UILabel()
    let horizontLine1 = UIView()
    let horizontLine2 = UIView()
    let horizontLine3 = UIView()
    let labelReplay = UILabel()
    let textFieldName = UITextField()
    let labelMelody = UILabel()
    let switchAlarm = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        
        // клавиатура
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        // реализация методов
        addButtonCancel()
        addLabelAddAlarm()
        addButtonSave()
        addDatePicker()
        addHorizontLine1()
        addHorizontLine2()
        addHorizontLine3()
        addLabels()
        addTextFieldName()
        addSwitchAlarm()
        addLabelReplay()
        addLabelMelody()
    }
    
    //MARK: - Methods
    
    @objc func dismissKeyboard() {
        view.endEditing(true) // Закрывает клавиатуру
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
    
    func addLabelAddAlarm() {
        labelAddAlarm.frame = CGRect(x: 110, y: 10, width: 200, height: 50)
        labelAddAlarm.text = "Добавить будильник"
        labelAddAlarm.textColor = .white
        labelAddAlarm.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.addSubview(labelAddAlarm)
    }
    
    func addButtonSave() {
        buttonSave.frame = CGRect(x: 285, y: 10, width: 100, height: 50)
        buttonSave.setTitle("Сохранить", for: .normal)
        buttonSave.setTitleColor(.systemOrange, for: .normal)
        buttonSave.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        view.addSubview(buttonSave)
        buttonSave.addTarget(self, action: #selector(buttonSaveTapped), for: .touchUpInside)
    }
    
    @objc func buttonSaveTapped() {
        alarmVC?.name = textFieldName.text
        alarmVC?.selectedTime = datePicker.date
        alarmVC?.addNewAlarm()
        dismiss(animated: true)
    }
    
    func addDatePicker() {
        datePicker.frame = CGRect(x: 40, y: 80, width: 400, height: 250)
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.tintColor = .white
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        view.addSubview(datePicker)
    }
    
    func addLabels() {
        labels.frame = CGRect(x: 10, y: 300, width: 365, height: 180)
        labels.backgroundColor = .systemGray.withAlphaComponent(0.2)
        labels.text = "    Повтор \n\n    Название \n\n    Мелодия \n\n    Повторение сигнала"
        labels.textAlignment = .left
        labels.numberOfLines = 0
        labels.textColor = .white
        labels.layer.cornerRadius = 12
        labels.layer.masksToBounds = true
        view.addSubview(labels)
    }
    
    func addHorizontLine1() {
        horizontLine1.frame = CGRect(x: 15, y: 353, width: 350, height: 0.3)
        horizontLine1.backgroundColor = .systemGray
        view.addSubview(horizontLine1)
    }
    
    func addHorizontLine2() {
        horizontLine2.frame = CGRect(x: 15, y: 393, width: 350, height: 0.3)
        horizontLine2.backgroundColor = .systemGray
        view.addSubview(horizontLine2)
    }
    
    func addHorizontLine3() {
        horizontLine3.frame = CGRect(x: 15, y: 433, width: 350, height: 0.3)
        horizontLine3.backgroundColor = .systemGray
        view.addSubview(horizontLine3)
    }
    
    func addTextFieldName() {
        textFieldName.frame = CGRect(x: 120, y: 355, width: 240, height: 30)
        let placeholderText = "Будильник"
        let placeholderColor = UIColor.white.withAlphaComponent(0.3)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .right
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: placeholderColor, .paragraphStyle: paragraphStyle]
        textFieldName.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        textFieldName.textColor = .white
        textFieldName.backgroundColor = .systemGray.withAlphaComponent(0.001)
        textFieldName.textAlignment = .right
        textFieldName.delegate = self
        view.addSubview(textFieldName)
    }
    
    func addSwitchAlarm() {
        switchAlarm.frame = CGRect(x: 310, y: 440, width: 30, height: 30)
        switchAlarm.tintColor = .systemGray
        switchAlarm.layer.cornerRadius = switchAlarm.frame.height / 2
        switchAlarm.backgroundColor = .systemGray.withAlphaComponent(0.3)
        view.addSubview(switchAlarm)
    }
    
    func addLabelReplay() {
        labelReplay.frame = CGRect(x: 280, y: 300, width: 100, height: 50)
        labelReplay.text = "Никогда >"
        labelReplay.textColor = .white.withAlphaComponent(0.7)
        labelReplay.backgroundColor = .clear
        view.addSubview(labelReplay)
    }
    
    func addLabelMelody() {
        labelMelody.frame = CGRect(x: 285, y: 385, width: 100, height: 50)
        labelMelody.text = "Радиус >"
        labelMelody.textColor = .white.withAlphaComponent(0.7)
        labelMelody.backgroundColor = .clear
        view.addSubview(labelMelody)
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldName.resignFirstResponder()
        return true
    }
}
