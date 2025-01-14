//
//  ViewController.swift
//  UITabBarController(my app)
//
//  Created by Alexandr Garkalin on 09.09.2024.
//

import UIKit

class ViewController: UIViewController {

    // БЕЗ ИСПОЛЬЗОВАНИЯ UITabelView (тема еще не пройдена) - функционал "Мировых часов" не полный
    
    let labelWorldClock = UILabel()
    let horizontLine1 = UIView()
    let labelDifferenceTime1 = UILabel()
    let labelCity1 = UILabel()
    let horizontLine2 = UIView()
    let labelTime1 = UILabel()
    let labelDifferenceTime2 = UILabel()
    let labelCity2 = UILabel()
    let horizontLine3 = UIView()
    let labelTime2 = UILabel()
    let labelDifferenceTime3 = UILabel()
    let labelCity3 = UILabel()
    let horizontLine4 = UIView()
    let labelTime3 = UILabel()
    let labelDifferenceTime4 = UILabel()
    let labelCity4 = UILabel()
    let horizontLine5 = UIView()
    let labelTime4 = UILabel()
    
    let labelDifferenceTimeNew = UILabel()
    let labelCityNew = UILabel()
    let horizontLineNew = UIView()
    let labelTimeNew = UILabel()
    
    var name: String?
    var flagEdit = false
    
    let buttonDeleteEkb = UIButton() // удалить время Екатеринбурга
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // реализация методов
        addTabBarItem()
        addLeftButton()
        addRightButton()
        addLabelWorldClock()
        addHorizontLine1()
        addLabelDifferenceTime1()
        addLabelCity1()
        addHorizontLine2()
        addLabelTime1()
        updateTime()
        startUpdatingTime()
        addLabelDifferenceTime2()
        addLabelCity2()
        addHorizontLine3()
        addLabelTime2()
        addLabelDifferenceTime3()
        addLabelCity3()
        addHorizontLine4()
        addLabelTime3()
        addLabelDifferenceTime4()
        addLabelCity4()
        addHorizontLine5()
        addLabelTime4()

    }
    
    //MARK: - Methods
    func addTabBarItem() {
        // Настраиваем элемент TabBar
        let tabBarItem = UITabBarItem()
        tabBarItem.image = UIImage(systemName: "globe")
        tabBarItem.title = "Мировые часы"
        self.tabBarItem = tabBarItem
    }
    
    func addLeftButton() {
        // Настраиваем элемент Navigation Bar (слева)
        let leftButton = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(leftButtonTapped))
        leftButton.tintColor = .systemOrange
        navigationItem.leftBarButtonItem = leftButton
        
    }
    
    @objc func leftButtonTapped() {
        if buttonDeleteEkb.isDescendant(of: view) {
            buttonDeleteEkb.removeFromSuperview()
        } else if
            labelCity4.isDescendant(of: view) {
            buttonDeleteEkb.frame = CGRect(x: 190, y: 430, width: 50, height: 50)
            buttonDeleteEkb.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
            buttonDeleteEkb.tintColor = .systemRed
            view.addSubview(buttonDeleteEkb)
            buttonDeleteEkb.addTarget(self, action: #selector(buttonDeleteEkbTapped), for: .touchUpInside)
        } else {
            return
        }
        
    }
    
    @objc func buttonDeleteEkbTapped() {
        labelDifferenceTime4.removeFromSuperview()
        labelCity4.removeFromSuperview()
        labelTime4.removeFromSuperview()
        horizontLine5.removeFromSuperview()
        buttonDeleteEkb.removeFromSuperview()
    }

    func addRightButton() {
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(rightButtonTapped))
        rightButton.tintColor = .systemOrange
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func rightButtonTapped() {
        let cityVC = CityController()
        cityVC.firstVC = self
        present(cityVC, animated: true)
    }
    
    func addLabelWorldClock() {
        labelWorldClock.frame = CGRect(x: 15, y: 100, width: 300, height: 50)
        labelWorldClock.text = "Мировые часы"
        labelWorldClock.textColor = .white
        labelWorldClock.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.addSubview(labelWorldClock)
    }
    
    func addHorizontLine1() {
        horizontLine1.frame = CGRect(x: 15, y: 155, width: 500, height: 0.3)
        horizontLine1.backgroundColor = .systemGray
        view.addSubview(horizontLine1)
    }
    
    func addLabelDifferenceTime1() {
        labelDifferenceTime1.frame = CGRect(x: 15, y: 160, width: 150, height: 50)
        labelDifferenceTime1.text = "Сегодня, +0  Ч"
        labelDifferenceTime1.textColor = .white
        labelDifferenceTime1.alpha = 0.5
        labelDifferenceTime1.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(labelDifferenceTime1)
    }
    
    func addLabelCity1() {
        labelCity1.frame = CGRect(x: 15, y: 185, width: 300, height: 50)
        labelCity1.text = "Москва"
        labelCity1.textColor = .white
        labelCity1.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(labelCity1)
    }
    
    func addHorizontLine2() {
        horizontLine2.frame = CGRect(x: 15, y: 240, width: 500, height: 0.3)
        horizontLine2.backgroundColor = .systemGray
        view.addSubview(horizontLine2)
    }
    
    func addLabelTime1() {
        labelTime1.frame = CGRect(x: 270, y: 170, width: 120, height: 50)
        labelTime1.textColor = .white
        labelTime1.font = UIFont.systemFont(ofSize: 46, weight: .thin)
        view.addSubview(labelTime1)
    }
    
    func startUpdatingTime() {
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let currentTime = dateFormatter.string(from: Date())
        
        labelTime1.text = currentTime
        labelTimeNew.text = currentTime
        
        // минус один час (Калининград)
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.hour = -1
        let newDate = Calendar.current.date(byAdding: dateComponents, to: currentDate)!
        let timeString = dateFormatter.string(from: newDate)
        labelTime2.text = timeString
        
        // плюс три часа (Омск)
        let currentDate2 = Date()
        var dateComponents2 = DateComponents()
        dateComponents2.hour = +3
        let newDate2 = Calendar.current.date(byAdding: dateComponents2, to: currentDate2)!
        let timeString2 = dateFormatter.string(from: newDate2)
        labelTime3.text = timeString2
        
        // плюс два часа (Екатеринбург)
        let currentDate3 = Date()
        var dateComponents3 = DateComponents()
        dateComponents3.hour = +2
        let newDate3 = Calendar.current.date(byAdding: dateComponents3, to: currentDate3)!
        let timeString3 = dateFormatter.string(from: newDate3)
        labelTime4.text = timeString3
    }
    
    func addLabelDifferenceTime2() {
        labelDifferenceTime2.frame = CGRect(x: 15, y: 245, width: 150, height: 50)
        labelDifferenceTime2.text = "Сегодня, -1  Ч"
        labelDifferenceTime2.textColor = .white
        labelDifferenceTime2.alpha = 0.5
        labelDifferenceTime2.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(labelDifferenceTime2)
    }
    
    func addLabelCity2() {
        labelCity2.frame = CGRect(x: 15, y: 270, width: 300, height: 50)
        labelCity2.text = "Калининград"
        labelCity2.textColor = .white
        labelCity2.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(labelCity2)
    }
    
    func addHorizontLine3() {
        horizontLine3.frame = CGRect(x: 15, y: 325, width: 500, height: 0.3)
        horizontLine3.backgroundColor = .systemGray
        view.addSubview(horizontLine3)
    }
    
    func addLabelTime2() {
        labelTime2.frame = CGRect(x: 270, y: 255, width: 120, height: 50)
        labelTime2.textColor = .white
        labelTime2.font = UIFont.systemFont(ofSize: 46, weight: .thin)
        view.addSubview(labelTime2)
    }
    
    func addLabelDifferenceTime3() {
        labelDifferenceTime3.frame = CGRect(x: 15, y: 330, width: 150, height: 50)
        labelDifferenceTime3.text = "Сегодня, +3 Ч"
        labelDifferenceTime3.textColor = .white
        labelDifferenceTime3.alpha = 0.5
        labelDifferenceTime3.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(labelDifferenceTime3)
    }
    
    func addLabelCity3() {
        labelCity3.frame = CGRect(x: 15, y: 355, width: 300, height: 50)
        labelCity3.text = "Омск"
        labelCity3.textColor = .white
        labelCity3.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(labelCity3)
    }
    
    func addHorizontLine4() {
        horizontLine4.frame = CGRect(x: 15, y: 410, width: 500, height: 0.3)
        horizontLine4.backgroundColor = .systemGray
        view.addSubview(horizontLine4)
    }
    
    func addLabelTime3() {
        labelTime3.frame = CGRect(x: 270, y: 340, width: 120, height: 50)
        labelTime3.textColor = .white
        labelTime3.font = UIFont.systemFont(ofSize: 46, weight: .thin)
        view.addSubview(labelTime3)
    }
    
    func addLabelDifferenceTime4() {
        labelDifferenceTime4.frame = CGRect(x: 15, y: 415, width: 150, height: 50)
        labelDifferenceTime4.text = "Сегодня, +2 Ч"
        labelDifferenceTime4.textColor = .white
        labelDifferenceTime4.alpha = 0.5
        labelDifferenceTime4.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(labelDifferenceTime4)
    }
    
    func addLabelCity4() {
        labelCity4.frame = CGRect(x: 15, y: 440, width: 300, height: 50)
        labelCity4.text = "Екатеринбург"
        labelCity4.textColor = .white
        labelCity4.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(labelCity4)
    }
    
    func addHorizontLine5() {
        horizontLine5.frame = CGRect(x: 15, y: 495, width: 500, height: 0.3)
        horizontLine5.backgroundColor = .systemGray
        view.addSubview(horizontLine5)
    }
    
    func addLabelTime4() {
        labelTime4.frame = CGRect(x: 270, y: 425, width: 120, height: 50)
        labelTime4.textColor = .white
        labelTime4.font = UIFont.systemFont(ofSize: 46, weight: .thin)
        view.addSubview(labelTime4)
    }
    
    func addNewCity() {
        
        func addNew() {
            labelDifferenceTimeNew.text = "Сегодня, +0  Ч"
            labelDifferenceTimeNew.textColor = .white
            labelDifferenceTimeNew.alpha = 0.5
            labelDifferenceTimeNew.font = UIFont.systemFont(ofSize: 14)
            self.view.addSubview(labelDifferenceTimeNew)
            
            labelCityNew.text = name
            labelCityNew.textColor = .white
            labelCityNew.font = UIFont.systemFont(ofSize: 24)
            self.view.addSubview(labelCityNew)
            
            horizontLineNew.backgroundColor = .systemGray
            self.view.addSubview(horizontLineNew)
            
            labelTimeNew.textColor = .white
            labelTimeNew.font = UIFont.systemFont(ofSize: 46, weight: .thin)
            self.view.addSubview(labelTimeNew) }
    
        if labelCity4.isDescendant(of: view) {
            labelDifferenceTimeNew.frame = CGRect(x: 15, y: 500, width: 150, height: 50)
            labelCityNew.frame = CGRect(x: 15, y: 525, width: 300, height: 50)
            horizontLineNew.frame = CGRect(x: 15, y: 580, width: 500, height: 0.3)
            labelTimeNew.frame = CGRect(x: 270, y: 510, width: 120, height: 50)
            addNew()
        } else {
            labelDifferenceTimeNew.frame = CGRect(x: 15, y: 415, width: 150, height: 50)
            labelCityNew.frame = CGRect(x: 15, y: 440, width: 300, height: 50)
            horizontLineNew.frame = CGRect(x: 15, y: 495, width: 500, height: 0.3)
            labelTimeNew.frame = CGRect(x: 270, y: 425, width: 120, height: 50)
            addNew()
        }
        
    }
}

