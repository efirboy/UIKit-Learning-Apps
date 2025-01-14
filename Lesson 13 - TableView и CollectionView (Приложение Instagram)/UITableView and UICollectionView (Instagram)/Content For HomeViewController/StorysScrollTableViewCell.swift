//
//  StorysScrollTableViewCell.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 17.10.2024.
//

import UIKit

protocol StorysScrollTableViewCellDelegate: AnyObject {
    func didTapStory(at index: Int)
}

final class StorysScrollTableViewCell: UITableViewCell {
    
    //MARK: - Объекты
    
    weak var delegate: StorysScrollTableViewCellDelegate?
    private var storyViews: [UIView] = []
    private let scrollView = UIScrollView()
    private let plusImageView = UIImageView()
    private var gradientLayers = [UIView: CAGradientLayer]()

    //MARK: - Инициализация
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Реализация методов
        addScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Методы
    
    // Создаем и настраиваем ScrollView
    private func addScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: contentView.bounds.width * 2.25, height: contentView.bounds.height)
        contentView.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    // Функция добавления изображения (истории) и никнейма чуть ниже
    func addStorys(storysImage: UIImageView, image: UIImage, x: CGFloat, nicknameLabel: UILabel, nickname: String, storysInactive: Bool, index: Int) {
        
        // Создаем контейнер для рамки
        let imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(imageContainer)
        
        // Настраиваем слои только если история активна
        if !storysInactive {
            // Создаем и настраиваем градиентный слой
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [
                UIColor(red: 0.99, green: 0.69, blue: 0.27, alpha: 1.0).cgColor,
                UIColor(red: 0.99, green: 0.11, blue: 0.11, alpha: 1.0).cgColor,
                UIColor(red: 0.51, green: 0.23, blue: 0.71, alpha: 1.0).cgColor
            ]
            gradientLayer.startPoint = CGPoint(x: 0, y: 1)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
            
            let borderWidth: CGFloat = 1
            gradientLayer.frame = CGRect(x: -borderWidth / 2, y: -borderWidth / 2, width: 90 + borderWidth, height: 90 + borderWidth)
            gradientLayer.cornerRadius = (90 - borderWidth) / 2
            gradientLayer.masksToBounds = true
            
            // Применяем слой к imageContainer
            imageContainer.layer.insertSublayer(gradientLayer, at: 0)
            
            // Добавляем белый слой между градиентной рамкой и изображением
            let whiteLayer = CALayer()
            whiteLayer.backgroundColor = UIColor.white.cgColor
            whiteLayer.frame = CGRect(x: 2, y: 2, width: 86, height: 86)
            whiteLayer.cornerRadius = 43
            whiteLayer.masksToBounds = true
            
            // Устанавливаем белый слой выше градиентного
            imageContainer.layer.insertSublayer(whiteLayer, above: gradientLayer)
            
            // Сохраняем слой в словаре
            gradientLayers[imageContainer] = gradientLayer
        }
        
        // Констрейнты для контейнера
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            imageContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: x),
            imageContainer.heightAnchor.constraint(equalToConstant: 90),
            imageContainer.widthAnchor.constraint(equalTo: imageContainer.heightAnchor)
        ])
        
        // добавляем изображение
        storysImage.contentMode = .scaleAspectFill
        storysImage.translatesAutoresizingMaskIntoConstraints = false
        storysImage.image = image
        storysImage.layer.cornerRadius = 40
        storysImage.clipsToBounds = true
        storysImage.isUserInteractionEnabled = true
        imageContainer.addSubview(storysImage)
        
        // Констрейнты для изображения внутри контейнера
        NSLayoutConstraint.activate([
            storysImage.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            storysImage.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
            storysImage.heightAnchor.constraint(equalToConstant: 80),
            storysImage.widthAnchor.constraint(equalTo: storysImage.heightAnchor)
        ])
        
        // Добавляем никнейм
        nicknameLabel.text = nickname
        nicknameLabel.textColor = .black
        nicknameLabel.font = UIFont.systemFont(ofSize: 12)
        nicknameLabel.textAlignment = .center
        nicknameLabel.numberOfLines = 0
        nicknameLabel.adjustsFontSizeToFitWidth = true
        nicknameLabel.minimumScaleFactor = 0.5
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(nicknameLabel)
        
        // Констрейнты для никнейма
        NSLayoutConstraint.activate([
            nicknameLabel.topAnchor.constraint(equalTo: storysImage.bottomAnchor, constant: 10),
            nicknameLabel.leadingAnchor.constraint(equalTo: storysImage.leadingAnchor),
            nicknameLabel.trailingAnchor.constraint(equalTo: storysImage.trailingAnchor),
            nicknameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // Добавляем значок плюса на изображение "Ваша история"
        plusImageView.image = UIImage(systemName: "plus.circle")
        plusImageView.backgroundColor = .systemBlue
        plusImageView.tintColor = .white
        plusImageView.layer.cornerRadius = 28
        plusImageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(plusImageView)
        NSLayoutConstraint.activate([
            plusImageView.heightAnchor.constraint(equalToConstant: 35),
            plusImageView.widthAnchor.constraint(equalTo: plusImageView.heightAnchor),
            plusImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 65),
            plusImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 75)
        ])
        
        // Обработчик нажатия
        let tapGestureRecognizer = UITapGestureRecognizer()
        storysImage.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.addTarget(self, action: #selector(handleTap))
        imageContainer.tag = index // присваиваем индекс
        storyViews.append(imageContainer) // сохраняем в массив
    }
    
    // По нажатию на сторис меняем цвет градиента на серый (без открытия самой сторис - в данном задании не требуется)
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let tappedView = sender.view?.superview else { return }
        if let gradientLayer = gradientLayers[tappedView] {
            gradientLayer.colors = [
                UIColor.systemGray.withAlphaComponent(0.5).cgColor,
                UIColor.systemGray.withAlphaComponent(0.5).cgColor
            ]
        }
        let index = tappedView.tag // Получаем индекс нажатого элемента
        delegate?.didTapStory(at: index)
    }
}
