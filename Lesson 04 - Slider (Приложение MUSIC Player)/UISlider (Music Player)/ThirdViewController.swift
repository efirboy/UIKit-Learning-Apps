//
//  ThirdViewController.swift
//  UISlider (Music Player)
//
//  Created by Alexandr Garkalin on 29.08.2024.
//

import UIKit

class ThirdViewController: UIViewController {

    var image = UIImageView()
    var name: String?
    
    let labelName = UILabel()
    let labelAboutSong = UILabel()
    let imageView = UIImageView()
    
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

        addLabelName()
        addImage()
        addLabelAboutSong()
        
    }
    
    func addLabelName() {
        labelName.frame = CGRect(x: 0, y: 35, width: 390, height: 30)
        labelName.text = name
        labelName.textAlignment = .center
        labelName.font = UIFont.boldSystemFont(ofSize: 24)
        labelName.textColor = .black
        self.view.addSubview(labelName)
    }
    
    func addImage() {
        imageView.frame = CGRect(x: 10, y: 50, width: 350, height: 350)
        imageView.image = image.image
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        let shadowView = UIView(frame: CGRect(x: 10, y: 50, width: 350, height: 350))
        shadowView.backgroundColor = .clear
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 8)
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowOpacity = 0.9
        self.view.addSubview(shadowView)
        shadowView.addSubview(imageView)
    }
    
    func addLabelAboutSong() {
        labelAboutSong.frame = CGRect(x: 50, y: 440, width: 300, height: 330)
        if labelName.text == "Running Up That Hill" {
            labelAboutSong.text = "В четвертом сезоне сериала \"Очень странные дела\" важным музыкальным моментом стала сцена, где Макс Мэйфилд слушает песню \"Running Up That Hill (A Deal with God)\" британской певицы Кейт Буш (Kate Bush). Эта песня стала символичной для её персонажа в этом сезоне. \"Running Up That Hill\" — это синти-поп композиция, которая сочетает мощный вокал Кейт Буш и мелодичные синтезаторы. В тексте песни Кейт поёт о желании обменяться местами с другим человеком, чтобы лучше понять его переживания. Эта песня является одной из самых известных в репертуаре Буш и была высоко оценена критиками."
        } else if labelName.text == "Stranger Things Main Theme" {
            labelAboutSong.text = "\"Stranger Things Main Theme\" — это главный музыкальный мотив сериала \"Очень странные дела\" (Stranger Things), который стал символом шоу и получил большое признание за свою атмосферность и уникальный стиль. Саундтрек стал культовым и приобрел популярность далеко за пределами сериала. Музыка к сериалу получила признание критиков и помогла усилить ощущение ретро-эстетики, которая является центральной темой шоу.Песня сопровождает вступительные титры сериала и сразу погружает зрителя в атмосферу загадочности и ужаса, что прекрасно отражает основное настроение \"Очень странных дел\"."
        }
        labelAboutSong.font = UIFont(name: "Copperplate", size: 14)
        labelAboutSong.textColor = .black
        labelAboutSong.adjustsFontSizeToFitWidth = true
        labelAboutSong.minimumScaleFactor = 0.5
        labelAboutSong.numberOfLines = 0
        self.view.addSubview(labelAboutSong)
    }
}
