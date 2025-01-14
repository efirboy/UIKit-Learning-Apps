//
//  PostTableViewCell.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 28.10.2024.
//

import UIKit

protocol PostTableViewCellDelegate: AnyObject {
    func didTapNicknameButton(in cell: PostTableViewCell)
}

final class PostTableViewCell: UITableViewCell {
    
    //MARK: - Объекты
    
    weak var delegate: PostTableViewCellDelegate?
    var userName: String?
    
    var element: MainPost? {
        didSet {
            if let userPhoto = element?.userPhoto {
                userImage.image = UIImage(named: userPhoto)
            }
            nicknameButton.setTitle(element?.userNickname, for: .normal)
            timePostLabel.text = element?.timePost
            if let postPhoto = element?.postPhoto {
                imagePost.image = UIImage(named: postPhoto)
            }
            quantityLikesLabel.text = element?.quantityLikes
            quantityCommentsLabel.text = element?.quantityComments
            quantitySharesLabel.text = element?.quantityShares
            addAttributedMessageText(language: "English")
            dateLabel.text = element?.datePost
        }
    }
    
    private let userImage = UIImageView()
    private let nicknameButton = UIButton()
    private let verificationImageView = UIImageView()
    private let timePostLabel = UILabel()
    private let settingPostButton = UIButton()
    private let imagePost = UIImageView()
    private let quantityLabel = UILabel()
    private let heartButton = UIButton()
    private let messageButton = UIButton()
    private let shareButton = UIButton()
    private let bookmarkButton = UIButton()
    private let quantityLikesLabel = UILabel()
    private let quantityCommentsLabel = UILabel()
    private let quantitySharesLabel = UILabel()
    private let messagePost = UILabel()
    private let allCommentButton = UIButton()
    private let dateLabel = UILabel()
    private let translateButton = UIButton()
    
    //MARK: - Инициализация
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Реализация методов
        addUserPhoto()
        addUserNickname()
        addVerificationImageView()
        addTimePost()
        addSettingButtonPost()
        addImagePost()
        addButtonsUnderPost(buttonUnderPost: heartButton, systemName: "heart", x: 10)
        addButtonsUnderPost(buttonUnderPost: messageButton, systemName: "bubble.right", x: 120)
        addButtonsUnderPost(buttonUnderPost: shareButton, systemName: "paperplane", x: 230)
        addButtonsUnderPost(buttonUnderPost: bookmarkButton, systemName: "bookmark", x: 360)
        addQuantityActivity(quantityLabel: quantityLikesLabel, x: 40)
        addQuantityActivity(quantityLabel: quantityCommentsLabel, x: 150)
        addQuantityActivity(quantityLabel: quantitySharesLabel, x: 260)
        addMessagePost()
        addAllCommentButton()
        addDateLabel()
        addTranslateButton()
        addTapGestureRecognizer()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Методы
    
    // Добавляем фотографию пользователя поста
    private func addUserPhoto() {
        userImage.contentMode = .scaleAspectFill
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.layer.cornerRadius = 15
        userImage.layer.masksToBounds = true
        contentView.addSubview(userImage)
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userImage.widthAnchor.constraint(equalToConstant: 30),
            userImage.heightAnchor.constraint(equalTo: userImage.widthAnchor)
        ])
    }
    
    // Добавляем никнейм пользователя поста
    private func addUserNickname() {
        nicknameButton.setTitleColor(.black, for: .normal)
        nicknameButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        nicknameButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nicknameButton)
        NSLayoutConstraint.activate([
            nicknameButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nicknameButton.leadingAnchor.constraint(equalTo: userImage.leadingAnchor, constant: 40)
        ])
        nicknameButton.addTarget(self, action: #selector(nicknameButtonTapped), for: .touchUpInside)
    }
    
    // При нажатии на никнейм уведомляем делегата
    @objc func nicknameButtonTapped() {
        delegate?.didTapNicknameButton(in: self)
    }
    
    // Создаем обработчик нажатий для аватарки (рядом с никнеймом)
    private func addTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapUserImage))
        userImage.addGestureRecognizer(tapGesture)
        userImage.isUserInteractionEnabled = true
    }
    
    // При нажатии на аватарку так же уведомляем делегат
    @objc private func didTapUserImage() {
        delegate?.didTapNicknameButton(in: self)
        }
    
    // Добавляем галочку верификации
    private func addVerificationImageView() {
        verificationImageView.image = UIImage(named: "verified")
        verificationImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(verificationImageView)
        NSLayoutConstraint.activate([
            verificationImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
            verificationImageView.leadingAnchor.constraint(equalTo: nicknameButton.trailingAnchor, constant: 5),
            verificationImageView.widthAnchor.constraint(equalToConstant: 15),
            verificationImageView.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    // Добавляем время поста
    private func addTimePost() {
        timePostLabel.font = UIFont.systemFont(ofSize: 14)
        timePostLabel.alpha = 0.5
        timePostLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(timePostLabel)
        NSLayoutConstraint.activate([
            timePostLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
            timePostLabel.leadingAnchor.constraint(equalTo: verificationImageView.trailingAnchor, constant: 10)
        ])
    }
    
    // Добавляем кнопку настроек поста (три точки)
    private func addSettingButtonPost() {
        settingPostButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        settingPostButton.tintColor = .black
        settingPostButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(settingPostButton)
        NSLayoutConstraint.activate([
            settingPostButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            settingPostButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            settingPostButton.widthAnchor.constraint(equalToConstant: 40),
            settingPostButton.heightAnchor.constraint(equalTo: settingPostButton.widthAnchor)
        ])
    }
    
    // Добавляем фотографию поста
    private func addImagePost() {
        imagePost.contentMode = .scaleAspectFill
        imagePost.clipsToBounds = true
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imagePost)
        NSLayoutConstraint.activate([
            imagePost.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 10),
            imagePost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagePost.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    // Универсальная функция для добавления кнопок под постом (лайк, сообщения, поделиться, закладка)
    private func addButtonsUnderPost(buttonUnderPost: UIButton, systemName: String, x: CGFloat) {
        let configuration = UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold)
        buttonUnderPost.setImage(UIImage(systemName: systemName, withConfiguration: configuration), for: .normal)
        buttonUnderPost.tintColor = .black
        buttonUnderPost.contentHorizontalAlignment = .fill
        buttonUnderPost.contentVerticalAlignment = .fill
        buttonUnderPost.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonUnderPost)
        NSLayoutConstraint.activate([
            buttonUnderPost.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 10),
            buttonUnderPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: x),
            buttonUnderPost.widthAnchor.constraint(equalToConstant: 25),
            buttonUnderPost.heightAnchor.constraint(equalTo: buttonUnderPost.widthAnchor)
        ])
    }

    // Универсальная функция для добавления элементов содержимого активности (количества лайков, сообщений и поделиться)
    private func addQuantityActivity(quantityLabel: UILabel, x: CGFloat) {
        quantityLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(quantityLabel)
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 15),
            quantityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: x)
        ])
    }
    
    // Добавляем текст сообщения в посте
    private func addMessagePost() {
        messagePost.font = UIFont(name: "HelveticaNeue", size: 14)
        messagePost.numberOfLines = 0
        messagePost.textAlignment = .justified
        messagePost.lineBreakMode = .byWordWrapping
        messagePost.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(messagePost)
        NSLayoutConstraint.activate([
            messagePost.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 50),
            messagePost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            messagePost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
        ])
    }
    
    // Функция создания аттрибутированного текста сообщения (никнейм выделен жирным)
    private func addAttributedMessageText(language: String) {
        // Создаем аттрибутированный текст, где только никнейм выделен жирным
        let messageText: String
        if language == "English" {
            messageText = "\(element?.userNickname ?? "DefaultNickname") \(element?.messagePost ?? "DefaultMessage")"
        } else {
            messageText = "\(element?.userNickname ?? "DefaultNickname") \(element?.messagePostTranslate ?? "DefaultMessage")"
        }
        let attributedText = NSMutableAttributedString(string: messageText, attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14)!])
        attributedText.addAttribute(.font, value: UIFont(name: "HelveticaNeue-Bold", size: 14)!, range: NSRange(location: 0, length: (element?.userNickname?.count) ?? 0))
        messagePost.attributedText = attributedText
    }
    
    //  Добавляем кнопку "Смотреть все комментарии"
    private func addAllCommentButton() {
        allCommentButton.setTitle("Смотреть все комментарии", for: .normal)
        allCommentButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 14)
        allCommentButton.setTitleColor(.black, for: .normal)
        allCommentButton.alpha = 0.5
        allCommentButton.titleLabel?.textAlignment = .left
        allCommentButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(allCommentButton)
        NSLayoutConstraint.activate([
            allCommentButton.topAnchor.constraint(equalTo: messagePost.bottomAnchor, constant: 3),
            allCommentButton.leadingAnchor.constraint(equalTo: messagePost.leadingAnchor)
        ])
    }
    
    // Добавляем лейбл с датой
    private func addDateLabel() {
        dateLabel.font = UIFont(name: "HelveticaNeue", size: 12)
        dateLabel.alpha = 0.5
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: allCommentButton.bottomAnchor, constant: 3),
            dateLabel.leadingAnchor.constraint(equalTo: allCommentButton.leadingAnchor)
        ])
    }
    
    // Добавляем кнопку перевода
    private func addTranslateButton() {
        translateButton.setTitle("Показать перевод", for: .normal)
        translateButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        translateButton.setTitleColor(.black, for: .normal)
        translateButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(translateButton)
        NSLayoutConstraint.activate([
            translateButton.topAnchor.constraint(equalTo: allCommentButton.bottomAnchor, constant: -4),
            translateButton.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 5)
        ])
        translateButton.addTarget(self, action: #selector(translateButtonTapped), for: .touchUpInside)
    }
    
    @objc private func translateButtonTapped() {
        translateButton.isSelected.toggle()
        if translateButton.isSelected {
            translateButton.setTitle("Вернуть к оригиналу", for: .normal)
            addAttributedMessageText(language: "Russian")
        } else {
            translateButton.setTitle("Показать перевод", for: .normal)
            addAttributedMessageText(language: "English")
        }
    }
    
}
