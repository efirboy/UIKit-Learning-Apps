//
//  ViewController.swift
//  Alert (MyApp)
//
//  Created by Alexandr Garkalin on 19.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var hiLabel: UILabel!
    
    @IBOutlet weak var hiLabelTwo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Создаем распознаватель жестов
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
                tapGesture.cancelsTouchesInView = false
                view.addGestureRecognizer(tapGesture)
        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "backgroundImage")
        
        // Устанавливаем режим отображения, чтобы изображение заполнило весь экран
        backgroundImage.contentMode = .scaleAspectFill
        
        // Добавляем UIImageView как подвид (subview) перед добавлением других view
        self.view.addSubview(backgroundImage)
        
        // Перемещаем backgroundImageView на задний план
        self.view.sendSubviewToBack(backgroundImage)
    }
    
    @objc func dismissKeyboard() {
            view.endEditing(true) // Закрывает клавиатуру
        }
    
    
    func alert(title: String, message: String, preferredStyle: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let actionOK = UIAlertAction(title: "OK", style: .default) { (actionOK) in
            if let name = alert.textFields?[0].text, !name.isEmpty {
                self.hiLabel.text = ("Привет") + (", ") + name + ("!")
                self.hiLabel.layer.cornerRadius = 8
                self.hiLabel.clipsToBounds = true
                self.hiLabel.backgroundColor = .init(UIColor(white: 1, alpha: 0.8))
                self.hiLabelTwo.text = "Давай сыграем в игру? 😊 Выбери во что ты хочешь поиграть "} else {
                    let warningNameAlert = UIAlertController(title: "Введите имя!", message: nil, preferredStyle: .alert)
                    let actionOK = UIAlertAction(title: "OK", style: .default) { (actionOK) in
                        alert.textFields?[0].text = ""
                        self.present(alert, animated: true)
                    }
                    warningNameAlert.addAction(actionOK)
                    self.present(warningNameAlert, animated: true)
                }
            self.hiLabelTwo.backgroundColor = .init(UIColor(white: 1, alpha: 0.8))
            self.hiLabelTwo.layer.cornerRadius = 8
            self.hiLabelTwo.clipsToBounds = true
            
        }
        alert.addAction(actionOK)
        alert.addTextField()
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.alert(title: "Привет", message: "Введите ваше имя", preferredStyle: .alert)
        
    }
    
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Введи два числа", message: nil, preferredStyle: .alert)
        alert.addTextField()
        alert.addTextField()
        
        let cancel = UIAlertAction(title: "Отменить", style: .cancel)
        let action = UIAlertAction(title: "Рассчитать", style: .default) { (action) in
            var result: Double {
                if let num1 = Double((alert.textFields?[0].text)!), let num2 = Double((alert.textFields?[1].text)!) {
                    return num1 + num2
                } else {
                    let warningAlert = UIAlertController(title: "Ошибка!", message: "Введите числа", preferredStyle: .alert)
                    let actionOK = UIAlertAction(title: "OK", style: .default) { (actionOK) in
                        alert.textFields?[0].text = ""
                        alert.textFields?[1].text = ""
                        self.present(alert, animated: true)
                    }
                    warningAlert.addAction(actionOK)
                    self.present(warningAlert, animated: true)
                    return 0
                } }
            
            if result.truncatingRemainder(dividingBy: 1) == 0 {
                let alertResultInt = UIAlertController(title: "Итоговый результат: \(Int(result))", message: nil, preferredStyle: .alert)
                let actionOK = UIAlertAction(title: "OK", style: .default)
                alertResultInt.addAction(actionOK)
                self.present(alertResultInt, animated: true) } else {
                    let alertResultDouble = UIAlertController(title: "Итоговый результат: \(result)", message: nil, preferredStyle: .alert)
                    let actionOK = UIAlertAction(title: "OK", style: .default)
                    alertResultDouble.addAction(actionOK)
                    self.present(alertResultDouble, animated: true)
                }
        }
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true)
        
    }
    
    @IBAction func randomButtonTapped(_ sender: Any) {
        let randomInt = Int.random(in: 1...100)
        let alertRandom = UIAlertController(title: "Система загадала число от 1 до 100", message: "Пропробуй отгадать его: ", preferredStyle: .alert)
        alertRandom.addTextField()
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        let actionOK = UIAlertAction(title: "Угадать", style: .default) { (actionOK) in
            if let userInt = Int((alertRandom.textFields?[0].text)!), userInt == randomInt {
                let alertDone = UIAlertController(title: "Вы угадали!", message: "Молодец!", preferredStyle: .alert)
                let actionOK = UIAlertAction(title: "Ура!", style: .default)
                alertDone.addAction(actionOK)
                self.present(alertDone, animated: true)
            } else {
                if let userInt = Int((alertRandom.textFields?[0].text)!), userInt > randomInt {
                    let alertNone = UIAlertController(title: "Неверно, твое число БОЛЬШЕ", message: "Попробуй ещё", preferredStyle: .alert)
                    let actionOK = UIAlertAction(title: "OK", style: .default) { (actionOK) in
                        alertRandom.textFields?[0].text = ""
                        self.present(alertRandom, animated: true)
                    }
                    alertNone.addAction(actionOK)
                    self.present(alertNone, animated: true)
                } else {
                    let alertNone = UIAlertController(title: "Неверно, твое число МЕНЬШЕ", message: "Попробуй ещё", preferredStyle: .alert)
                    let actionOK = UIAlertAction(title: "OK", style: .default) { (actionOK) in
                        alertRandom.textFields?[0].text = ""
                        self.present(alertRandom, animated: true)
                    }
                    alertNone.addAction(actionOK)
                    self.present(alertNone, animated: true)
                }
            }
        }
    alertRandom.addAction(actionOK)
    alertRandom.addAction(cancel)
    self.present(alertRandom, animated: true)
    }
}
