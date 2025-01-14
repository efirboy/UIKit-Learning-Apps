//
//  CityController.swift
//  UITabBarController(my app)
//
//  Created by Alexandr Garkalin on 09.09.2024.
//

import UIKit

class CityController: UIViewController {

    let labelChooseCity = UILabel()
    let searchTextField = UITextField()
    let buttonCancel = UIButton()
    let horizontLine1 = UIView()
    let buttonAddCity = UIButton()
    let horizontLine2 = UIView()
    var firstVC: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)

        // реализация методов
        addLabelChooseCity()
        addSearchTextField()
        addButtonCancel()
        addHorizontLine1()
        addButtonAddCity()
        addHorizontLine2()
        
    }
    
    //MARK: - Methods
    
    func addLabelChooseCity() {
        labelChooseCity.frame = CGRect(x: 100, y: 3, width: 200, height: 50)
        labelChooseCity.text = "Выбрать город"
        labelChooseCity.textColor = .white
        labelChooseCity.font = UIFont.systemFont(ofSize: 12)
        labelChooseCity.textAlignment = .center
        view.addSubview(labelChooseCity)
    }
    
    func addSearchTextField() {
        searchTextField.frame = CGRect(x: 20, y: 50, width: 250, height: 30)
        searchTextField.borderStyle = .roundedRect
        searchTextField.placeholder = "Поиск"
        searchTextField.backgroundColor = .systemGray2
        let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchIcon.tintColor = .gray
        searchTextField.leftView = searchIcon
        searchTextField.leftViewMode = .always
        let microphoneIcon = UIImageView(image: UIImage(systemName: "mic.fill"))
        microphoneIcon.tintColor = .gray
        searchTextField.rightView = microphoneIcon
        searchTextField.rightViewMode = .always
        view.addSubview(searchTextField)
    }
    
    func addButtonCancel() {
        buttonCancel.frame = CGRect(x: 255, y: 40, width: 150, height: 50)
        buttonCancel.setTitle("Отменить", for: .normal)
        buttonCancel.setTitleColor(.systemOrange, for: .normal)
        view.addSubview(buttonCancel)
        buttonCancel.addTarget(self, action: #selector(buttonCancelTapped), for: .touchUpInside)
    }
    
    @objc func buttonCancelTapped() {
        dismiss(animated: true)
    }
    
    func addHorizontLine1() {
        horizontLine1.frame = CGRect(x: 20, y: 100, width: 500, height: 0.3)
        horizontLine1.backgroundColor = .systemGray
        view.addSubview(horizontLine1)
    }
    
    func addButtonAddCity() {
        buttonAddCity.frame = CGRect(x: 20, y: 95, width: 150, height: 50)
        buttonAddCity.setTitle("Казань, Россия", for: .normal)
        buttonAddCity.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        buttonAddCity.setTitleColor(.white, for: .normal)
        view.addSubview(buttonAddCity)
        buttonAddCity.addTarget(self, action: #selector(buttonAddCityTapped), for: .touchUpInside)
    }
    
    @objc func buttonAddCityTapped() {
        let city = buttonAddCity.titleLabel?.text
        let parts = city?.split(separator: ",")
        let itog = parts?.first?.trimmingCharacters(in: .whitespaces)
        firstVC?.name = itog
        firstVC?.addNewCity()
        dismiss(animated: true)
    }
    
    func addHorizontLine2() {
        horizontLine2.frame = CGRect(x: 20, y: 140, width: 500, height: 0.3)
        horizontLine2.backgroundColor = .systemGray
        view.addSubview(horizontLine2)
    }
}
