//
//  FourViewController.swift
//  UITabBarController(my app)
//
//  Created by Alexandr Garkalin on 09.09.2024.
//

import UIKit
import AVFoundation

class FourViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 24
        } else if component == 1 {
            return 60
        } else if component == 2 {
            return 60
        }
        return 0
    }
    
    let labelHours = UILabel()
    let labelMinutes = UILabel()
    let labelSeconds = UILabel()
    let labelTimers = UILabel()
    let pickerView = UIPickerView()
    let hoursArray = (0...23).map { "\($0)" }
    let minutesArray = (0...59).map { "\($0)"}
    let secondsArray = (0...59).map { "\($0)"}
    let buttonCancel = UIButton()
    let buttonStart = UIButton()
    let labels = UILabel()
    let horizontLine = UIView()
    let labelMelody = UILabel()
    let textFieldName = UITextField()
    let labelNameTimer = UILabel()
    let labelTimerTime = UILabel()
    var selectHour: String?
    var selectMinute: String?
    var selectSecond: String?
    var timer: Timer?
    var elapsedTime: TimeInterval = 0
    let buttonNoStart = UIButton()
    var player: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // клавиатура
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)

        // реализация методов
        addTabBarItem()
        addLeftButton()
        addLabelTimers()
        addPickerView()
        addLabelHours()
        addLabelMinutes()
        addLabelSeconds()
        addButtonCancel()
        addButtonStart()
        addLabels()
        addHorizontLine()
        addLabelMelody()
        addTextFieldName()
        
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, mode: .default, options: [])
            try audioSession.setActive(true)
        } catch {
            print("Не удалось настроить AVAudioSession")
        }
    }
    
    //MARK: - Methods
    
    @objc func dismissKeyboard() {
        view.endEditing(true) // Закрывает клавиатуру
    }
    
    func addTabBarItem() {
        let tabBarItem = UITabBarItem()
        tabBarItem.image = UIImage(systemName: "timer")
        tabBarItem.title = "Таймер"
        self.tabBarItem = tabBarItem
    }
    
    func addLeftButton() {
        let leftButton = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(leftButtonTapped))
        leftButton.tintColor = .systemOrange
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func leftButtonTapped() {
        // без функционала
    }
    
    func addLabelTimers() {
        labelTimers.frame = CGRect(x: 15, y: 100, width: 300, height: 50)
        labelTimers.text = "Таймер"
        labelTimers.textColor = .white
        labelTimers.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.addSubview(labelTimers)
    }
    
    func addPickerView() {
        pickerView.frame = CGRect(x: 20, y: 150, width: 350, height: 225)
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.setValue(UIColor.white, forKey: "textColor")
        view.addSubview(pickerView)
    }
    
    func addLabelHours() {
        labelHours.frame = CGRect(x: pickerView.frame.origin.x + 75, y: pickerView.frame.origin.y + 100, width: 30, height: 30)
        labelHours.text = "ч"
        labelHours.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        labelHours.textColor = .white
        view.addSubview(labelHours)
    }
    
    func addLabelMinutes() {
        labelMinutes.frame = CGRect(x: pickerView.frame.origin.x + 190, y: pickerView.frame.origin.y + 100, width: 40, height: 30)
        labelMinutes.text = "мин"
        labelMinutes.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        labelMinutes.textColor = .white
        view.addSubview(labelMinutes)
    }
    
    func addLabelSeconds() {
        labelSeconds.frame = CGRect(x: pickerView.frame.origin.x + 300, y: pickerView.frame.origin.y + 100, width: 40, height: 30)
        labelSeconds.text = "с"
        labelSeconds.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        labelSeconds.textColor = .white
        view.addSubview(labelSeconds)
    }
    
    func addButtonCancel() {
        buttonCancel.frame = CGRect(x: 25, y: 400, width: 80, height: 80)
        buttonCancel.setTitle("Отмена", for: .normal)
        buttonCancel.setTitleColor(.systemGray, for: .normal)
        buttonCancel.alpha = 0.7
        buttonCancel.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        buttonCancel.layer.cornerRadius = buttonCancel.frame.size.width / 2
        view.addSubview(buttonCancel)
        buttonCancel.addTarget(self, action: #selector(buttonCancelTapped), for: .touchUpInside)
    }
    
    @objc func buttonCancelTapped() {
        buttonCancel.setTitleColor(.systemGray, for: .normal)
        buttonCancel.alpha = 0.7
        buttonNoStart.removeFromSuperview()
        addButtonStart()
        timer?.invalidate()
        timer = nil
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.selectRow(0, inComponent: 1, animated: true)
        pickerView.selectRow(0, inComponent: 2, animated: true)
        labelTimerTime.text = "00:00:00"
        labelNameTimer.removeFromSuperview()
        labelTimerTime.removeFromSuperview()
        textFieldName.text = ""
    }
    
    func addButtonStart() {
        buttonStart.frame = CGRect(x: 295, y: 400, width: 80, height: 80)
        buttonStart.setTitle("Старт", for: .normal)
        buttonStart.setTitleColor(.systemGreen, for: .normal)
        buttonStart.backgroundColor = UIColor(red: 0/255.0, green: 255/255.0, blue: 0/255.0, alpha: 0.2)
        buttonStart.layer.cornerRadius = buttonStart.frame.size.width / 2
        view.addSubview(buttonStart)
        buttonStart.addTarget(self, action: #selector(buttonStartTapped), for: .touchUpInside)
    }
    
    @objc func buttonStartTapped() {
        selectHour = hoursArray[pickerView.selectedRow(inComponent: 0)]
        selectMinute = minutesArray[pickerView.selectedRow(inComponent: 1)]
        selectSecond = secondsArray[pickerView.selectedRow(inComponent: 2)]
        if selectHour == "0" && selectMinute == "0" && selectSecond == "0" {
            return
        } else {
            addLabelNameTimer()
            addLabelTimerTime()
            buttonStart.removeFromSuperview()
            addButtonNoStart()
            buttonCancel.setTitleColor(.systemRed, for: .normal)
            buttonCancel.alpha = 1.0
            let hours = Int(selectHour!) ?? 0
            let minutes = Int(selectMinute!) ?? 0
            let seconds = Int(selectSecond!) ?? 0
            elapsedTime = TimeInterval(hours * 3600 + minutes * 60 + seconds)
            
            let formattedTime = formatTime(elapsedTime)
            labelTimerTime.text = formattedTime
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateTime() {
        guard elapsedTime > 0 else {
            timer?.invalidate()
            timer = nil
            do {
                if let audioPath = Bundle.main.path(forResource: "OST2", ofType: "mp3") {
                    player = try AVAudioPlayer(contentsOf: URL(filePath: audioPath))
                    player?.play()
                }
            } catch {
                print("Error")
            }
            let alert = UIAlertController(title: "Таймер!", message: "Конец!", preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { (actionOK) in
                self.buttonCancel.setTitleColor(.systemGray, for: .normal)
                self.buttonCancel.alpha = 0.7
                self.buttonNoStart.removeFromSuperview()
                self.addButtonStart()
                self.pickerView.selectRow(0, inComponent: 0, animated: true)
                self.pickerView.selectRow(0, inComponent: 1, animated: true)
                self.pickerView.selectRow(0, inComponent: 2, animated: true)
                self.labelTimerTime.text = "00:00:00"
                self.labelNameTimer.removeFromSuperview()
                self.labelTimerTime.removeFromSuperview()
                self.textFieldName.text = ""
                self.player?.stop()
                self.player = nil
            }
            alert.addAction(actionOK)
            self.present(alert, animated: true)
            return
        }
        elapsedTime -= 1
        let formattedTime = formatTime(elapsedTime)
        labelTimerTime.text = formattedTime
        
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        // Получаем часы и минуты
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func addLabels() {
        labels.frame = CGRect(x: 10, y: 500, width: 365, height: 100)
        labels.backgroundColor = .systemGray.withAlphaComponent(0.2)
        labels.text = "    Название \n\n    По окончании"
        labels.textAlignment = .left
        labels.numberOfLines = 0
        labels.textColor = .white
        labels.layer.cornerRadius = 12
        labels.layer.masksToBounds = true
        view.addSubview(labels)
    }
    
    func addHorizontLine() {
        horizontLine.frame = CGRect(x: 10, y: 550, width: 365, height: 0.3)
        horizontLine.backgroundColor = .systemGray
        view.addSubview(horizontLine)
    }
    
    func addLabelMelody() {
        labelMelody.frame = CGRect(x: 285, y: 545, width: 100, height: 50)
        labelMelody.text = "Радиус >"
        labelMelody.textColor = .white.withAlphaComponent(0.7)
        labelMelody.backgroundColor = .clear
        view.addSubview(labelMelody)
    }
    
    func addTextFieldName() {
        textFieldName.frame = CGRect(x: 120, y: 510, width: 240, height: 30)
        let placeholderText = "Таймер"
        let placeholderColor = UIColor.white.withAlphaComponent(0.3)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .right
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: placeholderColor, .paragraphStyle: paragraphStyle]
        textFieldName.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        textFieldName.textColor = .white
        textFieldName.backgroundColor = .systemGray.withAlphaComponent(0.001)
        textFieldName.textAlignment = .right
        textFieldName.delegate = self
        view.addSubview(textFieldName)
    }
    
    func addLabelNameTimer() {
        labelNameTimer.frame = CGRect(x: 15, y: 610, width: 300, height: 50)
        if textFieldName.text?.isEmpty == true {
            labelNameTimer.text = "Таймер"
        } else {
            labelNameTimer.text = textFieldName.text
        }
        labelNameTimer.textColor = .white
        labelNameTimer.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        view.addSubview(labelNameTimer)
    }
    
    func addLabelTimerTime() {
        labelTimerTime.frame = CGRect(x: 110, y: 650, width: 500, height: 70)
        labelTimerTime.text = "00:00:00"
        labelTimerTime.textColor = .white
        labelTimerTime.font = UIFont.systemFont(ofSize: 50, weight: .thin)
        view.addSubview(labelTimerTime)
    }
    
    func addButtonNoStart() {
        buttonNoStart.frame = CGRect(x: 295, y: 400, width: 80, height: 80)
        buttonNoStart.setTitle("Старт", for: .normal)
        buttonNoStart.setTitleColor(.systemGray, for: .normal)
        buttonNoStart.backgroundColor = UIColor(red: 0/255.0, green: 255/255.0, blue: 0/255.0, alpha: 0.2)
        buttonNoStart.layer.cornerRadius = buttonStart.frame.size.width / 2
        buttonNoStart.alpha = 0.8
        view.addSubview(buttonNoStart)
    }
    
    
    
    // MARK: - PickerView
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return hoursArray[row]
        } else if component == 1 {
            return minutesArray[row]
        } else if component == 2 {
            return secondsArray[row]
        }
        return nil
    }
    
    
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldName.resignFirstResponder()
        return true
    }
}
