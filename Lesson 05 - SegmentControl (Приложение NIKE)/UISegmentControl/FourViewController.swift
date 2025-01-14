//
//  FourViewController.swift
//  UISegmentControl
//
//  Created by Alexandr Garkalin on 03.09.2024.
//

import UIKit

class FourViewController: UIViewController {

    let logo = UIImageView()
    let labelInfo = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = UIImage(named: "backgroundImage")
        
        // Устанавливаем режим отображения, чтобы изображение заполнило весь экран
        backgroundImage.contentMode = .scaleAspectFill
        
        // Добавляем UIImageView как подвид (subview) перед добавлением других view
        self.view.addSubview(backgroundImage)
        
        // Перемещаем backgroundImageView на задний план
        self.view.sendSubviewToBack(backgroundImage)
        
        
        addLogo()
        addLabelInfo()
    }
    
    func addLogo() {
        logo.frame = CGRect(x: 65, y: 80, width: 300, height: 200)
        logo.image = UIImage(named: "logo")
        self.view.addSubview(logo)
    }
    
    func addLabelInfo() {
        labelInfo.frame = CGRect(x: 50, y: 280, width: 310, height: 400)
        labelInfo.text = "Nike, Inc. — американская компания, основанная в 1964 году как Blue Ribbon Sports и переименованная в Nike в 1971 году. Она является одним из крупнейших производителей спортивной одежды и обуви в мире. Nike известна своими инновациями, такими как технологии Nike Air и Flyknit, и активно инвестирует в научные разработки. Компания использует знаменитостей для продвижения своей продукции и занимается вопросами устойчивого развития и улучшения условий труда. Nike имеет множество фирменных магазинов и активно развивает онлайн-продажи. С её лозунгом \"Just Do It\" компания символизирует активный и целеустремлённый подход к жизни и спорту."
        labelInfo.font = UIFont(name: "Copperplate", size: 34)
        labelInfo.textColor = .black
        labelInfo.adjustsFontSizeToFitWidth = true
        labelInfo.minimumScaleFactor = 0.5
        labelInfo.numberOfLines = 0
        self.view.addSubview(labelInfo)
    }
}
