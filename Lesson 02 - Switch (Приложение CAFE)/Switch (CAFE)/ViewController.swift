//
//  ViewController.swift
//  Switch (CAFE)
//
//  Created by Alexandr Garkalin on 21.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let toggleButton = UIButton(type: .custom)
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    let signInButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // вызываем метод показа email
        emailText()
        // вызываем метод пароля и его скрытия
        setupUI()
        // вызываем метод создания и размещения кнопки входа
        signIn()
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
        
        
        // создаем и добавляем главное изображение
        let mainPicture = UIImageView(frame: CGRect(x: 65, y: 100, width: 270, height: 170))
        mainPicture.image = UIImage(named: "mainPicture")
        mainPicture.layer.cornerRadius = 15
        mainPicture.clipsToBounds = true
        self.view.addSubview(mainPicture)
        
        // добавляем надпись Welcome
        let labelWelcome = UILabel(frame: CGRect(x: 65, y: 350, width: 270, height: 50))
        labelWelcome.attributedText = NSAttributedString(string: "  Welcome! Please sing in: ", attributes: [.foregroundColor: UIColor.black, .font: UIFont.italicSystemFont(ofSize: 24)])
        labelWelcome.font = UIFont(name: "MarkerFelt-Thin", size: 24)
        labelWelcome.backgroundColor = .white
        labelWelcome.numberOfLines = 0
        labelWelcome.layer.cornerRadius = 20
        labelWelcome.clipsToBounds = true
        self.view.addSubview(labelWelcome)
        
        // добавляем надпись Sign In
        let labelSignIn = UILabel(frame: CGRect(x: 30, y: 470, width: 100, height: 100))
        labelSignIn.text = "Sign In"
        labelSignIn.font = UIFont(name: "MarkerFelt-Thin", size: 30)
        self.view.addSubview(labelSignIn)
        
        // добавляем надпись Email
        let labelEmail = UILabel(frame: CGRect(x: 30, y: 530, width: 100, height: 100))
        labelEmail.text = "Email"
        labelEmail.font = UIFont(name: "MuktaMahee-Bold", size: 18)
        labelEmail.textColor = UIColor.systemPink
        self.view.addSubview(labelEmail)
        
        // добавляем emailTextField
        func emailText() {
            emailTextField.frame = CGRect(x: 30, y: 570, width: 1000, height: 100)
            emailTextField.placeholder = "Your e-mail"
            emailTextField.font = UIFont(name: "MuktaMahee-Bold", size: 18)
            emailTextField.autocapitalizationType = .none
            emailTextField.autocorrectionType = .no
            self.view.addSubview(emailTextField) }
        
        // добавляем надпись Password
        let labelPassword = UILabel(frame: CGRect(x: 30, y: 620, width: 100, height: 100))
        labelPassword.text = "Password"
        labelPassword.font = UIFont(name: "MuktaMahee-Bold", size: 18)
        labelPassword.textColor = UIColor.systemPink
        self.view.addSubview(labelPassword) }
    
    // добавляем passwordTextField
    private func setupUI() {
        passwordTextField.frame = CGRect(x: 30, y: 660, width: 1000, height: 100)
        passwordTextField.placeholder = "Your password"
        passwordTextField.font = UIFont(name: "MuktaMahee-Bold", size: 18)
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        self.view.addSubview(passwordTextField)
        
        // добавляем кнопку для скрыть/показать пароль
        toggleButton.frame = CGRect(x: 290, y: 690, width: 40, height: 40)
        toggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        toggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        toggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        self.view?.addSubview(toggleButton)
    }
    
    // функция наблюдения за паролем
    @objc private func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        toggleButton.isSelected = passwordTextField.isSecureTextEntry
        passwordTextField.becomeFirstResponder()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true) // Закрывает клавиатуру
    }
    
    // создание и размещение кнопки
    func signIn() {
        signInButton.frame = CGRect(x: 150, y: 750, width: 100, height: 50)
        signInButton.setTitle("SIGN IN", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.backgroundColor = .systemPink
        signInButton.titleLabel?.font = UIFont(name: "MuktaMahee-Bold", size: 18)
        signInButton.layer.cornerRadius = 15
        signInButton.clipsToBounds = true
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        self.view.addSubview(signInButton)
    }
    
    // функция для наблюдения за нажатием на кнопку. Если email и пароль пустые, то выводится алерт, если заполненные - то переход на следующий экран (View Controller)
    @objc func signInButtonTapped() {
        guard let text = emailTextField.text, let text2 = passwordTextField.text, !text.isEmpty, !text2.isEmpty, text.contains("@"), text.contains("."), text2.count > 5 else {
            let alert = UIAlertController(title: "Ошибка", message: "Введите действительные e-mail и пароль (более 5 символов)", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default)
            alert.addAction(actionOK)
            self.present(alert, animated: true)
            return
        }
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

