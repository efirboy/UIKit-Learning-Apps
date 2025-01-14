//
//  ViewController.swift
//  UITextField(myApp)
//
//  Created by Alexandr Garkalin on 16.09.2024.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let signUpLabel = UILabel()
    let nameTextField = UITextField()
    let phoneTextField = UITextField()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signUpButton = UIButton()
    let anotherAccountButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Sign up"
        
        // реализация методов
        addLabelSignUp()
        addNameTextField()
        addPhoneTextField()
        addEmailTextField()
        addPasswordTextField()
        addSignUpButton()
        addAnotherAccountButton()
        
        
        //MARK: - Notification Center
        // поднимаем содержимое View вверх при открытии клавиатуры
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -100
        }
        // возвращаем назад
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0
        }
    }
    
    //MARK: - Methods
    
    func addLabelSignUp() {
        signUpLabel.frame = CGRect(x: 135, y: 200, width: 200, height: 50)
        signUpLabel.text = "Sign up"
        signUpLabel.font = UIFont.systemFont(ofSize: 40)
        view.addSubview(signUpLabel)
    }
    
    func addNameTextField() {
        nameTextField.frame = CGRect(x: 30, y: 300, width: 330, height: 30)
        nameTextField.placeholder = "Введите свое имя"
        nameTextField.borderStyle = .roundedRect
        nameTextField.contentVerticalAlignment = .center
        nameTextField.delegate = self
        nameTextField.clearButtonMode = .always
        view.addSubview(nameTextField)
    }
    
    func addPhoneTextField() {
        phoneTextField.frame = CGRect(x: 30, y: 350, width: 330, height: 30)
        phoneTextField.placeholder = "Введите номер телефона"
        phoneTextField.borderStyle = .roundedRect
        phoneTextField.contentVerticalAlignment = .center
        phoneTextField.delegate = self
        phoneTextField.keyboardType = .phonePad
        phoneTextField.clearButtonMode = .always
        // создаем toolbar с кнопкой Далее
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        // Создаем кнопку "Далее" и добавляем ее в toolbar
        let nextButton = UIBarButtonItem(title: "Далее", style: .plain, target: self, action: #selector(nextTapped))
        toolbar.setItems([nextButton], animated: false)
        phoneTextField.inputAccessoryView = toolbar
        view.addSubview(phoneTextField)
    }
    
    @objc func nextTapped() {
        emailTextField.becomeFirstResponder()
    }
    
    func addEmailTextField() {
        emailTextField.frame = CGRect(x: 30, y: 400, width: 330, height: 30)
        emailTextField.placeholder = "Введите Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.contentVerticalAlignment = .center
        emailTextField.delegate = self
        emailTextField.keyboardType = .emailAddress
        emailTextField.clearButtonMode = .always
        view.addSubview(emailTextField)
    }
    
    func addPasswordTextField() {
        passwordTextField.frame = CGRect(x: 30, y: 450, width: 330, height: 30)
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.contentVerticalAlignment = .center
        passwordTextField.delegate = self
        passwordTextField.clearButtonMode = .always
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .none
        view.addSubview(passwordTextField)
    }
    
    func addSignUpButton() {
        signUpButton.frame = CGRect(x: 100, y: 520, width: 200, height: 50)
        signUpButton.setTitle("Регистрация", for: .normal)
        signUpButton.backgroundColor = .systemBlue
        signUpButton.layer.cornerRadius = 12
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        view.addSubview(signUpButton)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    func addAlert() {
        let alert = UIAlertController(title: "Введите все данные", message: nil, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default)
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        present(alert, animated: true)
    }
    
    @objc func signUpButtonTapped() {
        if signUpButton.titleLabel?.text == "Регистрация" {
            guard let textName = nameTextField.text, let textNumber = phoneTextField.text, let textEmail = emailTextField.text, let textPassword = passwordTextField.text, !textName.isEmpty, !textNumber.isEmpty, !textEmail.isEmpty, !textPassword.isEmpty, !textName.isEmpty else {
                addAlert()
                return
            }
            let secondVC = SecondViewController()
            self.navigationController?.pushViewController(secondVC, animated: true)
        } else {
            guard let textEmail = emailTextField.text, let textPassword = passwordTextField.text, !textEmail.isEmpty, !textPassword.isEmpty else {
                addAlert()
                return
            }
            let secondVC = SecondViewController()
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    
    func addAnotherAccountButton() {
        anotherAccountButton.frame = CGRect(x: 100, y: 560, width: 200, height: 50)
        anotherAccountButton.setTitle("У меня уже есть аккаунт", for: .normal)
        anotherAccountButton.backgroundColor = .clear
        anotherAccountButton.setTitleColor(.black, for: .normal)
        anotherAccountButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(anotherAccountButton)
        anotherAccountButton.addTarget(self, action: #selector(anotherAccountButtonTapped), for: .touchUpInside)
    }
    
    @objc func anotherAccountButtonTapped() {
        let alert = UIAlertController(title: "Войдите в Ваш аккаунт", message: "Если у вас уже есть аккаунт, введите Email и пароль", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "ОК", style: .default) { (actionOK) in
            self.emailTextField.text = alert.textFields?[0].text
            self.passwordTextField.text = alert.textFields?[1].text
            self.nameTextField.removeFromSuperview()
            self.phoneTextField.removeFromSuperview()
            self.emailTextField.frame = CGRect(x: 30, y: 300, width: 330, height: 30)
            self.passwordTextField.frame = CGRect(x: 30, y: 350, width: 330, height: 30)
            self.signUpButton.frame = CGRect(x: 100, y: 400, width: 200, height: 50)
            self.signUpButton.setTitle("Вход", for: .normal)
            self.anotherAccountButton.removeFromSuperview()
            
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        alert.addTextField() { textField in
            textField.placeholder = "Введите Email"
            textField.keyboardType = .emailAddress
        }
        alert.addTextField() { textField in
            textField.placeholder = "Введите пароль"
            textField.isSecureTextEntry = true
            textField.textContentType = .none
        }
        present(alert, animated: true)
        
    }
    //MARK: - TextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            phoneTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
}

