//
//  MediaSectionHeaderView.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 10.12.2024.
//

import UIKit

final class MediaSectionHeaderView: UICollectionReusableView {
    
    static let identifier = "MediaSectionHeaderView"
    
    private let imageSectionOne = UIImageView()
    private let imageSectionTwo = UIImageView()
    private let imageSectionThree = UIImageView()
    private let lineLayer = CALayer() // линия для визуального эффекта выбора секции
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Настраиваем внешний вид
        imageSectionOne.image = UIImage(systemName: "square.grid.3x3")
        imageSectionOne.tintColor = .black
        imageSectionTwo.image = UIImage(named: "unselectReels")
        imageSectionThree.image = UIImage(systemName: "person.crop.square")
        imageSectionThree.tintColor = .black
        lineLayer.frame = CGRect(x: 34, y: 45, width: 60, height: 2)
        lineLayer.backgroundColor = UIColor.black.cgColor
        
        
        // Добавляем изображения секций и линию
        addSubview(imageSectionOne)
        addSubview(imageSectionTwo)
        addSubview(imageSectionThree)
        layer.addSublayer(lineLayer)
        
        // Размещаем изображения
        imageSectionOne.translatesAutoresizingMaskIntoConstraints = false
        imageSectionTwo.translatesAutoresizingMaskIntoConstraints = false
        imageSectionThree.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageSectionOne.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageSectionOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            imageSectionOne.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/15),
            imageSectionOne.heightAnchor.constraint(equalTo: imageSectionOne.widthAnchor),
            
            imageSectionTwo.leadingAnchor.constraint(equalTo: imageSectionOne.trailingAnchor, constant: 100),
            imageSectionTwo.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageSectionTwo.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/10),
            imageSectionTwo.heightAnchor.constraint(equalTo: imageSectionTwo.widthAnchor),
            
            imageSectionThree.leadingAnchor.constraint(equalTo: imageSectionTwo.trailingAnchor, constant: 100),
            imageSectionThree.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageSectionThree.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/15),
            imageSectionThree.heightAnchor.constraint(equalTo: imageSectionThree.widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
