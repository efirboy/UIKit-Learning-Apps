//
//  FourViewController.swift
//  UINavigationController (myApp)
//
//  Created by Alexandr Garkalin on 05.09.2024.
//

import UIKit

class FourViewController: UIViewController {
    
    var name: String? = ""
    var imagePizza = UIImage()
    let labelName = UILabel()
    let imageView = UIImageView()
    let labelCheese = UILabel()
    let switchCheese = UISwitch()
    let labelHam = UILabel()
    let switchHam = UISwitch()
    let labelMushrooms = UILabel()
    let switchMushrooms = UISwitch()
    let labelOlives = UILabel()
    let switchOlives = UISwitch()
    let buttonChoose = UIButton()
    let buttonInfo = UIButton()
    var segmentPizza = UISegmentedControl()
    let pizzaDiametrArray = ["25 см", "30 см", "35 см", "40 см" ]
    let labelPrice = UILabel()
    var sum: Int = 0
    var previousSegmentIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "pizzaBackground")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        // реализация методов
        addLabelName()
        addImageView()
        addLabelCheese()
        addLabelHam()
        addLabelMushrooms()
        addLabelOlives()
        addSwitchCheese()
        addSwitchHam()
        addSwitchMushrooms()
        addSwitchOlives()
        addButtonChoose()
        addButtonInfo()
        addSegmentPizza()
        addLabelPrice()
    }
    
    
    //MARK: - Methods
    
    func addLabelName() {
        labelName.frame = CGRect(x: 50, y: 30, width: 300, height: 50)
        labelName.text = name
        labelName.textAlignment = .center
        labelName.font = UIFont(name: "Cochin-Bold", size: 42)
        view.addSubview(labelName)
    }
    
    func addImageView() {
        imageView.frame = CGRect(x: 20, y: 80, width: 350, height: 350)
        imageView.image = imagePizza
        view.addSubview(imageView)
    }
    
    func addLabelCheese() {
        labelCheese.frame = CGRect(x: 30, y: 450, width: 250, height: 50)
        labelCheese.text = "Сыр моцарелла (+30 ₽)"
        labelCheese.textAlignment = .left
        labelCheese.font = UIFont(name: "Cochin-Bold", size: 22)
        view.addSubview(labelCheese)
    }
    
    func addLabelHam() {
        labelHam.frame = CGRect(x: 30, y: 510, width: 250, height: 50)
        labelHam.text = "Ветчина (+50 ₽)"
        labelHam.textAlignment = .left
        labelHam.font = UIFont(name: "Cochin-Bold", size: 22)
        view.addSubview(labelHam)
    }
    
    func addLabelMushrooms() {
        labelMushrooms.frame = CGRect(x: 30, y: 570, width: 250, height: 50)
        labelMushrooms.text = "Грибы (+10 ₽)"
        labelMushrooms.textAlignment = .left
        labelMushrooms.font = UIFont(name: "Cochin-Bold", size: 22)
        view.addSubview(labelMushrooms)
    }
    
    func addLabelOlives() {
        labelOlives.frame = CGRect(x: 30, y: 630, width: 250, height: 50)
        labelOlives.text = "Маслины (+20 ₽)"
        labelOlives.textAlignment = .left
        labelOlives.font = UIFont(name: "Cochin-Bold", size: 22)
        view.addSubview(labelOlives)
    }
    
    func addSwitchCheese() {
        switchCheese.frame = CGRect(x: 300, y: 460, width: 100, height: 50)
        switchCheese.isOn = false
        view.addSubview(switchCheese)
        switchCheese.addTarget(self, action: #selector(switchCheeseChange), for: .valueChanged)
    }
    
    @objc func switchCheeseChange() {
        if switchCheese.isOn {
            sum += 30
            labelPrice.text = "\(sum) ₽"
        } else if switchCheese.isOn == false {
            sum -= 30
            labelPrice.text = "\(sum) ₽"
        }
    }
    
    func addSwitchHam() {
        switchHam.frame = CGRect(x: 300, y: 520, width: 100, height: 50)
        switchHam.isOn = false
        view.addSubview(switchHam)
        switchHam.addTarget(self, action: #selector(switchHumChange), for: .valueChanged)
    }
    
    @objc func switchHumChange() {
        if switchHam.isOn {
            sum += 50
            labelPrice.text = "\(sum) ₽"
        } else if switchHam.isOn == false {
            sum -= 50
            labelPrice.text = "\(sum) ₽"
        }
    }
    
    func addSwitchMushrooms() {
        switchMushrooms.frame = CGRect(x: 300, y: 580, width: 100, height: 50)
        switchMushrooms.isOn = false
        view.addSubview(switchMushrooms)
        switchMushrooms.addTarget(self, action: #selector(switchMushroomsChange), for: .valueChanged)
    }
    
    @objc func switchMushroomsChange() {
        if switchMushrooms.isOn {
            sum += 10
            labelPrice.text = "\(sum) ₽"
        } else if switchMushrooms.isOn == false {
            sum -= 10
            labelPrice.text = "\(sum) ₽"
        }
    }
    
    func addSwitchOlives() {
        switchOlives.frame = CGRect(x: 300, y: 640, width: 100, height: 50)
        switchOlives.isOn = false
        view.addSubview(switchOlives)
        switchOlives.addTarget(self, action: #selector(switchOlivesChange), for: .valueChanged)
    }
    
    @objc func switchOlivesChange() {
        if switchOlives.isOn {
            sum += 20
            labelPrice.text = "\(sum) ₽"
        } else if switchOlives.isOn == false {
            sum -= 20
            labelPrice.text = "\(sum) ₽"
        }
    }
    
    func addButtonChoose() {
        buttonChoose.frame = CGRect(x: 25, y: 690, width: 250, height: 50)
        buttonChoose.setTitle("Выбрать", for: .normal)
        buttonChoose.titleLabel?.font = UIFont(name: "Cochin-Bold", size: 20)
        buttonChoose.backgroundColor = .systemRed
        buttonChoose.layer.cornerRadius = 12
        view.addSubview(buttonChoose)
        buttonChoose.addTarget(self, action: #selector(buttonChooseTapped), for: .touchUpInside)
    }
    
    @objc func buttonChooseTapped() {
        self.dismiss(animated: false)
        if let parentNavigationController = self.presentingViewController as? UINavigationController {
            let fiveVC = FiveViewController()
            fiveVC.name = labelName.text
            fiveVC.imageView = imageView.image!
            fiveVC.sumResult = sum
            if switchCheese.isOn {
                fiveVC.flagCheese = true
            }
            if switchHam.isOn {
                fiveVC.flagHam = true
            }
            if switchMushrooms.isOn {
                fiveVC.flagMushrooms = true
            }
            if switchOlives.isOn {
                fiveVC.flagOlives = true
            }
            parentNavigationController.pushViewController(fiveVC, animated: false)
        }
        
    }
    
    func addButtonInfo() {
        buttonInfo.frame = CGRect(x: 325, y: 1, width: 70, height: 70)
        buttonInfo.setImage(UIImage(systemName: "info.circle"), for: .normal)
        buttonInfo.tintColor = .black
        view.addSubview(buttonInfo)
        buttonInfo.addTarget(self, action: #selector(buttonInfoTapped), for: .touchUpInside)
    }
    
    @objc func buttonInfoTapped() {
        let sixVC = SixViewController()
        sixVC.name = labelName.text!
        present(sixVC, animated: true)
    }
    
    func addSegmentPizza() {
        segmentPizza = UISegmentedControl(items: pizzaDiametrArray)
        segmentPizza.frame = CGRect(x: 20, y: 420, width: 360, height: 30)
        segmentPizza.selectedSegmentIndex = 0
        view.addSubview(segmentPizza)
        segmentPizza.addTarget(self, action: #selector(segmentPizzaChange), for: .valueChanged)
    }
    
    @objc func segmentPizzaChange() {
        if segmentPizza.selectedSegmentIndex == 1 {
            sum += 100
        } else if segmentPizza.selectedSegmentIndex == 2 {
            sum += 200
        } else if segmentPizza.selectedSegmentIndex == 3 {
            sum += 300
        }
        if let previousIndex = previousSegmentIndex {
            if previousIndex == 1 {
                sum -= 100
            } else if previousIndex == 2 {
                sum -= 200
            } else if previousIndex == 3 {
                sum -= 300
            }
        }
        labelPrice.text = "\(sum) ₽"
        previousSegmentIndex = segmentPizza.selectedSegmentIndex
    }
        
    func addLabelPrice() {
        labelPrice.frame = CGRect(x: 290, y: 690, width: 80, height: 50)
        labelPrice.text = "\(sum) ₽"
        labelPrice.font = UIFont(name: "Cochin-Bold", size: 28)
        labelPrice.textAlignment = .center
        labelPrice.textColor = .white
        labelPrice.backgroundColor = .systemRed
        labelPrice.layer.cornerRadius = 12
        labelPrice.layer.masksToBounds = true
        view.addSubview(labelPrice)
    }
}
