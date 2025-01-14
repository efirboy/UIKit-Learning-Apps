//
//  ThirdViewController.swift
//  UITabBarController(my app)
//
//  Created by Alexandr Garkalin on 09.09.2024.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let labelStopWatch = UILabel()
    let buttonStart = UIButton()
    let buttonStop = UIButton()
    let buttonCircle = UIButton()
    let horizontLine = UIView()
    let labelOneCircle = UILabel()
    let labelOneCircleTime = UILabel()
    let horizontLine2 = UIView()
    let labelTwoCircle = UILabel()
    let labelTwoCircleTime = UILabel()
    let horizontLine3 = UIView()
    var count: Int = 0
    var flagStart = false
    var timer: Timer?
    var elapsedTime: TimeInterval = 0
    var startTimeForSecondCircle: TimeInterval?
    
    var firstCircle: TimeInterval?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarItem = UITabBarItem()
        tabBarItem.image = UIImage(systemName: "stopwatch.fill")
        tabBarItem.title = "Секундомер"
        self.tabBarItem = tabBarItem
        
        // реализация методов
        addLabelStopWatch()
        addButtonStart()
        addButtonCircle()
        addHorizontLine()
        
        
    }
    
    //MARK: - Methods
    
    func addLabelStopWatch() {
        labelStopWatch.frame = CGRect(x: 30, y: 200, width: 500, height: 70)
        labelStopWatch.text = "00:00,00"
        labelStopWatch.textColor = .white
        labelStopWatch.font = UIFont.systemFont(ofSize: 90, weight: .thin)
        view.addSubview(labelStopWatch)
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
        flagStart = true
        addLabelOneCircle()
        addLabelOneCircleTime()
        buttonCircle.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        buttonCircle.setTitleColor(.white, for: .normal)
        buttonCircle.setTitle("Круг", for: .normal)
        buttonStart.removeFromSuperview()
        buttonStop.frame = CGRect(x: 300, y: 400, width: 80, height: 80)
        buttonStop.setTitle("Стоп", for: .normal)
        buttonStop.setTitleColor(.systemRed, for: .normal)
        buttonStop.backgroundColor = UIColor(red: 255/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.2)
        buttonStop.layer.cornerRadius = buttonStop.frame.size.width / 2
        view.addSubview(buttonStop)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        buttonStop.addTarget(self, action: #selector(buttonStopTapped), for: .touchUpInside)
    }
    
    @objc func buttonStopTapped() {
        buttonStop.removeFromSuperview()
        addButtonStart()
        timer?.invalidate()
        timer = nil
        buttonCircle.setTitle("Сброс", for: .normal)
    }
    
    @objc func updateTime() {
        elapsedTime += 0.01
        let formattedTime = formatTime(elapsedTime)
        labelStopWatch.text = formattedTime
        if count == 0 {
            labelOneCircleTime.text = formattedTime
            firstCircle = elapsedTime
        } else if count == 1 {
            let timeForSecondCircle = elapsedTime - (startTimeForSecondCircle ?? elapsedTime)
            labelTwoCircleTime.text = formatTime(timeForSecondCircle)
            labelOneCircleTime.text = formatTime(firstCircle!)
        }
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        // Получаем целые секунды и сотые секунды
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let milliseconds = Int((time - Double(Int(time))) * 100)
        return String(format: "%02d:%02d,%02d", minutes, seconds, milliseconds)
    }
    
    func addButtonCircle() {
        buttonCircle.frame = CGRect(x: 25, y: 400, width: 80, height: 80)
        buttonCircle.setTitle("Круг", for: .normal)
        buttonCircle.setTitleColor(.systemGray, for: .normal)
        buttonCircle.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        buttonCircle.layer.cornerRadius = buttonStart.frame.size.width / 2
        view.addSubview(buttonCircle)
        buttonCircle.addTarget(self, action: #selector(buttonCircleTapped), for: .touchUpInside)
    }
    
    @objc func buttonCircleTapped() {
        if buttonCircle.titleLabel?.text == "Сброс" {
            flagStart = false
            count = 0
            labelStopWatch.text = "00:00,00"
            labelOneCircleTime.text = "00:00,00"
            elapsedTime = 0
            buttonCircle.setTitle("Круг", for: .normal)
            buttonCircle.setTitleColor(.systemGray, for: .normal)
            buttonCircle.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            labelOneCircle.removeFromSuperview()
            labelOneCircleTime.removeFromSuperview()
            horizontLine2.removeFromSuperview()
            labelTwoCircle.removeFromSuperview()
            labelTwoCircleTime.removeFromSuperview()
            horizontLine3.removeFromSuperview()
        } else if buttonCircle.titleLabel?.text == "Круг" && flagStart == true {
            count += 1
            if count == 0 {
                addLabelOneCircle()
                addLabelOneCircleTime()
                labelOneCircleTime.text = formatTime(elapsedTime)
            } else if count == 1 {
                addLabelTwoCircle()
                addLabelTwoCircleTime()
                labelTwoCircleTime.text = "00:00,00"
                startTimeForSecondCircle = elapsedTime
            }
        }
    }
        
        func addHorizontLine() {
            horizontLine.frame = CGRect(x: 25, y: 500, width: 350, height: 0.3)
            horizontLine.backgroundColor = .systemGray
            view.addSubview(horizontLine)
        }
        
        func addLabelOneCircle() {
            labelOneCircle.frame = CGRect(x: 25, y: 500, width: 100, height: 50)
            labelOneCircle.text = "Круг 1"
            labelOneCircle.textColor = .white
            horizontLine2.frame = CGRect(x: 25, y: 550, width: 350, height: 0.3)
            horizontLine2.backgroundColor = .systemGray
            view.addSubview(horizontLine2)
            view.addSubview(labelOneCircle)
        }
        
        func addLabelOneCircleTime() {
            labelOneCircleTime.frame = CGRect(x: 295, y: 500, width: 100, height: 50)
            labelOneCircleTime.text = "00:00,00"
            labelOneCircleTime.textColor = .white
            labelOneCircleTime.font = UIFont.systemFont(ofSize: 18, weight: .thin)
            view.addSubview(labelOneCircleTime)
        }
        
        func addLabelTwoCircle() {
            labelTwoCircle.frame = CGRect(x: 25, y: 550, width: 100, height: 50)
            labelTwoCircle.text = "Круг 2"
            labelTwoCircle.textColor = .white
            horizontLine3.frame = CGRect(x: 25, y: 600, width: 350, height: 0.3)
            horizontLine3.backgroundColor = .systemGray
            view.addSubview(horizontLine3)
            view.addSubview(labelTwoCircle)
        }
        
        func addLabelTwoCircleTime() {
            labelTwoCircleTime.frame = CGRect(x: 295, y: 550, width: 100, height: 50)
            labelTwoCircleTime.text = "00:00,00"
            labelTwoCircleTime.textColor = .white
            labelTwoCircleTime.font = UIFont.systemFont(ofSize: 18, weight: .thin)
            view.addSubview(labelTwoCircleTime)
        }
}

