//
//  SecondViewController.swift
//  UITabBarController(my app)
//
//  Created by Alexandr Garkalin on 09.09.2024.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    let labelAlarms = UILabel()
    let labelDream = UILabel()
    let imageBed = UIImageView()
    let horizontLine = UIView()
    let horizontLine2 = UIView()
    let labelNoAlarm = UILabel()
    let buttonTune = UIButton()
    let labelOthers = UILabel()
    let horizontLine3 = UIView()
    let labelAlarm1 = UILabel()
    let labelNamingAlarm1 = UILabel()
    let horizontLine4 = UIView()
    let switchAlarm1 = UISwitch()
    let labelAlarm2 = UILabel()
    let labelNamingAlarm2 = UILabel()
    let horizontLine5 = UIView()
    let switchAlarm2 = UISwitch()
    let buttonDelete = UIButton()
    let labelAlarmNew = UILabel()
    let labelNamingAlarmNew = UILabel()
    let switchAlarmNew = UISwitch()
    let horizontLineNew = UIView()
    
    var name: String?
    var selectedTime: Date?
    var timer: Timer?
    var timer1: Timer?
    var timer2: Timer?
    var dateComponents: DateComponents?
    var componentAlarmNew: DateComponents?
    var componentAlarm1: DateComponents?
    var componentAlarm2: DateComponents?
    var player: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // реализация методов
        addTabBaItem()
        addLeftButton()
        addRightButton()
        addLabelAlarms()
        addLabelDream()
        addImageBed()
        addHorizontLine()
        addHorizontLine2()
        addLabelNoAlarm()
        addButtonTune()
        addLabelOthers()
        addHorizontLine3()
        addLabelAlarm1()
        addLabelNamingAlarm1()
        addHorizontLine4()
        addSwitchAlarm1()
        addLabelAlarm2()
        addLabelNamingAlarm2()
        addHorizontLine5()
        addSwitchAlarm2()

        
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, mode: .default, options: [])
            try audioSession.setActive(true)
        } catch {
            print("Не удалось настроить AVAudioSession")
        }
    }
    
    //MARK: - Methods
    
    func addTabBaItem() {
        let tabBarItem = UITabBarItem()
        tabBarItem.image = UIImage(systemName: "alarm.fill")
        tabBarItem.title = "Будильники"
        self.tabBarItem = tabBarItem
    }
    
    func addLeftButton() {
        let leftButton = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(leftButtonTapped))
        leftButton.tintColor = .systemOrange
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func leftButtonTapped() {
        if buttonDelete.isDescendant(of: view) {
            buttonDelete.removeFromSuperview()
        } else if
            labelAlarm2.isDescendant(of: view) {
            buttonDelete.frame = CGRect(x: 140, y: 455, width: 50, height: 50)
            buttonDelete.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
            buttonDelete.tintColor = .systemRed
            view.addSubview(buttonDelete)
            buttonDelete.addTarget(self, action: #selector(buttonDeleteTapped), for: .touchUpInside)
        } else {
            return
        }
    }
    
    @objc func buttonDeleteTapped() {
        labelAlarm2.removeFromSuperview()
        labelNamingAlarm2.removeFromSuperview()
        horizontLine5.removeFromSuperview()
        switchAlarm2.removeFromSuperview()
        buttonDelete.removeFromSuperview()
    }
    
    func addRightButton() {
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(rightButtonTapped))
        rightButton.tintColor = .systemOrange
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func rightButtonTapped() {
        let alarmVC = AlarmViewController()
        alarmVC.alarmVC = self
        present(alarmVC, animated: true)
    }
    
    func addLabelAlarms() {
        labelAlarms.frame = CGRect(x: 15, y: 100, width: 300, height: 50)
        labelAlarms.text = "Будильники"
        labelAlarms.textColor = .white
        labelAlarms.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.addSubview(labelAlarms)
    }
    
    func addImageBed() {
        imageBed.frame = CGRect(x: 15, y: 165, width: 30, height: 20)
        imageBed.image = UIImage(systemName: "bed.double")
        imageBed.tintColor = .white
        view.addSubview(imageBed)
    }
    
    func addLabelDream() {
        labelDream.frame = CGRect(x: 50, y: 150, width: 300, height: 50)
        labelDream.text = "Сон | Пробуждение"
        labelDream.textColor = .white
        labelDream.textAlignment = .left
        labelDream.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        view.addSubview(labelDream)
    }
    
    func addHorizontLine() {
        horizontLine.frame = CGRect(x: 15, y: 200, width: 500, height: 0.3)
        horizontLine.backgroundColor = .systemGray
        view.addSubview(horizontLine)
    }
    
    func addHorizontLine2() {
        horizontLine2.frame = CGRect(x: 15, y: 250, width: 500, height: 0.3)
        horizontLine2.backgroundColor = .systemGray
        view.addSubview(horizontLine2)
    }
    
    func addLabelNoAlarm() {
        labelNoAlarm.frame = CGRect(x: 15, y: 200, width: 300, height: 50)
        labelNoAlarm.text = "Нет будильника"
        labelNoAlarm.textColor = .systemGray
        labelNoAlarm.alpha = 0.7
        labelNoAlarm.textAlignment = .left
        labelNoAlarm.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.addSubview(labelNoAlarm)
    }
    
    func addButtonTune() {
        buttonTune.frame = CGRect(x: 270, y: 210, width: 110, height: 30)
        buttonTune.setTitle("НАСТРОИТЬ", for: .normal)
        buttonTune.setTitleColor(.systemOrange, for: .normal)
        buttonTune.backgroundColor = .systemGray.withAlphaComponent(0.3)
        buttonTune.layer.cornerRadius = 15
        buttonTune.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        view.addSubview(buttonTune)
        buttonTune.addTarget(self, action: #selector(buttonTuneTapped), for: .touchUpInside)
    }
    
    @objc func buttonTuneTapped() {
        let tuneVC = TuneViewController()
        present(tuneVC, animated: true)
    }
    
    func addLabelOthers() {
        labelOthers.frame = CGRect(x: 15, y: 270, width: 300, height: 50)
        labelOthers.text = "Другие"
        labelOthers.textColor = .white
        labelOthers.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        view.addSubview(labelOthers)
    }
    
    func addHorizontLine3() {
        horizontLine3.frame = CGRect(x: 15, y: 320, width: 500, height: 0.3)
        horizontLine3.backgroundColor = .systemGray
        view.addSubview(horizontLine3)
    }
    
    func addLabelAlarm1() {
        labelAlarm1.frame = CGRect(x: 15, y: 340, width: 120, height: 50)
        labelAlarm1.textColor = .white
        labelAlarm1.alpha = 0.5
        labelAlarm1.text = "08:00"
        labelAlarm1.font = UIFont.systemFont(ofSize: 46, weight: .thin)
        view.addSubview(labelAlarm1)
    }
    
    func addLabelNamingAlarm1() {
        labelNamingAlarm1.frame = CGRect(x: 15, y: 380, width: 300, height: 50)
        labelNamingAlarm1.text = "Будильник"
        labelNamingAlarm1.textColor = .systemGray
        labelNamingAlarm1.alpha = 0.7
        labelNamingAlarm1.textAlignment = .left
        labelNamingAlarm1.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        view.addSubview(labelNamingAlarm1)
    }
    
    func addHorizontLine4() {
        horizontLine4.frame = CGRect(x: 15, y: 430, width: 500, height: 0.3)
        horizontLine4.backgroundColor = .systemGray
        view.addSubview(horizontLine4)
    }
    
    func addSwitchAlarm1() {
        switchAlarm1.frame = CGRect(x: 310, y: 355, width: 50, height: 50)
        switchAlarm1.tintColor = .systemGray
        switchAlarm1.layer.cornerRadius = switchAlarm1.frame.height / 2
        switchAlarm1.backgroundColor = .systemGray.withAlphaComponent(0.3)
        view.addSubview(switchAlarm1)
        switchAlarm1.addTarget(self, action: #selector(switchAlarm1Change), for: .valueChanged)
    }
    
    @objc func switchAlarm1Change(target: UISwitch) {
        if target == switchAlarm1 {
            if target.isOn {
                labelAlarm1.alpha = 1
                labelNamingAlarm1.textColor = .white
                labelNamingAlarm1.alpha = 1
                
                let calendar = Calendar.current
                
                let alarmDate = timeStringToDate(timeString: labelAlarm1.text!)
                componentAlarm1 = calendar.dateComponents([.hour, .minute], from: alarmDate!)
                
                let date = Date()
                dateComponents = calendar.dateComponents([.hour, .minute], from: date)
                
                timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime1), userInfo: nil, repeats: true)
                
            } else {
                labelAlarm1.alpha = 0.5
                labelNamingAlarm1.textColor = .systemGray
                labelNamingAlarm1.alpha = 0.7
                timer1?.invalidate()
                timer1 = nil
            }
        }
    }
    
    func addLabelAlarm2() {
        labelAlarm2.frame = CGRect(x: 15, y: 450, width: 120, height: 50)
        labelAlarm2.textColor = .white
        labelAlarm2.alpha = 0.5
        labelAlarm2.text = "09:30"
        labelAlarm2.font = UIFont.systemFont(ofSize: 46, weight: .thin)
        view.addSubview(labelAlarm2)
    }
    
    func addLabelNamingAlarm2() {
        labelNamingAlarm2.frame = CGRect(x: 15, y: 490, width: 300, height: 50)
        labelNamingAlarm2.text = "Будильник"
        labelNamingAlarm2.textColor = .systemGray
        labelNamingAlarm2.alpha = 0.7
        labelNamingAlarm2.textAlignment = .left
        labelNamingAlarm2.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        view.addSubview(labelNamingAlarm2)
    }
    
    func addHorizontLine5() {
        horizontLine5.frame = CGRect(x: 15, y: 540, width: 500, height: 0.3)
        horizontLine5.backgroundColor = .systemGray
        view.addSubview(horizontLine5)
    }
    
    func addSwitchAlarm2() {
        switchAlarm2.frame = CGRect(x: 310, y: 465, width: 50, height: 50)
        switchAlarm2.tintColor = .systemGray
        switchAlarm2.layer.cornerRadius = switchAlarm2.frame.height / 2
        switchAlarm2.backgroundColor = .systemGray.withAlphaComponent(0.3)
        view.addSubview(switchAlarm2)
        switchAlarm2.addTarget(self, action: #selector(switchAlarm2Change), for: .valueChanged)
    }
    
    @objc func switchAlarm2Change(target: UISwitch) {
        if target == switchAlarm2 {
            if target.isOn {
                labelAlarm2.alpha = 1
                labelNamingAlarm2.textColor = .white
                labelNamingAlarm2.alpha = 1
                
                let calendar = Calendar.current
                
                let alarmDate = timeStringToDate(timeString: labelAlarm2.text!)
                componentAlarm2 = calendar.dateComponents([.hour, .minute], from: alarmDate!)
                
                let date = Date()
                dateComponents = calendar.dateComponents([.hour, .minute], from: date)
                
                timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime2), userInfo: nil, repeats: true)
            } else {
                labelAlarm2.alpha = 0.5
                labelNamingAlarm2.textColor = .systemGray
                labelNamingAlarm2.alpha = 0.7
                timer2?.invalidate()
                timer2 = nil
            }
        }
    }
    
    func addNewAlarm() {
        
        func addNew() {
            labelAlarmNew.textColor = .white
            labelAlarmNew.alpha = 0.5
            if let time = selectedTime {
                let dateFormatter = DateFormatter()
                dateFormatter.timeStyle = .short
                dateFormatter.locale = Locale(identifier: "ru_RU")
                let timeString = dateFormatter.string(from: time)
                labelAlarmNew.text = timeString
            }
            labelAlarmNew.font = UIFont.systemFont(ofSize: 46, weight: .thin)
            view.addSubview(labelAlarmNew)
            
            if name?.isEmpty == true {
                labelNamingAlarmNew.text = "Будильник"
            } else {
                labelNamingAlarmNew.text = name
            }
            labelNamingAlarmNew.textColor = .systemGray
            labelNamingAlarmNew.alpha = 0.7
            labelNamingAlarmNew.textAlignment = .left
            labelNamingAlarmNew.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            view.addSubview(labelNamingAlarmNew)
            
            horizontLineNew.backgroundColor = .systemGray
            self.view.addSubview(horizontLineNew)
            
            switchAlarmNew.tintColor = .systemGray
            switchAlarmNew.layer.cornerRadius = switchAlarmNew.frame.height / 2
            switchAlarmNew.backgroundColor = .systemGray.withAlphaComponent(0.3)
            view.addSubview(switchAlarmNew)
            switchAlarmNew.addTarget(self, action: #selector(switchAlarmNewChange), for: .valueChanged)
            
            }
        
        if labelAlarm2.isDescendant(of: view) {
            labelAlarmNew.frame = CGRect(x: 15, y: 560, width: 150, height: 50)
            labelNamingAlarmNew.frame = CGRect(x: 15, y: 600, width: 300, height: 50)
            horizontLineNew.frame = CGRect(x: 15, y: 650, width: 500, height: 0.3)
            switchAlarmNew.frame = CGRect(x: 310, y: 575, width: 120, height: 50)
            addNew()
        } else {
            labelAlarmNew.frame = CGRect(x: 15, y: 450, width: 120, height: 50)
            labelNamingAlarmNew.frame = CGRect(x: 15, y: 490, width: 300, height: 50)
            horizontLineNew.frame = CGRect(x: 15, y: 540, width: 500, height: 0.3)
            switchAlarmNew.frame = CGRect(x: 310, y: 465, width: 50, height: 50)
            addNew()
        }
    }
    
    @objc func switchAlarmNewChange(target: UISwitch) {
        if target == switchAlarmNew {
            if target.isOn {
                labelAlarmNew.alpha = 1
                labelNamingAlarmNew.textColor = .white
                labelNamingAlarmNew.alpha = 1
                
                let calendar = Calendar.current
                
                let alarmDate = timeStringToDate(timeString: labelAlarmNew.text!)
                componentAlarmNew = calendar.dateComponents([.hour, .minute], from: alarmDate!)
                
                let date = Date()
                dateComponents = calendar.dateComponents([.hour, .minute], from: date)
                
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateNowTime), userInfo: nil, repeats: true)
                
            } else {
                labelAlarmNew.alpha = 0.5
                labelNamingAlarmNew.textColor = .systemGray
                labelNamingAlarmNew.alpha = 0.7
                timer?.invalidate()
            }
        }
    }
    
    // для отслеживания текущего времени
    @objc func updateNowTime() {
        let calendar = Calendar.current
        let date = Date()
        dateComponents = calendar.dateComponents([.hour, .minute], from: date)
        if dateComponents! == componentAlarmNew! {
            timer?.invalidate()
            timer = nil
            do {
                if let audioPath = Bundle.main.path(forResource: "OST1", ofType: "mp3") {
                    try player = AVAudioPlayer(contentsOf: URL(filePath: audioPath))
                    player?.play()
                }
            } catch {
                print("Error")
            }
            let alert = UIAlertController(title: "Будильник!", message: nil, preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { (actionOK) in
                self.player?.stop()
                self.player = nil
                self.switchAlarmNew.isOn = false
                self.labelAlarmNew.alpha = 0.5
                self.labelNamingAlarmNew.textColor = .systemGray
                self.labelNamingAlarmNew.alpha = 0.7
            }
            alert.addAction(actionOK)
            present(alert, animated: true)
        }
        
    }
    
    @objc func updateTime1() {
        let calendar = Calendar.current
        let date = Date()
        dateComponents = calendar.dateComponents([.hour, .minute], from: date)
        if dateComponents! == componentAlarm1! {
            timer1?.invalidate()
            timer1 = nil
            do {
                if let audioPath = Bundle.main.path(forResource: "OST1", ofType: "mp3") {
                    try player = AVAudioPlayer(contentsOf: URL(filePath: audioPath))
                    player?.play()
                }
            } catch {
                print("Error")
            }
            let alert = UIAlertController(title: "Будильник!", message: nil, preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { (actionOK) in
                self.player?.stop()
                self.player = nil
                self.switchAlarm1.isOn = false
                self.labelAlarm1.alpha = 0.5
                self.labelNamingAlarm1.textColor = .systemGray
                self.labelNamingAlarm1.alpha = 0.7
            }
            alert.addAction(actionOK)
            present(alert, animated: true)
        }
        
    }
    
    @objc func updateTime2() {
        let calendar = Calendar.current
        let date = Date()
        dateComponents = calendar.dateComponents([.hour, .minute], from: date)
        if dateComponents! == componentAlarm2! {
            timer2?.invalidate()
            timer2 = nil
            do {
                if let audioPath = Bundle.main.path(forResource: "OST1", ofType: "mp3") {
                    try player = AVAudioPlayer(contentsOf: URL(filePath: audioPath))
                    player?.play()
                }
            } catch {
                print("Error")
            }
            let alert = UIAlertController(title: "Будильник!", message: nil, preferredStyle: .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default) { (actionOK) in
                self.player?.stop()
                self.player = nil
                self.switchAlarm2.isOn = false
                self.labelAlarm2.alpha = 0.5
                self.labelNamingAlarm2.textColor = .systemGray
                self.labelNamingAlarm2.alpha = 0.7
            }
            alert.addAction(actionOK)
            present(alert, animated: true)
        }
        
    }

    // функция перевода текста будильника в дату
    func timeStringToDate(timeString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let date = dateFormatter.date(from: timeString)
        return date
    }
}
