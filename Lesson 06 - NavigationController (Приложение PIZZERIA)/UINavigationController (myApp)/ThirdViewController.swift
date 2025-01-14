//
//  ThirdViewController.swift
//  UINavigationController (myApp)
//
//  Created by Alexandr Garkalin on 05.09.2024.
//

import UIKit

class ThirdViewController: UIViewController {

    let imagePepperoni = UIImageView()
    let horizontLine = UIView()
    let imageMargarita = UIImageView()
    let labelPepperoni = UILabel()
    let labelPepperoniIngridients = UILabel()
    let labelPricePepperoni = UILabel()
    let buttonAddPepperoni = UIButton()
    let labelMargarita = UILabel()
    let labelMargaritaIngridients = UILabel()
    let labelPriceMargarita = UILabel()
    let buttonAddMargarita = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Пицца"
        
        // установка фона
        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "backgroundImage")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        // реализация методов
        addImagePepperoni()
        addImageMargarita()
        addHorizontLine()
        addLabelPepperoni()
        addLabelPepperoniIngridients()
        addLabelPricePepperoni()
        addButtonAddPepperoni()
        addLabelMargarita()
        addLabelMargaritaIngridients()
        addLabelPriceMargarita()
        addButtonAddMargarita()
    }
    
    func addImagePepperoni() {
        imagePepperoni.frame = CGRect(x: 20, y: 170, width: 200, height: 200)
        imagePepperoni.image = UIImage(named: "pepperoni")
        view.addSubview(imagePepperoni)
    }
    
    func addHorizontLine() {
        horizontLine.frame = CGRect(x: 10, y: 370, width: 375, height: 1)
        horizontLine.backgroundColor = .systemGray2
        view.addSubview(horizontLine)
    }
    
    func addImageMargarita() {
        imageMargarita.frame = CGRect(x: 20, y: 390, width: 200, height: 200)
        imageMargarita.image = UIImage(named: "margarita")
        view.addSubview(imageMargarita)
    }
    
    func addLabelPepperoni() {
        labelPepperoni.frame = CGRect(x: 220, y: 170, width: 150, height: 50)
        labelPepperoni.text = "Пепперони"
        labelPepperoni.font = UIFont(name: "Cochin-BoldItalic", size: 28)
        labelPepperoni.textAlignment = .center
        view.addSubview(labelPepperoni)
    }
    
    func addLabelPepperoniIngridients() {
        labelPepperoniIngridients.frame = CGRect(x: 220, y: 200, width: 170, height: 120)
        labelPepperoniIngridients.text = "Тесто, томатный соус, сыр моцарелла, колбаса пепперони, орегано"
        labelPepperoniIngridients.font = UIFont(name: "Cochin", size: 18)
        labelPepperoniIngridients.alpha = 0.5
        labelPepperoniIngridients.textAlignment = .left
        labelPepperoniIngridients.numberOfLines = 0
        labelPepperoniIngridients.minimumScaleFactor = 0.5
        view.addSubview(labelPepperoniIngridients)
    }
    
    func addLabelPricePepperoni() {
        labelPricePepperoni.frame = CGRect(x: 220, y: 305, width: 100, height: 50)
        labelPricePepperoni.text = "550 ₽"
        labelPricePepperoni.font = UIFont(name: "Cochin-Bold", size: 28)
        labelPricePepperoni.textAlignment = .left
        view.addSubview(labelPricePepperoni)
    }
    
    func addButtonAddPepperoni() {
        buttonAddPepperoni.frame = CGRect(x: 300, y: 315, width: 80, height: 30)
        buttonAddPepperoni.setTitle("Добавить", for: .normal)
        buttonAddPepperoni.layer.cornerRadius = 12
        buttonAddPepperoni.backgroundColor = .systemRed
        buttonAddPepperoni.setTitleColor(UIColor.white, for: .normal)
        buttonAddPepperoni.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(buttonAddPepperoni)
        buttonAddPepperoni.addTarget(self, action: #selector(buttonAddPepperoniTapped), for: .touchUpInside)
    }
    
    @objc func buttonAddPepperoniTapped() {
        let fourVC = FourViewController()
        fourVC.imagePizza = imagePepperoni.image!
        fourVC.name = labelPepperoni.text
        fourVC.sum = 550
        self.present(fourVC, animated: true)
    }
    
    func addLabelMargarita() {
        labelMargarita.frame = CGRect(x: 220, y: 390, width: 150, height: 50)
        labelMargarita.text = "Маргарита"
        labelMargarita.font = UIFont(name: "Cochin-BoldItalic", size: 28)
        labelMargarita.textAlignment = .center
        view.addSubview(labelMargarita)
    }
    
    func addLabelMargaritaIngridients() {
        labelMargaritaIngridients.frame = CGRect(x: 220, y: 420, width: 170, height: 120)
        labelMargaritaIngridients.text = "Тесто, томатный соус, сыр моцарелла, помидоры, базилик"
        labelMargaritaIngridients.font = UIFont(name: "Cochin", size: 18)
        labelMargaritaIngridients.alpha = 0.5
        labelMargaritaIngridients.textAlignment = .left
        labelMargaritaIngridients.numberOfLines = 0
        labelMargaritaIngridients.minimumScaleFactor = 0.5
        view.addSubview(labelMargaritaIngridients)
    }
    
    func addLabelPriceMargarita() {
        labelPriceMargarita.frame = CGRect(x: 220, y: 525, width: 100, height: 50)
        labelPriceMargarita.text = "480 ₽"
        labelPriceMargarita.font = UIFont(name: "Cochin-Bold", size: 28)
        labelPriceMargarita.textAlignment = .left
        view.addSubview(labelPriceMargarita)
    }
    
    func addButtonAddMargarita() {
        buttonAddMargarita.frame = CGRect(x: 300, y: 535, width: 80, height: 30)
        buttonAddMargarita.setTitle("Добавить", for: .normal)
        buttonAddMargarita.layer.cornerRadius = 12
        buttonAddMargarita.backgroundColor = .systemRed
        buttonAddMargarita.setTitleColor(UIColor.white, for: .normal)
        buttonAddMargarita.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(buttonAddMargarita)
        buttonAddMargarita.addTarget(self, action: #selector(buttonAddMargaritaTapped), for: .touchUpInside)
    }
    
    @objc func buttonAddMargaritaTapped() {
        let fourVC = FourViewController()
        fourVC.imagePizza = imageMargarita.image!
        fourVC.name = labelMargarita.text
        fourVC.sum = 480
        self.present(fourVC, animated: true)
    }
}
