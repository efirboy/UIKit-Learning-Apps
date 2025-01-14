//
//  RecommendationsViewCell.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 29.10.2024.
//

import UIKit

final class RecommendationsViewCell: UITableViewCell {

    //MARK: - Объекты
    private let recomendationLabel = UILabel()
    private let recomendationScrollView = UIScrollView()
    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    private var recommendationViews = [UIView]()
    private let jotaPhoto = UIImageView()
    private let yamalPhoto = UIImageView()
    private let hollandPhoto = UIImageView()
    private let jotaLabel = UILabel()
    private let forYouLabelJota = UILabel()
    private let subscribeButtonJota = UIButton()
    private let yamalLabel = UILabel()
    private let forYouLabelYamal = UILabel()
    private let subscribeButtonYamal = UIButton()
    private let hollandLabel = UILabel()
    private let forYouLabelHolland = UILabel()
    private let subscribeButtonHolland = UIButton()
    
    
    //MARK: - Инициализация
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        
        // Реализация методов
        addRecomendationLabel()
        addRecomendationScrollView()
        addRecomendationView(myView: firstView, x: 0)
        addRecomendationView(myView: secondView, x: 250)
        addRecomendationView(myView: thirdView, x: 500)
        addRecommendationPhoto(image: jotaPhoto, named: "Jota", labelLogin: jotaLabel, textLogin: "diogoj_18", forYouLabel: forYouLabelJota, button: subscribeButtonJota, position: 0)
        addRecommendationPhoto(image: yamalPhoto, named: "Yamal", labelLogin: yamalLabel, textLogin: "lamineyamal", forYouLabel: forYouLabelYamal, button: subscribeButtonYamal, position: 1)
        addRecommendationPhoto(image: hollandPhoto, named: "Holland", labelLogin: hollandLabel, textLogin: "erling", forYouLabel: forYouLabelHolland, button: subscribeButtonHolland, position: 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Методы
    
    // Добавляем лейбл "Рекомендуем Вам"
    private func addRecomendationLabel() {
        recomendationLabel.text = "Рекомендуем Вам"
        recomendationLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        recomendationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(recomendationLabel)
        NSLayoutConstraint.activate([
            recomendationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            recomendationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            recomendationLabel.widthAnchor.constraint(equalToConstant: 150),
            recomendationLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // Добавляем scrollView
    private func addRecomendationScrollView() {
        recomendationScrollView.contentSize = CGSize(width: contentView.bounds.width * 2.36, height: 270)
        recomendationScrollView.showsHorizontalScrollIndicator = false
        recomendationScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(recomendationScrollView)
        NSLayoutConstraint.activate([
            recomendationScrollView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            recomendationScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            recomendationScrollView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            recomendationScrollView.heightAnchor.constraint(equalToConstant: 270)
        ])
    }
    
    // Универсальная функция добавления вьюшек
    private func addRecomendationView(myView: UIView, x: CGFloat) {
        myView.backgroundColor = .white
        myView.translatesAutoresizingMaskIntoConstraints = false
        recomendationScrollView.addSubview(myView)
        NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: recomendationScrollView.topAnchor),
            myView.leadingAnchor.constraint(equalTo: recomendationScrollView.leadingAnchor, constant: x),
            myView.heightAnchor.constraint(equalTo: recomendationScrollView.heightAnchor),
            myView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6)
        ])
        // сохраняем ссылку на вьюшку
        recommendationViews.append(myView)
    }
    
    // Универсальная функция для добавления контента вьюшек (фото, логин, лейбл рекомендации, кнопка)
    private func addRecommendationPhoto(image: UIImageView, named: String, labelLogin: UILabel, textLogin: String, forYouLabel: UILabel, button: UIButton, position: Int) {
        guard position >= 0 && position < recommendationViews.count else { return }
        let view = recommendationViews[position]
        // настраиваем фото
        image.image = UIImage(named: named)
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            image.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -70),
            image.heightAnchor.constraint(equalTo: image.widthAnchor)
        ])
        // настраиваем лейбл логина
        labelLogin.text = textLogin
        labelLogin.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        labelLogin.textAlignment = .center
        labelLogin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelLogin)
        NSLayoutConstraint.activate([
            labelLogin.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            labelLogin.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            labelLogin.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            labelLogin.heightAnchor.constraint(equalToConstant: 20)
        ])
        // настраиваем лейбл "Рекомендации для Вас"
        forYouLabel.text = "Рекомендации для Вас"
        forYouLabel.font = UIFont.systemFont(ofSize: 12)
        forYouLabel.alpha = 0.5
        forYouLabel.textAlignment = .center
        forYouLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forYouLabel)
        NSLayoutConstraint.activate([
            forYouLabel.topAnchor.constraint(equalTo: labelLogin.bottomAnchor),
            forYouLabel.leadingAnchor.constraint(equalTo: labelLogin.leadingAnchor),
            forYouLabel.trailingAnchor.constraint(equalTo: labelLogin.trailingAnchor),
            forYouLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        // настраиваем кнопку "Подписаться"
        button.setTitle("Подписаться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: forYouLabel.bottomAnchor, constant: 5),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            button.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        button.addTarget(self, action: #selector(buttonSubscribeTapped), for: .touchUpInside)
        
        // Асинхронно скругляем углы у вьюшки
        DispatchQueue.main.async {
            image.layer.cornerRadius = image.bounds.height / 2
            image.layer.masksToBounds = true
        }
    }
    
    // Подписываемся и отписываемся при нажатиях на кнопку
    @objc private func buttonSubscribeTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.setTitle("Вы подписаны", for: .normal)
            sender.setTitleColor(.black, for: .normal)
            sender.backgroundColor = .systemGray.withAlphaComponent(0.2)
        } else {
            sender.setTitle("Подписаться", for: .normal)
            sender.setTitleColor(.white, for: .normal)
            sender.backgroundColor = .systemBlue
        }
    }
    
}
