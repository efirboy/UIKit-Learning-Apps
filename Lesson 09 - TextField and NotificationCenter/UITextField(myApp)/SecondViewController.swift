//
//  SecondViewController.swift
//  UITextField(myApp)
//
//  Created by Alexandr Garkalin on 16.09.2024.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 6
    }
    
    let photoView = UIImageView()
    var selectShowPhotoSegment = UISegmentedControl()
    let backgroundTextField = UITextField()
    let pickerColor = UIPickerView()
    var colorArray = ["Красный", "Зеленый", "Синий", "Черный", "Белый", "Серый"]
    var selectColor: String?
    let positionSlider = UISlider()
    let blockSwitch = UISwitch()
    let shareButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // реализация методов
        addPhotoView()
        addSelectShowPhotoSegment()
        addBackgroundTextField()
        addPositionSlider()
        addBlockSwitch()
        addShareButton()
    }
    
    //MARK: - Methods
    
    func addPhotoView() {
        photoView.frame = CGRect(x: 140, y: 100, width: 150, height: 200)
        photoView.image = UIImage(named: "photo")
        view.addSubview(photoView)
    }
    
    func addSelectShowPhotoSegment() {
        selectShowPhotoSegment = UISegmentedControl(items: ["Показать фото", "Скрыть фото"])
        selectShowPhotoSegment.frame = CGRect(x: 50, y: 300, width: 300, height: 50)
        selectShowPhotoSegment.selectedSegmentIndex = 0
        selectShowPhotoSegment.addTarget(self, action: #selector(selectShowPhotoSegmentChange), for: .valueChanged)
        view.addSubview(selectShowPhotoSegment)
    }
    
    @objc func selectShowPhotoSegmentChange() {
        if selectShowPhotoSegment.selectedSegmentIndex == 0 {
            view.addSubview(photoView)
        } else {
            photoView.removeFromSuperview()
        }
    }
    
    func addBackgroundTextField() {
        backgroundTextField.frame = CGRect(x: 50, y: 370, width: 310, height: 31)
        backgroundTextField.placeholder = "Выберите цвет фона"
        backgroundTextField.borderStyle = .roundedRect
        backgroundTextField.delegate = self
        view.addSubview(backgroundTextField)
    }
    
    func addPositionSlider() {
        positionSlider.frame = CGRect(x: 50, y: 420, width: 310, height: 30)
        positionSlider.minimumValue = 0
        positionSlider.maximumValue = 350
        positionSlider.minimumValueImage = UIImage(systemName: "minus.circle.fill")
        positionSlider.maximumValueImage = UIImage(systemName: "plus.circle.fill")
        positionSlider.value = 175
        view.addSubview(positionSlider)
        positionSlider.addTarget(self, action: #selector(positionSliderChange), for: .valueChanged)
    }
    
    @objc func positionSliderChange() {
        photoView.frame = CGRect(x: CGFloat(positionSlider.value), y: 100, width: 150, height: 200)
    }
    
    func addBlockSwitch() {
        blockSwitch.frame = CGRect(x: 160, y: 500, width: 100, height: 50)
        view.addSubview(blockSwitch)
        blockSwitch.addTarget(self, action: #selector(blockSwitchChange), for: .valueChanged)
    }
    
    @objc func blockSwitchChange() {
        if blockSwitch.isOn {
            positionSlider.isUserInteractionEnabled = false
        } else {
            positionSlider.isUserInteractionEnabled = true
        }
    }
    
    //MARK: - TextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == backgroundTextField {
            backgroundTextField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        pickerColor.delegate = self
        pickerColor.dataSource = self
        backgroundTextField.inputView = pickerColor
        
        // настройка Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let buttonCancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(buttonCancelTapped))
        let buttonDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(buttonDoneTapped))
        
        toolbar.setItems([buttonCancel, buttonDone], animated: false)
        backgroundTextField.inputAccessoryView = toolbar
        
    }
    
    @objc func buttonCancelTapped() {
        view.backgroundColor = .white
        backgroundTextField.resignFirstResponder()
    }
    
    @objc func buttonDoneTapped() {
        switch selectColor {
        case "Красный": view.backgroundColor = .systemRed
        case "Зеленый": view.backgroundColor = .systemGreen
        case "Синий": view.backgroundColor = .systemBlue
        case "Черный": view.backgroundColor = .black
        case "Белый": view.backgroundColor = .white
        case "Серый": view.backgroundColor = .systemGray
        default: view.backgroundColor = .systemRed
        }
        backgroundTextField.text = selectColor
        backgroundTextField.resignFirstResponder()
    }
    
    func addShareButton() {
        shareButton.frame = CGRect(x: 290, y: 50, width: 100, height: 100)
        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        view.addSubview(shareButton)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
    }
    
    @objc func shareButtonTapped() {
        let activity = UIActivityViewController(activityItems: ["Hello"], applicationActivities: nil)
        present(activity, animated: true)
    }
    

    //MARK: - PickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectColor = colorArray[row]
    }
}
