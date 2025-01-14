//
//  BaseBookViewController.swift
//  UITextView(myApp)
//
//  Created by Alexandr Garkalin on 17.09.2024.
//

import UIKit

class BaseBookViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    

    //MARK: - Объекты
    let bookTextView = UITextView()
    let textAttributesButton = UIButton()
    let attributesView = UIView()
    let lowALabel = UILabel()
    let highALabel = UILabel()
    let sliderSizeText = UISlider()
    let themeOneButton = UIButton()
    let themeTwoButton = UIButton()
    let themeThreeButton = UIButton()
    let themeFourButton = UIButton()
    var segmentBoldText = UISegmentedControl()
    let nightModeLabel = UILabel()
    let nightModeSwitch = UISwitch()
    let fontPicker = UIPickerView()
    var fontArray = ["Helvetica", "AmericanTypewriter", "Courier", "Cochin-Italic", "Georgia"]
    var selectFont: String?
    let shareButton = UIButton()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Добавляем UITapGestureRecognizer для скрытия attributesView
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideAttributesView))
            bookTextView.addGestureRecognizer(tapGesture)
        
        // Реализация методов
        changeBarAttributes()
        addBookTextView()
        addTextAttributesButton()
        addSliderSizeText()
        addLabelLowA()
        addLabelHighA()
        addThemeOneButton()
        addThemeTwoButton()
        addThemeThreeButton()
        addThemeFourButton()
        addSegmentBoldText()
        addNightModeLabel()
        addNightModeSwitch()
        addFontPicker()
        addShareButton()
        
    }
    
    //MARK: - Methods
    
    func changeBarAttributes() {
        // настройка заголовка
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.black.withAlphaComponent(0.5)
        ]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
        // убираем клавишу Back
        navigationItem.hidesBackButton = true
        // добавляем крестик, закрывающий книгу и возвращающий на главный экран
        let rightIcon = UIImage(systemName: "xmark.circle")
        let rightButton = UIBarButtonItem(image: rightIcon, style: .plain, target: self, action: #selector(rightButtonTapped))
        rightButton.tintColor = .gray
        navigationItem.rightBarButtonItem = rightButton
    }
    
    // возврат на главный экран при нажатии на крестик
    @objc func rightButtonTapped() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.black]
        UIView.transition(with: navigationController!.view, duration: 0.3, options: .transitionCrossDissolve, animations: {
                self.navigationController?.popViewController(animated: false)
            })
    }
    
    func addBookTextView() {
        bookTextView.frame = CGRect(x: 20, y: 100, width: 350, height: 670)
        bookTextView.isEditable = false
        bookTextView.font = UIFont(name: "Helvetica", size: 14)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        let attributedText = NSAttributedString(string: bookTextView.text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        bookTextView.attributedText = attributedText
        view.addSubview(bookTextView)
    }
    
    func addTextAttributesButton() {
        textAttributesButton.frame = CGRect(x: 330, y: 770, width: 40, height: 40)
        textAttributesButton.setTitle("aA", for: .normal)
        textAttributesButton.backgroundColor = .systemGray4
        textAttributesButton.alpha = 0.5
        textAttributesButton.setTitleColor(.black, for: .normal)
        textAttributesButton.layer.cornerRadius = 12
        view.addSubview(textAttributesButton)
        textAttributesButton.addTarget(self, action: #selector(textAttributesButtonTapped), for: .touchUpInside)
    }
    
    func addAttributesView() {
        // создаем вью для отображения настроек текста
        attributesView.frame = CGRect(x: 20, y: 560, width: 350, height: 210)
        attributesView.backgroundColor = .systemGray6
        attributesView.layer.cornerRadius = 15
        view.addSubview(attributesView)
    }
    
    @objc func textAttributesButtonTapped() {
        if attributesView.isDescendant(of: view) {
            attributesView.removeFromSuperview()
        } else {
            addAttributesView()
        }
        
    }
    
    func addLabelLowA() {
        lowALabel.frame = CGRect(x: attributesView.bounds.minX + 30, y: attributesView.bounds.minY + 25, width: 20, height: 10)
        lowALabel.text = "A"
        lowALabel.textColor = .systemOrange
        lowALabel.font = UIFont.systemFont(ofSize: 14)
        attributesView.addSubview(lowALabel)
        
    }
    
    func addLabelHighA() {
        highALabel.frame = CGRect(x: attributesView.bounds.minX + 310, y: attributesView.bounds.minY + 20, width: 20, height: 20)
        highALabel.text = "A"
        highALabel.textColor = .systemOrange
        highALabel.font = UIFont.systemFont(ofSize: 20)
        attributesView.addSubview(highALabel)
        
    }
    
    func addSliderSizeText() {
        sliderSizeText.frame = CGRect(x: attributesView.bounds.minX + 50, y: attributesView.bounds.minY + 5, width: 250, height: 50)
        sliderSizeText.minimumValue = 14
        sliderSizeText.maximumValue = 32
        sliderSizeText.tintColor = .systemOrange
        attributesView.addSubview(sliderSizeText)
        sliderSizeText.addTarget(self, action: #selector(sliderSizeTextChange), for: .valueChanged)
    }
    
    @objc func sliderSizeTextChange() {
        if segmentBoldText.selectedSegmentIndex == 0 {
            bookTextView.font = UIFont(name: selectFont ?? "Helvetica", size: CGFloat(sliderSizeText.value))
        } else if segmentBoldText.selectedSegmentIndex == 1 {
            switch selectFont {
            case "Helvetica": bookTextView.font = UIFont(name: "Helvetica-Bold", size: CGFloat(sliderSizeText.value))
            case "AmericanTypewriter": bookTextView.font = UIFont(name: "AmericanTypewriter-Bold", size: CGFloat(sliderSizeText.value))
            case "Courier": bookTextView.font = UIFont(name: "Courier-Bold", size: CGFloat(sliderSizeText.value))
            case "Cochin-Italic": bookTextView.font = UIFont(name: "Cochin-BoldItalic", size: CGFloat(sliderSizeText.value))
            case "Georgia": bookTextView.font = UIFont(name: "Georgia-Bold", size: CGFloat(sliderSizeText.value))
            default: bookTextView.font = UIFont(name: "Helvetica-Bold", size: CGFloat(sliderSizeText.value))
            }
        }
    }
    
    func addThemeOneButton() {
        themeOneButton.frame = CGRect(x: attributesView.bounds.minX + 20, y: attributesView.bounds.minY + 50, width: 70, height: 50)
        themeOneButton.setTitle("Aa", for: .normal)
        themeOneButton.setTitleColor(.black, for: .normal)
        themeOneButton.backgroundColor = .white
        themeOneButton.layer.cornerRadius = 12
        attributesView.addSubview(themeOneButton)
        themeOneButton.addTarget(self, action: #selector(themeOneButtonTapped), for: .touchUpInside)
    }
    
    @objc func themeOneButtonTapped() {
        view.backgroundColor = .white
        bookTextView.backgroundColor = .white
        bookTextView.textColor = .black
        themeOneButton.layer.borderWidth = 2.0
        themeOneButton.layer.borderColor = UIColor.black.cgColor
        themeTwoButton.layer.borderWidth = 0.0
        themeThreeButton.layer.borderWidth = 0.0
        themeFourButton.layer.borderWidth = 0.0
        nightModeSwitch.isOn = false
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.black.withAlphaComponent(0.5)
        ]
        shareButton.tintColor = .systemGray
        navigationItem.rightBarButtonItem?.tintColor = .gray
    }
    
    func addThemeTwoButton() {
        themeTwoButton.frame = CGRect(x: attributesView.bounds.minX + 100, y: attributesView.bounds.minY + 50, width: 70, height: 50)
        themeTwoButton.setTitle("Aa", for: .normal)
        themeTwoButton.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .normal)
        themeTwoButton.backgroundColor = .systemGray
        themeTwoButton.layer.cornerRadius = 12
        attributesView.addSubview(themeTwoButton)
        themeTwoButton.addTarget(self, action: #selector(themeTwoButtonTapped), for: .touchUpInside)
    }
    
    @objc func themeTwoButtonTapped() {
        view.backgroundColor = .systemGray
        bookTextView.backgroundColor = .systemGray
        bookTextView.textColor = UIColor.white.withAlphaComponent(0.7)
        themeTwoButton.layer.borderWidth = 2.0
        themeTwoButton.layer.borderColor = UIColor.black.cgColor
        themeOneButton.layer.borderWidth = 0.0
        themeThreeButton.layer.borderWidth = 0.0
        themeFourButton.layer.borderWidth = 0.0
        nightModeSwitch.isOn = false
        self.navigationController?.navigationBar.barTintColor = .systemGray4
        self.navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.black.withAlphaComponent(0.5)
        ]
        shareButton.tintColor = .white
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    func addThemeThreeButton() {
        themeThreeButton.frame = CGRect(x: attributesView.bounds.minX + 180, y: attributesView.bounds.minY + 50, width: 70, height: 50)
        themeThreeButton.setTitle("Aa", for: .normal)
        themeThreeButton.setTitleColor(.white, for: .normal)
        themeThreeButton.backgroundColor = .black
        themeThreeButton.layer.cornerRadius = 12
        attributesView.addSubview(themeThreeButton)
        themeThreeButton.addTarget(self, action: #selector(themeThreeButtonTapped), for: .touchUpInside)
    }
    
    @objc func themeThreeButtonTapped() {
        view.backgroundColor = .black
        bookTextView.backgroundColor = .black
        bookTextView.textColor = .white
        themeThreeButton.layer.borderWidth = 2.0
        themeThreeButton.layer.borderColor = UIColor.white.cgColor
        themeOneButton.layer.borderWidth = 0.0
        themeTwoButton.layer.borderWidth = 0.0
        themeFourButton.layer.borderWidth = 0.0
        nightModeSwitch.isOn = true
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white.withAlphaComponent(0.5)
        ]
        shareButton.tintColor = .systemGray
        navigationItem.rightBarButtonItem?.tintColor = .gray
    }
    
    func addThemeFourButton() {
        themeFourButton.frame = CGRect(x: attributesView.bounds.minX + 260, y: attributesView.bounds.minY + 50, width: 70, height: 50)
        themeFourButton.setTitle("Aa", for: .normal)
        themeFourButton.setTitleColor(.black, for: .normal)
        themeFourButton.backgroundColor = .systemOrange
        themeFourButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        themeFourButton.layer.cornerRadius = 12
        attributesView.addSubview(themeFourButton)
        themeFourButton.addTarget(self, action: #selector(themeFourButtonTapped), for: .touchUpInside)
    }
    
    @objc func themeFourButtonTapped() {
        view.backgroundColor = .systemOrange
        bookTextView.backgroundColor = .systemOrange
        bookTextView.textColor = UIColor.black.withAlphaComponent(0.7)
        themeFourButton.layer.borderWidth = 2.0
        themeFourButton.layer.borderColor = UIColor.black.cgColor
        themeOneButton.layer.borderWidth = 0.0
        themeTwoButton.layer.borderWidth = 0.0
        themeThreeButton.layer.borderWidth = 0.0
        nightModeSwitch.isOn = false
        self.navigationController?.navigationBar.barTintColor = .systemOrange
        self.navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.black.withAlphaComponent(0.5)
        ]
        shareButton.tintColor = .systemGray
        navigationItem.rightBarButtonItem?.tintColor = .gray
    }
    
    func addSegmentBoldText() {
        segmentBoldText = UISegmentedControl(items: ["a", "A"])
        let boldAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 18)]
        segmentBoldText.setTitleTextAttributes(boldAttributes, for: .normal)
        segmentBoldText.selectedSegmentIndex = 0
        segmentBoldText.frame = CGRect(x: attributesView.bounds.minX + 20, y: attributesView.bounds.minY + 115, width: 150, height: 30)
        attributesView.addSubview(segmentBoldText)
        segmentBoldText.addTarget(self, action: #selector(segmentBoldTextChange), for: .valueChanged)
    }
    
    @objc func segmentBoldTextChange() {
        if segmentBoldText.selectedSegmentIndex == 0 {
            bookTextView.font = UIFont(name: selectFont ?? "Helvetica", size: CGFloat(sliderSizeText.value))
        } else if segmentBoldText.selectedSegmentIndex == 1 {
            switch selectFont {
            case "Helvetica": bookTextView.font = UIFont(name: "Helvetica-Bold", size: CGFloat(sliderSizeText.value))
            case "AmericanTypewriter": bookTextView.font = UIFont(name: "AmericanTypewriter-Bold", size: CGFloat(sliderSizeText.value))
            case "Courier": bookTextView.font = UIFont(name: "Courier-Bold", size: CGFloat(sliderSizeText.value))
            case "Cochin-Italic": bookTextView.font = UIFont(name: "Cochin-BoldItalic", size: CGFloat(sliderSizeText.value))
            case "Georgia": bookTextView.font = UIFont(name: "Georgia-Bold", size: CGFloat(sliderSizeText.value))
            default: bookTextView.font = UIFont(name: "Helvetica-Bold", size: CGFloat(sliderSizeText.value))
            }
        }
    }
    
    func addNightModeLabel() {
        nightModeLabel.frame = CGRect(x: attributesView.bounds.minX + 180, y: attributesView.bounds.minY + 110, width: 100, height: 40)
        nightModeLabel.text = "Night mode:"
        nightModeLabel.textColor = .black
        attributesView.addSubview(nightModeLabel)
    }
    
    func addNightModeSwitch() {
        nightModeSwitch.frame = CGRect(x: attributesView.bounds.minX + 280, y: attributesView.bounds.minY + 115, width: 100, height: 50)
        nightModeSwitch.thumbTintColor = .systemOrange
        nightModeSwitch.onTintColor = .white
        attributesView.addSubview(nightModeSwitch)
        nightModeSwitch.addTarget(self, action: #selector(nightModeSwitchChange), for: .valueChanged)
    }
    
    @objc func nightModeSwitchChange() {
        if nightModeSwitch.isOn {
            view.backgroundColor = .black
            bookTextView.backgroundColor = .black
            bookTextView.textColor = UIColor.white
            themeTwoButton.layer.borderWidth = 0.0
            themeThreeButton.layer.borderColor = UIColor.white.cgColor
            themeOneButton.layer.borderWidth = 0.0
            themeThreeButton.layer.borderWidth = 2.0
            themeFourButton.layer.borderWidth = 0.0
            attributesView.backgroundColor = .systemGray5
            self.navigationController?.navigationBar.barTintColor = .black
            self.navigationController?.navigationBar.titleTextAttributes = [
                .font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white.withAlphaComponent(0.5)
            ]
        } else if nightModeSwitch.isOn == false {
            view.backgroundColor = .white
            bookTextView.backgroundColor = .white
            bookTextView.textColor = UIColor.black
            themeTwoButton.layer.borderWidth = 0.0
            themeOneButton.layer.borderColor = UIColor.black.cgColor
            themeOneButton.layer.borderWidth = 2.0
            themeThreeButton.layer.borderWidth = 0.0
            themeFourButton.layer.borderWidth = 0.0
            attributesView.backgroundColor = .systemGray6
            self.navigationController?.navigationBar.barTintColor = .white
            self.navigationController?.navigationBar.titleTextAttributes = [
                .font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.black.withAlphaComponent(0.5)
            ]
        }
    }
    
    func addFontPicker() {
        fontPicker.frame = CGRect(x: attributesView.bounds.minX + 20, y: attributesView.bounds.minY + 150, width: 300, height: 50)
        fontPicker.delegate = self
        fontPicker.dataSource = self
        attributesView.addSubview(fontPicker)
    }
    
    // По касанию экрана (вне окна настроек) закрываем окно настроек
    @objc func hideAttributesView(_ sender: UITapGestureRecognizer) {
        let touchPoint = sender.location(in: self.view)
        if bookTextView.frame.contains(touchPoint) {
                attributesView.removeFromSuperview()
            }
    }
    
    func addShareButton() {
        shareButton.frame = CGRect(x: 20, y: 770, width: 40, height: 40)
        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareButton.layer.cornerRadius = 12
        shareButton.tintColor = .systemGray
        view.addSubview(shareButton)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
    }
    
    @objc func shareButtonTapped() {
        let activity = UIActivityViewController(activityItems: [bookTextView.text ?? "Текст"], applicationActivities: nil)
        present(activity, animated: true)
    }
    
    //MARK: - PickerView Delegate Methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectFont = fontArray[row]
        if segmentBoldText.selectedSegmentIndex == 0 {
            bookTextView.font = UIFont(name: selectFont ?? "Helvetica", size: CGFloat(sliderSizeText.value))
        } else if segmentBoldText.selectedSegmentIndex == 1 {
            switch selectFont {
            case "Helvetica": bookTextView.font = UIFont(name: "Helvetica-Bold", size: CGFloat(sliderSizeText.value))
            case "AmericanTypewriter": bookTextView.font = UIFont(name: "AmericanTypewriter-Bold", size: CGFloat(sliderSizeText.value))
            case "Courier": bookTextView.font = UIFont(name: "Courier-Bold", size: CGFloat(sliderSizeText.value))
            case "Cochin-Italic": bookTextView.font = UIFont(name: "Cochin-BoldItalic", size: CGFloat(sliderSizeText.value))
            case "Georgia": bookTextView.font = UIFont(name: "Georgia-Bold", size: CGFloat(sliderSizeText.value))
            default: bookTextView.font = UIFont(name: "Helvetica-Bold", size: CGFloat(sliderSizeText.value))
            }
        }
    }
}
