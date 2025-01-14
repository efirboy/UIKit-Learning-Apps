//
//  InfoUserTableViewCell.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 13.11.2024.
//

import UIKit

protocol StorysViewCellDelegate: AnyObject {
    func didTapStorys(in cell: UITableViewCell)
}

protocol UserViewControllerDelegate: AnyObject {
    func didTapSubscriber(subscriber: String)
}

final class InfoUserTableViewCell: UITableViewCell {

    //MARK: - Объекты
    weak var delegate: StorysViewCellDelegate?
    weak var delegateSubscriber: UserViewControllerDelegate?
    private let userImage = UIImageView()
    private let gradientLayer = CAGradientLayer()
    private let nicknameLabel = UILabel()
    private let proffesionButton = UIButton()
    private let bioLabel = UILabel()
    private let locationButton = UIButton()
    private let translateButton = UIButton()
    private let subscribersLabel = UILabel()
    private let subscriberNicknameButton = UIButton()
    private let subscribeButton = UIButton()
    private let messageButton = UIButton()
    private let publicationsButton = UIButton()
    private let subscribersButton = UIButton()
    private let subscriptionsButton = UIButton()
    
    var element: UserInfo? {
        didSet {
            userImage.image = UIImage(named: element!.imageName!)
            nicknameLabel.text = element?.username
            proffesionButton.setTitle(element?.proffesion, for: .normal)
            bioLabel.text = element?.bio
            locationButton.setTitle(element?.location, for: .normal)
            subscriberNicknameButton.setTitle(element?.subscribers, for: .normal)
        }
    }

    //MARK: - Инициализация
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUserImage()
        addTapGestureRecognizer()
        setupNicknameLabel()
        setupProffesion()
        setupBioLabel()
        setupLocationButton()
        setupTranslateButton()
        setupSubscribersLabel()
        setupSubscriberNicknameButton()
        setupSubscribeButton()
        setupMessageButton()
        setupPublicationsButton()
        setupSubscribersButton()
        setupSubscriptionsButton()
        updateTextActivityButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Удаляем старый градиент, чтобы не дублировать слои
        contentView.layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        addGradientLayer()
    }
    
    //MARK: - Методы
    
    // Добавляем изображение
    private func setupUserImage() {
        userImage.contentMode = .scaleAspectFill
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.layer.cornerRadius = 40
        userImage.clipsToBounds = true
        userImage.isUserInteractionEnabled = true
        contentView.addSubview(userImage)
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userImage.widthAnchor.constraint(equalToConstant: 80),
            userImage.heightAnchor.constraint(equalTo: userImage.widthAnchor)
        ])
    }
    
    // Добавляем градиентную рамку на изображение
    private func addGradientLayer() {
        gradientLayer.colors = [
            UIColor(red: 0.99, green: 0.69, blue: 0.27, alpha: 1.0).cgColor,
            UIColor(red: 0.99, green: 0.11, blue: 0.11, alpha: 1.0).cgColor,
            UIColor(red: 0.51, green: 0.23, blue: 0.71, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = userImage.frame.insetBy(dx: -5.5, dy: -5.5)
        gradientLayer.cornerRadius = gradientLayer.frame.width / 2
        contentView.layer.insertSublayer(gradientLayer, below: userImage.layer)
        // Добавляем белый слой между градиентной рамкой и изображением
        let whiteLayer = CALayer()
        whiteLayer.backgroundColor = UIColor.white.cgColor
        whiteLayer.cornerRadius = 40
        whiteLayer.frame = userImage.frame.insetBy(dx: -2, dy: -2)
        contentView.layer.insertSublayer(whiteLayer, above: gradientLayer)
    }
    
    // Добавляем обработчик нажатия
    private func addTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer()
        userImage.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.addTarget(self, action: #selector(handleTap))
    }
    
    // По нажатию на фотографию делаем рамку сторис серой и сообщаем делегату
    @objc private func handleTap() {
        gradientLayer.colors = [
            UIColor.systemGray.withAlphaComponent(0.5).cgColor,
            UIColor.systemGray.withAlphaComponent(0.5).cgColor
        ]
        delegate?.didTapStorys(in: self)
    }
    
    // Добавялем никнейм
    private func setupNicknameLabel() {
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        nicknameLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        nicknameLabel.textAlignment = .left
        contentView.addSubview(nicknameLabel)
        NSLayoutConstraint.activate([
            nicknameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 80),
            nicknameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nicknameLabel.widthAnchor.constraint(equalToConstant: 120),
            nicknameLabel.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    // Добавляем профессию
    private func setupProffesion() {
        proffesionButton.translatesAutoresizingMaskIntoConstraints = false
        proffesionButton.setTitleColor(.systemBlue, for: .normal)
        proffesionButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        contentView.addSubview(proffesionButton)
        NSLayoutConstraint.activate([
            proffesionButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 95),
            proffesionButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            proffesionButton.widthAnchor.constraint(equalToConstant: 80),
            proffesionButton.heightAnchor.constraint(equalTo: proffesionButton.widthAnchor)
        ])
    }
    
    // Добавляем информацию о себе (био)
    private func setupBioLabel() {
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.font = UIFont.systemFont(ofSize: 14)
        bioLabel.textAlignment = .left
        bioLabel.numberOfLines = 0
        contentView.addSubview(bioLabel)
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 140),
            bioLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bioLabel.widthAnchor.constraint(equalToConstant: 350),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    // Добавляем информацию о местоположении
    private func setupLocationButton() {
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setTitleColor(.systemBlue, for: .normal)
        locationButton.contentHorizontalAlignment = .left
        locationButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        contentView.addSubview(locationButton)
        NSLayoutConstraint.activate([
            locationButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 160),
            locationButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            locationButton.widthAnchor.constraint(equalToConstant: 150),
            locationButton.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    // Добавляем кнопку перевода
    private func setupTranslateButton() {
        translateButton.translatesAutoresizingMaskIntoConstraints = false
        translateButton.setTitle("Показать перевод", for: .normal)
        translateButton.setTitleColor(.black, for: .normal)
        translateButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        contentView.addSubview(translateButton)
        NSLayoutConstraint.activate([
            translateButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 150),
            translateButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1),
            translateButton.widthAnchor.constraint(equalToConstant: 150),
            translateButton.heightAnchor.constraint(equalTo: translateButton.widthAnchor)
        ])
    }
    
    // Добавялем лейбл "Подписаны"
    private func setupSubscribersLabel() {
        subscribersLabel.translatesAutoresizingMaskIntoConstraints = false
        subscribersLabel.text = "Подписаны:"
        subscribersLabel.textAlignment = .left
        subscribersLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(subscribersLabel)
        NSLayoutConstraint.activate([
            subscribersLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 225),
            subscribersLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            subscribersLabel.widthAnchor.constraint(equalToConstant: 85),
            subscribersLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // Добавляем никнейм того, кто подписан
    private func setupSubscriberNicknameButton() {
        subscriberNicknameButton.translatesAutoresizingMaskIntoConstraints = false
        subscriberNicknameButton.setTitleColor(.black, for: .normal)
        subscriberNicknameButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        contentView.addSubview(subscriberNicknameButton)
        NSLayoutConstraint.activate([
            subscriberNicknameButton.topAnchor.constraint(equalTo: subscribersLabel.topAnchor),
            subscriberNicknameButton.leadingAnchor.constraint(equalTo: subscribersLabel.trailingAnchor, constant: -10),
            subscriberNicknameButton.widthAnchor.constraint(equalToConstant: 85),
            subscriberNicknameButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        subscriberNicknameButton.addTarget(self, action: #selector(subscriberNicknameButtonTapped), for: .touchUpInside)
    }
    
    // Уведомляем делегат, кто именно подписан
    @objc private func subscriberNicknameButtonTapped() {
        if let subscriber = subscriberNicknameButton.titleLabel?.text {
            delegateSubscriber?.didTapSubscriber(subscriber: subscriber)
        }
    }
    
    // Добавляем кнопку "Подписаться"
    private func setupSubscribeButton() {
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.setTitle("Подписаться", for: .normal)
        subscribeButton.setTitleColor(.white, for: .normal)
        subscribeButton.backgroundColor = .systemBlue
        subscribeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        subscribeButton.layer.cornerRadius = 10
        subscribeButton.clipsToBounds = true
        contentView.addSubview(subscribeButton)
        NSLayoutConstraint.activate([
            subscribeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 280),
            subscribeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            subscribeButton.widthAnchor.constraint(equalToConstant: 185),
            subscribeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        subscribeButton.addTarget(self, action: #selector(subscribeButtonTapped), for: .touchUpInside)
    }
    
    // Подписываемся и отписываемся при нажатиях на кнопку
    @objc private func subscribeButtonTapped(_ sender: UIButton) {
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
    
    // Добавляем кнопку "Сообщение"
    private func setupMessageButton() {
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        messageButton.setTitle("Сообщение", for: .normal)
        messageButton.setTitleColor(.black, for: .normal)
        messageButton.backgroundColor = .systemGray.withAlphaComponent(0.2)
        messageButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        messageButton.layer.cornerRadius = 10
        messageButton.clipsToBounds = true
        contentView.addSubview(messageButton)
        NSLayoutConstraint.activate([
            messageButton.topAnchor.constraint(equalTo: subscribeButton.topAnchor),
            messageButton.leadingAnchor.constraint(equalTo: subscribeButton.trailingAnchor, constant: 5),
            messageButton.widthAnchor.constraint(equalToConstant: 185),
            messageButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // Функция разделения текста (понадобится для количества публикаций, подписчиков и подписок)
    private func configureActivityText(with text: String, button: UIButton) {
        // разделяем количество активностей (публикаций, подписчиков или подписок и их текстовое наименование)
        let components = text.split(separator: " ", omittingEmptySubsequences: true)
        let numberPart = components.dropLast().joined(separator: " ") // все слова, кроме последнего
        let descriptionPart = components.last // последнее слово (текстовое описание - "публикации", "подписчиков" или "подписки"
        // Создаем аттрибутированный текст
        let attributedText = NSMutableAttributedString(
            string: "\(numberPart)\n",
            attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .bold), .foregroundColor: UIColor.black])
        attributedText.append(NSAttributedString(
            string: String(descriptionPart ?? ""),
            attributes: [
                .font: UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.black
            ] ))
        // устанавливаем атрибутированный текст на кнопку
        button.setAttributedTitle(attributedText, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
    }
    
    // Добавляем кнопку количества публикаций
    private func setupPublicationsButton() {
        publicationsButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(publicationsButton)
        NSLayoutConstraint.activate([
            publicationsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            publicationsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90),
            publicationsButton.widthAnchor.constraint(equalToConstant: 95),
            publicationsButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // Добавляем кнопку количества подписчиков
    private func setupSubscribersButton() {
        subscribersButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subscribersButton)
        NSLayoutConstraint.activate([
            subscribersButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            subscribersButton.leadingAnchor.constraint(equalTo: publicationsButton.trailingAnchor, constant: 5),
            subscribersButton.widthAnchor.constraint(equalToConstant: 95),
            subscribersButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // Добавляем кнопку количества подписок
    private func setupSubscriptionsButton() {
        subscriptionsButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subscriptionsButton)
        NSLayoutConstraint.activate([
            subscriptionsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            subscriptionsButton.leadingAnchor.constraint(equalTo: subscribersButton.trailingAnchor, constant: 5),
            subscriptionsButton.widthAnchor.constraint(equalToConstant: 95),
            subscriptionsButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // Функция асинхронного обновления текста кнопок
    private func updateTextActivityButtons() {
        DispatchQueue.main.async { [self] in
            configureActivityText(with: element?.countPublications ?? "", button: publicationsButton)
            configureActivityText(with: element?.countSubscribers ?? "", button: subscribersButton)
            configureActivityText(with: element?.countSubscriptions ?? "", button: subscriptionsButton)
        }
    }
}



