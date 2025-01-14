//
//  ViewController.swift
//  UISegmentControl
//
//  Created by Alexandr Garkalin on 02.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let logo = UIImageView()
    let buttonOne = UIButton()
    let buttonTwo = UIButton()
    let nameOne = "Nike W Air Zoom Pegasus 40"
    let nameTwo = "Nike Air Winflo"
    let arraySizeOne = ["38", "39", "40", "42", "43", "47"]
    let arraySizeTwo = ["38", "41", "43", "42"]
    let sumOne: Int = 11500
    let sumTwo: Int = 14000
    let menuArrayOne = ["Red", "Black", "White-Black"]
    let menuArrayTwo = ["White", "Blue", "Black"]
    let imageArrayOne = [UIImage(named: "Red.jpg"), UIImage(named: "Black.jpg"), UIImage(named: "White-Black.jpg")]
    let imageArrayTwo = [UIImage(named: "White2.jpg"), UIImage(named: "Blue2.jpg"), UIImage(named: "Black2.jpg")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "backgroundImage")
        
        // Устанавливаем режим отображения, чтобы изображение заполнило весь экран
        backgroundImage.contentMode = .scaleAspectFill
        
        // Добавляем UIImageView как подвид (subview) перед добавлением других view
        self.view.addSubview(backgroundImage)
        
        // Перемещаем backgroundImageView на задний план
        self.view.sendSubviewToBack(backgroundImage)
        
        addLogo()
        addButton1()
        addButton2()
        
    }
    
    func addLogo() {
        logo.frame = CGRect(x: 65, y: 80, width: 300, height: 200)
        logo.image = UIImage(named: "logo")
        self.view.addSubview(logo)
    }
    
    func addButton1() {
        buttonOne.frame = CGRect(x: 20, y: 150, width: 350, height: 380)
        self.view.addSubview(buttonOne)
        buttonOne.setImage(UIImage(named: "Item1"), for: .normal)
        buttonOne.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
    }
    
    @objc func button1Tapped() {
        let secondVC = SecondViewController()
        secondVC.arraySize = arraySizeOne
        secondVC.nameItem = nameOne
        secondVC.sum = sumOne
        secondVC.sumX = sumOne
        secondVC.menuArray = menuArrayOne
        secondVC.imageArray = imageArrayOne
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
    func addButton2() {
        buttonTwo.frame = CGRect(x: 20, y: 500, width: 350, height: 200)
        self.view.addSubview(buttonTwo)
        buttonTwo.setImage(UIImage(named: "Item2"), for: .normal)
        buttonTwo.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
    }
    
    @objc func button2Tapped() {
        let secondVC = SecondViewController()
        secondVC.arraySize = arraySizeTwo
        secondVC.nameItem = nameTwo
        secondVC.sum = sumTwo
        secondVC.sumX = sumTwo
        secondVC.menuArray = menuArrayTwo
        secondVC.imageArray = imageArrayTwo
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}
