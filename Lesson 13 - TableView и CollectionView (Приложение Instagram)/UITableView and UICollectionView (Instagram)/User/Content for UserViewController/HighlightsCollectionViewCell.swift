//
//  HighlightsCollectionViewCell.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 26.11.2024.
//

import UIKit

final class HighlightsCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Объекты
    
    private let imageHighlight = UIImageView()
    private let nameHighlightLabel = UILabel()
    let gradientLayer = CAGradientLayer()
    
    var element: Highlights? {
        didSet {
            nameHighlightLabel.text = element?.nameHighlights
            if let image = element?.imageName {
                imageHighlight.image = UIImage(named: image)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        setupNameHighlightLabel()
        addTapGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layoutIfNeeded()
        if gradientLayer.superlayer == nil {
            addGradientLayer()
        }
    }
    
    //MARK: - Методы
    
    // Настраиваем изображение
    private func setupImageView() {
        imageHighlight.contentMode = .scaleAspectFill
        imageHighlight.translatesAutoresizingMaskIntoConstraints = false
        imageHighlight.layer.cornerRadius = 30
        imageHighlight.clipsToBounds = true
        imageHighlight.isUserInteractionEnabled = true
        contentView.addSubview(imageHighlight)
        NSLayoutConstraint.activate([
            imageHighlight.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageHighlight.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageHighlight.widthAnchor.constraint(equalToConstant: 60),
            imageHighlight.heightAnchor.constraint(equalTo: imageHighlight.widthAnchor)
        ])
    }
    
    // Добавляем градиентный слой
    private func addGradientLayer() {
        gradientLayer.colors = [
            UIColor(red: 0.99, green: 0.69, blue: 0.27, alpha: 1.0).cgColor,
            UIColor(red: 0.99, green: 0.11, blue: 0.11, alpha: 1.0).cgColor,
            UIColor(red: 0.51, green: 0.23, blue: 0.71, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = imageHighlight.frame.insetBy(dx: -5.5, dy: -5.5)
        gradientLayer.cornerRadius = gradientLayer.frame.width / 2
        contentView.layer.insertSublayer(gradientLayer, below: imageHighlight.layer)
        // Добавляем белый слой между градиентной рамкой и изображением
        let whiteLayer = CALayer()
        whiteLayer.backgroundColor = UIColor.white.cgColor
        whiteLayer.cornerRadius = 30
        whiteLayer.frame = imageHighlight.frame.insetBy(dx: -2, dy: -2)
        contentView.layer.insertSublayer(whiteLayer, above: gradientLayer)
    }
    
    // Добавляем обработчик нажатия
    private func addTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.cancelsTouchesInView = false
        imageHighlight.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.addTarget(self, action: #selector(handleTap))
    }
    
    // По нажатию на фотографию делаем рамку сторис серой
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        gradientLayer.colors = [
            UIColor.systemGray.withAlphaComponent(0.5).cgColor,
            UIColor.systemGray.withAlphaComponent(0.5).cgColor
        ]
    }
    
    // Настраиваем название хайлайта
    private func setupNameHighlightLabel() {
        nameHighlightLabel.translatesAutoresizingMaskIntoConstraints = false
        nameHighlightLabel.textAlignment = .center
        nameHighlightLabel.font = UIFont.systemFont(ofSize: 10)
        contentView.addSubview(nameHighlightLabel)
        NSLayoutConstraint.activate([
            nameHighlightLabel.topAnchor.constraint(equalTo: imageHighlight.bottomAnchor, constant: 5),
            nameHighlightLabel.leadingAnchor.constraint(equalTo: imageHighlight.leadingAnchor),
            nameHighlightLabel.trailingAnchor.constraint(equalTo: imageHighlight.trailingAnchor),
            nameHighlightLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}
