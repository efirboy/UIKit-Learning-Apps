//
//  ThirdViewController.swift
//  UIPickerView (my app)
//
//  Created by Alexandr Garkalin on 26.08.2024.
//

import UIKit

class ThirdViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    let buttonCancel = UIButton()
    var image = UIImageView()
    let buttonChangePhoto = UIButton()
    let labelName = UILabel()
    let textFieldName = UITextField()
    let horizontLine1 = UIView()
    let labelDate = UILabel()
    let buttonPickerDate = UIButton()
    let datePicker = UIDatePicker()
    let horizontLine2 = UIView()
    let buttonPickerAge = UIButton()
    let labelAge = UILabel()
    let pickerAge = UIPickerView()
    let horizontLine3 = UIView()
    let labelGender = UILabel()
    let buttonGender = UIButton()
    let pickerGender = UIPickerView()
    let horizontLine4 = UIView()
    let labelInsta = UILabel()
    let buttonInsta = UIButton()
    let horizontLine5 = UIView()
    let buttonAdd = UIButton()
    
    let option = (0...99).map { "\($0)" }
    var selectedOption: String? = ""
    
    let genderArray: Array<String> = ["Мужской", "Женский"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем распознаватель жестов
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        let rightButton = UIBarButtonItem(customView: buttonAdd)
        self.navigationItem.rightBarButtonItem = rightButton
        
        self.view.backgroundColor = .white
        
        print(self.navigationController != nil ? "Есть NavigationController" : "Нет NavigationController")
        
        addImage()
        addButtonChangePhoto()
        addLabelName()
        addTextFieldName()
        addHorizontLine1()
        addLabelDate()
        addPickerButton()
        addHorizontLine2()
        addLabelAge()
        addButtonPickerAge()
        addHorizontLine3()
        addLabelGender()
        addButtonGender()
        addHorizontLine4()
        addLabelInsta()
        addButtonInsta()
        addHorizontLine5()
        addButtonAdd()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true) // Закрывает клавиатуру
    }
    
    func addImage() {
        image.frame = CGRect(x: 120, y: 70, width: 160, height: 160)
        image.image = UIImage(named: "NewCat")
        image.clipsToBounds = true
        image.layer.cornerRadius = 30
        self.view.addSubview(image)
    }
    
    func addButtonChangePhoto() {
        buttonChangePhoto.frame = CGRect(x: 140, y: 235, width: 120, height: 20)
        buttonChangePhoto.setTitle("Изменить фото", for: .normal)
        buttonChangePhoto.backgroundColor = .clear
        buttonChangePhoto.setTitleColor(.systemBlue, for: .normal)
        buttonChangePhoto.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        self.view.addSubview(buttonChangePhoto)
        buttonChangePhoto.addTarget(self, action: #selector(selectPhoto), for: .touchUpInside)
        
    }
    
    @objc func selectPhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            image.image = selectedImage
        }
        
    dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func addLabelName() {
        labelName.frame = CGRect(x: 30, y: 280, width: 150, height: 50)
        labelName.text = "Имя"
        labelName.textAlignment = .left
        labelName.font = UIFont(name: "Avenir-HeavyOblique", size: 14)
        labelName.textColor = .systemBlue
        self.view.addSubview(labelName)
    }
    
    func addTextFieldName() {
        textFieldName.frame = CGRect(x: 30, y: 310, width: 300, height: 50)
        textFieldName.placeholder = "Введите имя"
        self.view.addSubview(textFieldName)
    }
    
    func addHorizontLine1() {
        horizontLine1.frame = CGRect(x: 30, y: 355, width: 320, height: 1)
        horizontLine1.backgroundColor = .systemGray
        self.view.addSubview(horizontLine1)
    }
    
    func addLabelDate() {
        labelDate.frame = CGRect(x: 30, y: 360, width: 150, height: 50)
        labelDate.text = "Дата"
        labelDate.textAlignment = .left
        labelDate.font = UIFont(name: "Avenir-HeavyOblique", size: 14)
        labelDate.textColor = .systemBlue
        self.view.addSubview(labelDate)
    }
    
    func addPickerButton() {
        buttonPickerDate.frame = CGRect(x: 30, y: 390, width: 290, height: 50)
        buttonPickerDate.setTitle("Введите дату рождения", for: .normal)
        buttonPickerDate.contentHorizontalAlignment = .left
        buttonPickerDate.backgroundColor = .clear
        buttonPickerDate.setTitleColor(UIColor(_colorLiteralRed: 199/255, green: 199/255, blue: 205/255, alpha: 1.0), for: .normal)
        buttonPickerDate.titleLabel?.font = .systemFont(ofSize: 16)
        self.view.addSubview(buttonPickerDate)
        buttonPickerDate.addTarget(self, action: #selector(datePickerButton), for: .touchUpInside)
    }
    
    func addHorizontLine2() {
        horizontLine2.frame = CGRect(x: 30, y: 435, width: 320, height: 1)
        horizontLine2.backgroundColor = .systemGray
        self.view.addSubview(horizontLine2)
    }
    
    @objc func datePickerButton() {
        buttonPickerDate.setTitle("", for: .normal)
        datePicker.frame = CGRect(x: 10, y: 390, width: 145, height: 45)
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.datePickerMode = .date
        datePicker.maximumDate = .now
        self.view.addSubview(datePicker)
        datePicker.addTarget(self, action: #selector(dateChangeValue), for: .valueChanged)
    }
    
    @objc func dateChangeValue(_ param: UIDatePicker) {
        if param.isEqual(self.datePicker) {
            let formattedDate = DateFormatter()
            formattedDate.locale = Locale(identifier: "ru_RU")
            formattedDate.dateStyle = .long
            buttonPickerDate.frame = CGRect(x: 30, y: 390, width: 200, height: 50)
            buttonPickerDate.setTitleColor(.black, for: .normal)
            buttonPickerDate.setTitle(formattedDate.string(from: param.date), for: .normal)
            datePicker.removeFromSuperview()
        }
    }
    
    func addLabelAge() {
        labelAge.frame = CGRect(x: 30, y: 440, width: 150, height: 50)
        labelAge.text = "Возраст"
        labelAge.textAlignment = .left
        labelAge.font = UIFont(name: "Avenir-HeavyOblique", size: 14)
        labelAge.textColor = .systemBlue
        self.view.addSubview(labelAge)
    }
    
    func addButtonPickerAge() {
        buttonPickerAge.frame = CGRect(x: 30, y: 470, width: 290, height: 50)
        buttonPickerAge.setTitle("Добавить", for: .normal)
        buttonPickerAge.contentHorizontalAlignment = .left
        buttonPickerAge.backgroundColor = .clear
        buttonPickerAge.setTitleColor(UIColor(_colorLiteralRed: 199/255, green: 199/255, blue: 205/255, alpha: 1.0), for: .normal)
        buttonPickerAge.titleLabel?.font = .systemFont(ofSize: 16)
        self.view.addSubview(buttonPickerAge)
        buttonPickerAge.addTarget(self, action: #selector(addPickerAge), for: .touchUpInside)
    }
    
    @objc func addPickerAge() {
        pickerAge.frame = CGRect(x: 20, y: 470, width: 150, height: 50)
        pickerAge.dataSource = self
        pickerAge.delegate = self
        self.view.addSubview(pickerAge)
        buttonPickerAge.setTitle("", for: .normal)
    }
    
    func addHorizontLine3() {
        horizontLine3.frame = CGRect(x: 30, y: 515, width: 320, height: 1)
        horizontLine3.backgroundColor = .systemGray
        self.view.addSubview(horizontLine3)
    }
    
    func addLabelGender() {
        labelGender.frame = CGRect(x: 30, y: 520, width: 150, height: 50)
        labelGender.text = "Пол"
        labelGender.textAlignment = .left
        labelGender.font = UIFont(name: "Avenir-HeavyOblique", size: 14)
        labelGender.textColor = .systemBlue
        self.view.addSubview(labelGender)
    }
    
    func addButtonGender() {
        buttonGender.frame = CGRect(x: 30, y: 550, width: 290, height: 50)
        buttonGender.setTitle("Добавить", for: .normal)
        buttonGender.contentHorizontalAlignment = .left
        buttonGender.backgroundColor = .clear
        buttonGender.setTitleColor(UIColor(_colorLiteralRed: 199/255, green: 199/255, blue: 205/255, alpha: 1.0), for: .normal)
        buttonGender.titleLabel?.font = .systemFont(ofSize: 16)
        self.view.addSubview(buttonGender)
        buttonGender.addTarget(self, action: #selector(buttonGenderTapped), for: .touchUpInside)
    }
    
    @objc func buttonGenderTapped() {
        pickerGender.frame = CGRect(x: 30, y: 550, width: 150, height: 50)
        pickerGender.dataSource = self
        pickerGender.delegate = self
        self.view.addSubview(pickerGender)
        buttonGender.setTitle("", for: .normal)
    }
    
    func addHorizontLine4() {
        horizontLine4.frame = CGRect(x: 30, y: 595, width: 320, height: 1)
        horizontLine4.backgroundColor = .systemGray
        self.view.addSubview(horizontLine4)
    }
    
    func addLabelInsta() {
        labelInsta.frame = CGRect(x: 30, y: 600, width: 150, height: 50)
        labelInsta.text = "Instagram"
        labelInsta.textAlignment = .left
        labelInsta.font = UIFont(name: "Avenir-HeavyOblique", size: 14)
        labelInsta.textColor = .systemBlue
        self.view.addSubview(labelInsta)
    }
    
    func addButtonInsta() {
        buttonInsta.frame = CGRect(x: 30, y: 630, width: 290, height: 50)
        buttonInsta.setTitle("Добавить", for: .normal)
        buttonInsta.contentHorizontalAlignment = .left
        buttonInsta.backgroundColor = .clear
        buttonInsta.setTitleColor(UIColor(_colorLiteralRed: 199/255, green: 199/255, blue: 205/255, alpha: 1.0), for: .normal)
        buttonInsta.titleLabel?.font = .systemFont(ofSize: 16)
        self.view.addSubview(buttonInsta)
        buttonInsta.addTarget(self, action: #selector(buttonInstaTapped), for: .touchUpInside)
    }
    
    @objc func buttonInstaTapped() {
        let alert = UIAlertController(title: "Введите логин Instagram", message: nil, preferredStyle: .alert)
        alert.addTextField()
        alert.textFields![0].placeholder = "Например SuperCat"
        let alertCancel = UIAlertAction(title: "Отмена", style: .cancel)
        let alertOK = UIAlertAction(title: "OK", style: .default) { (actionOK) in
            if alert.textFields![0].text?.isEmpty == true {
                self.buttonInsta.setTitle("Добавить", for: .normal)
                self.buttonInsta.contentHorizontalAlignment = .left
                self.buttonInsta.backgroundColor = .clear
                self.buttonInsta.setTitleColor(UIColor(_colorLiteralRed: 199/255, green: 199/255, blue: 205/255, alpha: 1.0), for: .normal)
                self.buttonInsta.titleLabel?.font = .systemFont(ofSize: 16)
            } else {
                self.buttonInsta.setTitle(alert.textFields?[0].text, for: .normal)
                self.buttonInsta.setTitleColor(.black, for: .normal)
            }
        }
        alert.addAction(alertOK)
        alert.addAction(alertCancel)
        present(alert, animated: true)
    }
    
    func addHorizontLine5() {
        horizontLine5.frame = CGRect(x: 30, y: 675, width: 320, height: 1)
        horizontLine5.backgroundColor = .systemGray
        self.view.addSubview(horizontLine5)
    }
    
    func addButtonAdd() {
        buttonAdd.frame = CGRect(x: 280, y: 100, width: 100, height: 20)
        buttonAdd.setTitle("Добавить", for: .normal)
        buttonAdd.backgroundColor = .clear
        buttonAdd.setTitleColor(.systemBlue, for: .normal)
        buttonAdd.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.view.addSubview(buttonAdd)
        buttonAdd.addTarget(self, action: #selector(adding), for: .touchUpInside)
    }
    
    @objc func adding() {
        if let text = textFieldName.text, let textBirthday = buttonPickerDate.titleLabel?.text, let textAge = buttonPickerAge.titleLabel?.text, let textGender = buttonGender.titleLabel?.text, !text.isEmpty, textBirthday != "Введите дату рождения", textAge != "Добавить", textGender != "Добавить" {
    
            let secondViewController = SecondViewController()
            secondViewController.imageAdd = self.image
            secondViewController.StringNameAdd = self.textFieldName.text
            secondViewController.datePickerWithDateAdd = self.datePicker
            secondViewController.addNewUser()
            self.navigationController?.pushViewController(secondViewController, animated: true)

        } else {
            let alert = UIAlertController(title: "Введите корректные данные", message: "Необходимо заполнить все поля, Instagram при наличии", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default)
            alert.addAction(actionOK)
            present(alert, animated: true)
        }
    }
}

extension ThirdViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerAge {
            return 99
        } else if pickerView == pickerGender {
            return 2
        }
        return 0
    }

}

extension ThirdViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerAge {
            return option[row]
        } else if pickerView == pickerGender {
            return genderArray[row]
        }
        return nil
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerAge {
            let selectedValue = option[row]
            buttonPickerAge.setTitle("\(selectedValue)", for: .normal)
            buttonPickerAge.setTitleColor(.black, for: .normal)
            pickerAge.removeFromSuperview()
        } else if pickerView == pickerGender {
            let selectedValue = genderArray[row]
            buttonGender.setTitle("\(selectedValue)", for: .normal)
            buttonGender.setTitleColor(.black, for: .normal)
            pickerGender.removeFromSuperview()
        }
    }
}

