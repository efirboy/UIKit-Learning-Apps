//
//  ViewController.swift
//  UIPickerView (my app)
//
//  Created by Alexandr Garkalin on 26.08.2024.
//

import UIKit

import LocalAuthentication

class ViewController: UIViewController {

    let labelNaming = UILabel()
    let labelSignIn = UILabel()
    let labelEmail = UILabel()
    let textFieldEmail = UITextField()
    let horizontLine = UIView()
    let labelPassword = UILabel()
    let textFieldPassword = UITextField()
    let horizontLine2 = UIView()
    let labelFaceID = UILabel()
    let switchFaceID = UISwitch()
    let buttonSign = UIButton()
    let toggleButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Создаем распознаватель жестов
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        let rectangleView = RectangleView(frame: self.view.bounds)
        rectangleView.backgroundColor = .white
        self.view.addSubview(rectangleView)
        addLabelNaming()
        addLabelSignIn()
        addLabelEmail()
        addTextFieldEmail()
        addHorizontLine()
        addLabelPassword()
        addTextFieldPassword()
        addHorizontLine2()
        addLabelFaceID()
        addSwitch()
        addButtonSign()
    }
    
    func authenticateWithFaceID() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                if context.biometryType == .faceID {
                    let reason = "Для доступа используйте Face ID"
                    
                    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                        DispatchQueue.main.async {
                            if success {
                                self.showSuccessAlert()
                            } else {
                                self.showErrorAlert(message: authenticationError?.localizedDescription ?? "Не удалось аутентифицироваться")
                            }
                        }
                    }
                } else {
                    showErrorAlert(message: "Face ID не поддерживается на этом устройстве")
                }
            } else {
                showErrorAlert(message: error?.localizedDescription ?? "Биометрическая аутентификация не доступна")
            }
        }
        
        func showSuccessAlert() {
            let alert = UIAlertController(title: "Успех", message: "Аутентификация прошла успешно", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
        
        func showErrorAlert(message: String) {
            let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    
    // располагаем надпись Birthday Reminder на экране
    func addLabelNaming() {
        labelNaming.frame = CGRect(x: 50, y: 100, width: 300, height: 100)
        labelNaming.textAlignment = .center
        labelNaming.textColor = .systemBlue
        labelNaming.text = "Birthday Reminder 🔔"
        labelNaming.font = UIFont(name: "AcademyEngravedLetPlain", size: 24)
        self.view.addSubview(labelNaming)
    }
    
    // располагаем надпись Sign In на экране
    func addLabelSignIn() {
        labelSignIn.frame = CGRect(x: 30, y: 300, width: 150, height: 50)
        labelSignIn.text = "SIGN IN"
        labelSignIn.textAlignment = .center
        labelSignIn.font = UIFont(name: "AmericanTypewriter-Bold", size: 24)
        self.view.addSubview(labelSignIn)
    }
    
    // располагаем надпись Email на экране
    func addLabelEmail() {
        labelEmail.frame = CGRect(x: 50, y: 340, width: 150, height: 50)
        labelEmail.text = "E-mail"
        labelEmail.textAlignment = .left
        labelEmail.font = UIFont(name: "Avenir-HeavyOblique", size: 14)
        labelEmail.textColor = .systemBlue
        self.view.addSubview(labelEmail)
    }
    
    // располагаем текстфилд для email
    func addTextFieldEmail() {
        textFieldEmail.frame = CGRect(x: 50, y: 370, width: 300, height: 50)
        textFieldEmail.placeholder = "Введите E-mail"
        textFieldEmail.autocapitalizationType = .none
        textFieldEmail.autocorrectionType = .no
        self.view.addSubview(textFieldEmail)
    }
    
    // горизонтальная линия
    func addHorizontLine () {
        horizontLine.frame = CGRect(x: 50, y: 415, width: 300, height: 1)
        horizontLine.backgroundColor = .systemGray
        self.view.addSubview(horizontLine)
    }
    
    // располагаем надпись Password на экране
    func addLabelPassword() {
        labelPassword.frame = CGRect(x: 50, y: 420, width: 150, height: 50)
        labelPassword.text = "Password"
        labelPassword.textAlignment = .left
        labelPassword.font = UIFont(name: "Avenir-HeavyOblique", size: 14)
        labelPassword.textColor = .systemBlue
        self.view.addSubview(labelPassword)
    }
    
    // располагаем текстфилд для password и показать/скрыть
    func addTextFieldPassword() {
        textFieldPassword.frame = CGRect(x: 50, y: 450, width: 300, height: 50)
        textFieldPassword.placeholder = "Введите пароль"
        textFieldPassword.autocapitalizationType = .none
        textFieldPassword.autocorrectionType = .no
        textFieldPassword.isSecureTextEntry = true
        self.view.addSubview(textFieldPassword)
        
        toggleButton.frame = CGRect(x: 300, y: 455, width: 40, height: 40)
        toggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        toggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        toggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        self.view.addSubview(toggleButton)
    }
    
    // функция наблюдения за паролем
    @objc func togglePasswordVisibility() {
        textFieldPassword.isSecureTextEntry.toggle()
        toggleButton.isSelected = textFieldPassword.isSecureTextEntry
        textFieldPassword.becomeFirstResponder()
    }
    
    // горизонтальная линия №2
    func addHorizontLine2() {
        horizontLine2.frame = CGRect(x: 50, y: 495, width: 300, height: 1)
        horizontLine2.backgroundColor = .systemGray
        self.view.addSubview(horizontLine2)
    }
    
    // добавляем надпись Вход по Face ID
    func addLabelFaceID() {
        labelFaceID.frame = CGRect(x: 130, y: 530, width: 150, height: 50)
        labelFaceID.text = "Вход по Face ID"
        labelFaceID.textAlignment = .center
        labelFaceID.font = UIFont(name: "Arial-BoldMT", size: 18)
        labelFaceID.textColor = .black
        self.view.addSubview(labelFaceID)
    }
    
    // добавляем switch для FaceID
    func addSwitch() {
        switchFaceID.frame = CGRect(x: 280, y: 540, width: 100, height: 100)
        self.view.addSubview(switchFaceID)
    }
    
    // добавляем кнопку Войти и логику
    func addButtonSign() {
        buttonSign.frame = CGRect(x: 50, y: 600, width: 300, height: 50)
        buttonSign.setTitle("Войти", for: .normal)
        buttonSign.backgroundColor = .systemBlue
        buttonSign.layer.cornerRadius = 15
        buttonSign.clipsToBounds = true
        buttonSign.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        self.view.addSubview(buttonSign)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true) // Закрывает клавиатуру
    }
    
    @objc func pressButton() {
        guard let email = textFieldEmail.text, let password = textFieldPassword.text, !email.isEmpty, !password.isEmpty, email.contains("@"), email.contains("."), password.count > 5 else {
            let alert = UIAlertController(title: "Ошибка", message: "Введите действительные Email и пароль (более 5 символов)", preferredStyle: .alert)
            let alertOK = UIAlertAction(title: "OK", style: .default) { (actionOK) in
                self.textFieldEmail.text = ""
                self.textFieldPassword.text = ""
            }
            alert.addAction(alertOK)
            self.present(alert, animated: true)
            return
        }
        if switchFaceID.isOn {
            authenticateWithFaceID()
        }
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

// создаем прямоугольник для обводки надписи Birthday Reminder
class RectangleView: UIView {
    override func draw(_ rect: CGRect) {
        let rectangle = CGRect(x: 50, y: 100, width: 300, height: 100)
        let path = UIBezierPath(rect: rectangle)
        UIColor.black.setStroke()
        path.lineWidth = 2
        path.stroke()
    }
}

