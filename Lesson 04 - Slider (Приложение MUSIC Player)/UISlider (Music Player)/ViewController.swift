//
//  ViewController.swift
//  UISlider (Music Player)
//
//  Created by Alexandr Garkalin on 28.08.2024.
//

import UIKit

class ViewController: UIViewController {

    let naming = UILabel()
    let imageSong1 = UIImageView()
    let nameSong1 = UIButton()
    let timeSong1 = UILabel()
    let horizontLine1 = UIView()
    let imageSong2 = UIImageView()
    let nameSong2 = UIButton()
    let timeSong2 = UILabel()
    let horizontLine2 = UIView()
    
    
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
        
        addNaming()
        addImageSong1()
        addNameSong1()
        addTimeSong1()
        addHorizontLine1()
        addImageSong2()
        addNameSong2()
        addTimeSong2()
        addHorizontLine2()
        
    }
    
    func addNaming() {
        naming.frame = CGRect(x: 110, y: 70, width: 200, height: 50)
        naming.text = "Music Player"
        naming.font = UIFont(name: "Chalkduster", size: 24)
        naming.textColor = .black
        self.view.addSubview(naming)
    }
    
    func addImageSong1() {
        imageSong1.frame = CGRect(x: 5, y: 150, width: 100, height: 100)
        imageSong1.image = UIImage(named: "ImageSong1")
        self.view.addSubview(imageSong1)
    }
    
    func addNameSong1() {
        nameSong1.frame = CGRect(x: 70, y: 175, width: 300, height: 50)
        nameSong1.setTitle("Running Up That Hill.mp3", for: .normal)
        nameSong1.titleLabel?.font = UIFont(name: "Cochin-Bold", size: 18)
        nameSong1.titleLabel?.numberOfLines = 0
        nameSong1.setTitleColor(.black, for: .normal)
        nameSong1.backgroundColor = .clear
        self.view.addSubview(nameSong1)
        nameSong1.addTarget(self, action: #selector(nameSong1Tapped), for: .touchUpInside)
    }
    
    @objc func nameSong1Tapped() {
        let secondViewController = SecondViewController()
        secondViewController.imageSecondController = self.imageSong1
        secondViewController.nameSongSecondController = self.nameSong1.title(for: .normal)
        present(secondViewController, animated: true)
    }
    
    func addTimeSong1() {
        timeSong1.frame = CGRect(x: 345, y: 175, width: 100, height: 50)
        timeSong1.text = "4:58"
        timeSong1.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        timeSong1.textColor = UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(timeSong1)
    }
    
    func addHorizontLine1() {
        horizontLine1.frame = CGRect(x: 10, y: 260, width: 500, height: 1)
        horizontLine1.backgroundColor = .black
        self.view.addSubview(horizontLine1)
    }
    
    func addImageSong2() {
        imageSong2.frame = CGRect(x: 5, y: 270, width: 100, height: 100)
        imageSong2.image = UIImage(named: "ImageSong2")
        self.view.addSubview(imageSong2)
    }
    
    func addNameSong2() {
        nameSong2.frame = CGRect(x: 80, y: 295, width: 280, height: 50)
        nameSong2.setTitle("Stranger Things Main Theme.mp3", for: .normal)
        nameSong2.titleLabel?.font = UIFont(name: "Cochin-Bold", size: 14)
        nameSong2.titleLabel?.numberOfLines = 0
        nameSong2.minimumContentSizeCategory = .medium
        nameSong2.setTitleColor(.black, for: .normal)
        nameSong2.backgroundColor = .clear
        self.view.addSubview(nameSong2)
        nameSong2.addTarget(self, action: #selector(nameSong2Tapped), for: .touchUpInside)
    }
    
    @objc func nameSong2Tapped() {
        let secondViewController = SecondViewController()
        secondViewController.imageSecondController = self.imageSong2
        secondViewController.nameSongSecondController = self.nameSong2.title(for: .normal)
        present(secondViewController, animated: true)
    }
    
    func addTimeSong2() {
        timeSong2.frame = CGRect(x: 345, y: 295, width: 100, height: 50)
        timeSong2.text = "1:30"
        timeSong2.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        timeSong2.textColor = UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(timeSong2)
    }
    
    func addHorizontLine2() {
        horizontLine2.frame = CGRect(x: 10, y: 380, width: 500, height: 1)
        horizontLine2.backgroundColor = .black
        self.view.addSubview(horizontLine2)
    }
}

