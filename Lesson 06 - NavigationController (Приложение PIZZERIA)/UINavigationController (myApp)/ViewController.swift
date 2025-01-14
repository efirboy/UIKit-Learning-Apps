//
//  ViewController.swift
//  UINavigationController (myApp)
//
//  Created by Alexandr Garkalin on 05.09.2024.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let imageLogo = UIImageView()
    let labelNumber = UILabel()
    let textFieldNumber = UITextField()
    let labelPassword = UILabel()
    let textFieldPasspord = UITextField()
    let buttonSign = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Вход"
        navigationItem.titleView = UIView()
        
        // клавиатура
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        // установка фона
        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "backgroundImage")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage) 
        
        // реализация методов
        addImageLogo()
        addLabelNumber()
        addTextFieldNumber()
        addLabelPassword()
        addTextFieldPassword()
        addButtonSign()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let apperance = UINavigationBarAppearance()
        apperance.configureWithTransparentBackground()
        apperance.backgroundColor = .clear
        
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
    }
    
    //MARK: - Methods
    
    @objc func dismissKeyboard() {
        view.endEditing(true) // Закрывает клавиатуру
    }
    
    func addImageLogo() {
        imageLogo.frame = CGRect(x: 75, y: 120, width: 250, height: 200)
        imageLogo.image = UIImage(named: "logo.png")
        view.addSubview(imageLogo)
    }
    
    func addLabelNumber() {
        labelNumber.frame = CGRect(x: 30, y: 300, width: 150, height: 50)
        labelNumber.text = "Номер телефона"
        labelNumber.font = UIFont(name: "AmericanTypewriter-CondensedBold", size: 18)
        labelNumber.textColor = .black
        view.addSubview(labelNumber)
    }
    
    func addTextFieldNumber() {
        textFieldNumber.frame = CGRect(x: 30, y: 345, width: 300, height: 50)
        textFieldNumber.placeholder = "Введите номер телефона"
        textFieldNumber.borderStyle = .roundedRect
        textFieldNumber.keyboardType = .phonePad
        view.addSubview(textFieldNumber)
    }
    
    func addLabelPassword() {
        labelPassword.frame = CGRect(x: 30, y: 400, width: 150, height: 50)
        labelPassword.text = "Пароль"
        labelPassword.font = UIFont(name: "AmericanTypewriter-CondensedBold", size: 18)
        labelPassword.textColor = .black
        view.addSubview(labelPassword)
    }
    
    func addTextFieldPassword() {
        textFieldPasspord.frame = CGRect(x: 30, y: 445, width: 300, height: 50)
        textFieldPasspord.placeholder = "Введите пароль"
        textFieldPasspord.borderStyle = .roundedRect
        textFieldPasspord.autocapitalizationType = .none
        textFieldPasspord.autocorrectionType = .no
        textFieldPasspord.isSecureTextEntry = true
        textFieldPasspord.delegate = self
        view.addSubview(textFieldPasspord)
    }
    
    func addButtonSign() {
        buttonSign.frame = CGRect(x: 70, y: 540, width: 250, height: 50)
        buttonSign.setTitle("Вход", for: .normal)
        buttonSign.backgroundColor = .systemBlue
        buttonSign.layer.cornerRadius = 12
        view.addSubview(buttonSign)
        buttonSign.addTarget(self, action: #selector(buttonSignTapped), for: .touchUpInside)
    }
    
    @objc func buttonSignTapped() {
        guard let text1 = textFieldNumber.text, let text2 = textFieldPasspord.text, text1.count != 0, text2.count != 0 else {
            let alert = UIAlertController(title: "Введите действительный номер и пароль", message: nil, preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default)
            alert.addAction(actionOK)
            self.present(alert, animated: true)
            return
        }
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
    
    //MARK: - UITextFieldPasswordDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldPasspord.resignFirstResponder()
        return true
    }
}

