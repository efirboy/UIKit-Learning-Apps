//
//  ViewController.swift
//  UILabel(my app)
//
//  Created by Alexandr Garkalin on 12.09.2024.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == pickerNumberLines {
            return 1
        } else if pickerView == pickerColor {
            return 1
        } else if pickerView == pickerFont {
            return 1
        } else if pickerView == pickerLineMode {
            return 1
        } else if pickerView == pickerShadow {
            return 1
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerNumberLines {
            return 10
        } else if pickerView == pickerColor {
            return 5
        } else if pickerView == pickerFont {
            return 7
        } else if pickerView == pickerLineMode {
            return 6
        } else if pickerView == pickerShadow {
            return 3
        }
        return 0
    }
    
    
    let labelNumberLines = UILabel()
    let buttonNumberLines = UIButton()
    let pickerNumberLines = UIPickerView()
    
    let labelColor = UILabel()
    let buttonColor = UIButton()
    let pickerColor = UIPickerView()
    
    let labelFont = UILabel()
    let buttonFont = UIButton()
    let pickerFont = UIPickerView()
    
    let labelShadow = UILabel()
    let switchShadow = UISwitch()
    
    let labelLineMode = UILabel()
    let buttonLineMode = UIButton()
    let pickerLineMode = UIPickerView()
    
    let viewForLabel = UIView()
    let myLabel = UILabel()
    let sliderSizeText = UISlider()
    
    let pickerShadow = UIPickerView()
    
    var tekst: String?
    var arrayNumberLines = (0...9).map { "\($0)"}
    var arrayColor = ["Red", "Blue", "Green", "Orange", "Black"]
    var arrayFont = ["AlNile", "ArialMT", "Avenir-Black", "Didot", "Georgia", "Helvetica", "Kailasa"]
    var arrayLineMode = ["byCharWrapping", "byClipping", "byTruncatingHead", "byTruncatingMiddle", "byTruncatingTail","byWordWrapping"]
    var arrayShadow = ["Синий", "Красный", "Желтый"]
    var selectNumberLines: String?
    var selectColor: String?
    var selectFont: String?
    var selectLineMode: String?
    var selectShadow: String?

    var roundedValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // реализация методов
        addTabBarItem()
        addViewForLabel()
        addSliderSizeText()
        addlabelNumberLines()
        addButtonNumberLines()
        addLabelColor()
        addButtonColor()
        addLabelFont()
        addButtonFont()
        addLabelShadow()
        addSwitchShadow()
        addLabelLineMode()
        addButtonLineMode()
        addPickerShadow()
    }
    
    //MARK: - Methods
    
    func addTabBarItem() {
        let tabBarItem = UITabBarItem()
        tabBarItem.image = UIImage(systemName: "house.fill")
        tabBarItem.title = "Главная"
        self.tabBarItem = tabBarItem
    }
    
    func addViewForLabel() {
        viewForLabel.frame = CGRect(x: 50, y: 300, width: 300, height: 200)
        viewForLabel.backgroundColor = .clear
        viewForLabel.layer.borderWidth = 2
        viewForLabel.layer.borderColor = UIColor.systemRed.cgColor
        view.addSubview(viewForLabel)
    }
    
    func addlabelNumberLines() {
        labelNumberLines.frame = CGRect(x: 50, y: 560, width: 150, height: 50)
        labelNumberLines.text = "Количество строк"
        view.addSubview(labelNumberLines)
    }
    
    func addButtonNumberLines() {
        buttonNumberLines.frame = CGRect(x: 250, y: 560, width: 100, height: 50)
        buttonNumberLines.setTitle("1", for: .normal)
        buttonNumberLines.setTitleColor(.black, for: .normal)
        view.addSubview(buttonNumberLines)
        buttonNumberLines.addTarget(self, action: #selector(buttonNumberLinesTapped), for: .touchUpInside)
    }
    
    @objc func buttonNumberLinesTapped() {
        let alert = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        let actionDone = UIAlertAction(title: "Done", style: .cancel) { (actionOK) in
            if self.selectNumberLines == nil {
                self.buttonNumberLines.setTitle("0", for: .normal)
            } else {
                self.buttonNumberLines.setTitle("\(self.selectNumberLines ?? "1")", for: .normal) }
            self.myLabel.numberOfLines = Int((self.buttonNumberLines.titleLabel?.text)!)!
        }
        alert.addAction(actionDone)
        present(alert, animated: true)
        pickerNumberLines.delegate = self
        pickerNumberLines.dataSource = self
        pickerNumberLines.frame = CGRect(x: 0, y: 0, width: alert.view.bounds.width, height: 150)
        alert.view.addSubview(pickerNumberLines)
    }
    
    func addLabelColor() {
        labelColor.frame = CGRect(x: 50, y: 600, width: 150, height: 50)
        labelColor.text = "Цвет текста"
        view.addSubview(labelColor)
    }
    
    func addButtonColor() {
        buttonColor.frame = CGRect(x: 250, y: 600, width: 100, height: 50)
        buttonColor.setTitle("Black", for: .normal)
        buttonColor.setTitleColor(.black, for: .normal)
        view.addSubview(buttonColor)
        buttonColor.addTarget(self, action: #selector(buttonColorTapped), for: .touchUpInside)
    }
    
    @objc func buttonColorTapped() {
        let alert = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        let actionDone = UIAlertAction(title: "OK", style: .cancel) { (actionOK) in
            self.buttonColor.setTitle("\(self.selectColor!)", for: .normal)
            switch self.buttonColor.titleLabel?.text {
            case "Red": self.myLabel.textColor = .systemRed
            case "Blue": self.myLabel.textColor = .systemBlue
            case "Green": self.myLabel.textColor = .systemGreen
            case "Orange": self.myLabel.textColor = .systemOrange
            case "Black": self.myLabel.textColor = .black
            default: break
            }
        }
        alert.addAction(actionDone)
        present(alert, animated: true)
        pickerColor.delegate = self
        pickerColor.dataSource = self
        pickerColor.frame = CGRect(x: 0, y: 0, width: alert.view.bounds.width, height: 150)
        alert.view.addSubview(pickerColor)
    }
    
    func addLabelFont() {
        labelFont.frame = CGRect(x: 50, y: 640, width: 150, height: 50)
        labelFont.text = "Шрифт"
        view.addSubview(labelFont)
    }
    
    func addButtonFont() {
        buttonFont.frame = CGRect(x: 250, y: 640, width: 100, height: 50)
        buttonFont.setTitle("System", for: .normal)
        buttonFont.setTitleColor(.black, for: .normal)
        view.addSubview(buttonFont)
        buttonFont.addTarget(self, action: #selector(buttonFontTapped), for: .touchUpInside)
    }
    
    @objc func buttonFontTapped() {
        let alert = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        let actionOK = UIAlertAction(title: "OK", style: .cancel) { (actionOK) in
            self.buttonFont.setTitle("\(self.selectFont!)", for: .normal)
            self.myLabel.font = UIFont(name: self.selectFont!, size: CGFloat(self.sliderSizeText.value))
        }
        alert.addAction(actionOK)
        present(alert, animated: true)
        pickerFont.delegate = self
        pickerFont.dataSource = self
        pickerFont.frame = CGRect(x: 0, y: 0, width: alert.view.bounds.width, height: 150)
        alert.view.addSubview(pickerFont)
        
    }
    
    func addLabelShadow() {
        labelShadow.frame = CGRect(x: 50, y: 680, width: 150, height: 50)
        labelShadow.text = "Тень"
        view.addSubview(labelShadow)
    }
    
    func addSwitchShadow() {
        switchShadow.frame = CGRect(x: 270, y: 690, width: 100, height: 50)
        view.addSubview(switchShadow)
        switchShadow.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
    }
    
    @objc func switchChanged() {
        if switchShadow.isOn {
            if selectShadow == nil {
                myLabel.shadowColor = .systemBlue
            }
            myLabel.shadowOffset = CGSize(width: 2, height: 2)
        } else if switchShadow.isOn == false {
            myLabel.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    func addLabelLineMode() {
        labelLineMode.frame = CGRect(x: 50, y: 720, width: 170, height: 50)
        labelLineMode.text = "Правило переноса"
        view.addSubview(labelLineMode)
    }
    
    func addButtonLineMode() {
        buttonLineMode.frame = CGRect(x: 250, y: 720, width: 100, height: 50)
        buttonLineMode.setTitle("None", for: .normal)
        buttonLineMode.setTitleColor(.black, for: .normal)
        view.addSubview(buttonLineMode)
        buttonLineMode.addTarget(self, action: #selector(buttonLineModeTapped), for: .touchUpInside)
    }
    
    @objc func buttonLineModeTapped() {
        let alert = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        let actionOK = UIAlertAction(title: "OK", style: .cancel) { (actionOK) in
            self.buttonLineMode.setTitle("\(self.selectLineMode ?? "None")", for: .normal)
            switch self.buttonLineMode.titleLabel?.text {
            case "byCharWrapping": self.myLabel.lineBreakMode = .byCharWrapping
            case "byClipping": self.myLabel.lineBreakMode = .byClipping
            case "byTruncatingHead": self.myLabel.lineBreakMode = .byTruncatingHead
            case "byTruncatingMiddle": self.myLabel.lineBreakMode = .byTruncatingMiddle
            case "byTruncatingTail": self.myLabel.lineBreakMode = .byTruncatingTail
            case "byWordWrapping": self.myLabel.lineBreakMode = .byWordWrapping
            default: break
            }
        }
        alert.addAction(actionOK)
        present(alert, animated: true)
        pickerLineMode.delegate = self
        pickerLineMode.dataSource = self
        pickerLineMode.frame = CGRect(x: 0, y: 0, width: alert.view.bounds.width, height: 150)
        alert.view.addSubview(pickerLineMode)
    }
    
    func addPickerShadow() {
        pickerShadow.frame = CGRect(x: 20, y: 20, width: 300, height: 200)
        pickerShadow.delegate = self
        pickerShadow.dataSource = self
        view.addSubview(pickerShadow)
    }
    
    func addMyLabel() {
        myLabel.frame = CGRect(x: 70, y: 330, width: 250, height: 100)
        myLabel.text = tekst
        myLabel.font = UIFont.systemFont(ofSize: CGFloat(sliderSizeText.value))
        view.addSubview(myLabel)
    }
    
    func addSliderSizeText() {
        sliderSizeText.frame = CGRect(x: 50, y: 520, width: 300, height: 50)
        sliderSizeText.minimumValue = 8
        sliderSizeText.maximumValue = 60
        sliderSizeText.addTarget(self, action: #selector(sliderSizeChange), for: .valueChanged)
        view.addSubview(sliderSizeText)
    }
    
    @objc func sliderSizeChange() {
        roundedValue = Int(round(sliderSizeText.value))
        if let font = selectFont {
            myLabel.font = UIFont(name: font, size: CGFloat(roundedValue))
        } else {
            myLabel.font = UIFont.systemFont(ofSize: CGFloat(roundedValue))
        }
    }
    
    
    //MARK: - PickerView Methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerNumberLines {
            return arrayNumberLines[row]
        } else if pickerView == pickerColor {
            return arrayColor[row]
        } else if pickerView == pickerFont {
            return arrayFont[row]
        } else if pickerView == pickerLineMode {
            return arrayLineMode[row]
        } else if pickerView == pickerShadow {
            return arrayShadow[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerNumberLines {
            selectNumberLines = arrayNumberLines[row]
        } else if pickerView == pickerColor {
            selectColor = arrayColor[row]
        } else if pickerView == pickerFont {
            selectFont = arrayFont[row]
        } else if pickerView == pickerLineMode {
            selectLineMode = arrayLineMode[row]
        } else if pickerView == pickerShadow {
            selectShadow = arrayShadow[row]
            switch selectShadow {
            case "Синий": myLabel.shadowColor = .systemBlue
            case "Красный": myLabel.shadowColor = .systemRed
            case "Желтый": myLabel.shadowColor = .systemYellow
            default: break
            }
        }
    }
}

