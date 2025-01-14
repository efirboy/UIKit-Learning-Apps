//
//  MediaCollectionViewCell.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 09.12.2024.
//

import UIKit

final class MediaCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Объекты
    
    private let imagePost = UIImageView()
    
    var element: MediaPost? {
        didSet {
            if let image = element?.imageName {
                imagePost.image = UIImage(named: image)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Методы
    
    //Настраиваем изображение
    private func setupImageView() {
        imagePost.contentMode = .scaleToFill
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        imagePost.isUserInteractionEnabled = true
        contentView.addSubview(imagePost)
        NSLayoutConstraint.activate([
            imagePost.topAnchor.constraint(equalTo: contentView.topAnchor),
            imagePost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagePost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
}
