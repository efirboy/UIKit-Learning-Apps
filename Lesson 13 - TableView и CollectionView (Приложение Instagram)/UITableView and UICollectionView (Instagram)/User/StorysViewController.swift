//
//  StorysViewController.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 27.11.2024.
//

import UIKit

final class StorysViewController: UIViewController {
    
    //MARK: - Объекты
    var nickname: String?
    var selectedMainPageIndex: Int?
    var selectedHighlightIndex: Int?
    private let storiesData: [String: [Int: (date: String, image: String)]] = [
            "leomessi": [
                -1: ("12 ч.", "MessiStorys"),
                0: ("17 ноября 2024 г.", "Barcelona"),
                1: ("03 июня 2024 г.", "PSG"),
                2: ("26 февраля 2024 г.", "Family"),
                3: ("12 января 2024 г.", "CampNow"),
                4: ("06 октября 2023 г.", "InterMiami"),
                5: ("11 августа 2023 г.", "Friends")
            ],
            "k.mbappe": [
                -1: ("3 ч.", "MbappeStorys"),
                0: ("25 декабря 2024 г.", "Paris"),
                1: ("08 сентября 2024 г.", "Monaco"),
                2: ("07 июля 2024 г.", "Cars"),
                3: ("03 марта 2024 г.", "SantiagoBernabeu"),
                4: ("02 декабря 2023 г.", "RealMadrid"),
                5: ("18 декабря 2022 г.", "WorldCup")
            ],
            "neymarjr": [
                -1: ("23 ч.", "NeymarStorys"),
                0: ("11 ноября 2024 г.", "Blaze"),
                1: ("28 августа 2024 г.", "INJr"),
                2: ("12 мая 2024 г.", "Poker"),
                3: ("19 января 2024 г.", "Games"),
                4: ("06 июня 2023 г.", "Brazil"),
                5: ("04 апреля 2021 г.", "Santos") ]
    ]
    
    private var timer: Timer?
    private let storysProgressView = UIProgressView(progressViewStyle: .default)
    private let closeButton = UIButton()
    private let userImageView = UIImageView()
    private let nicknameLabel = UILabel()
    private let timeStorysLabel = UILabel()
    private let settingStorysButton = UIButton()
    private let storysImageView = UIImageView()
    private let storysTextField = UITextField()
    private var storysTextFieldConstraints: [NSLayoutConstraint] = []
    private let dimLayer = UIView()
    private var smileButtons: [UIButton] = []
    private let sendButton = UIButton()
    private let rightViewContainer = UIView()
    private let heartButton = UIButton()
    private let shareButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeSwipeStorys()
        setupStorysProgressView()
        setupStorysElements()
        addUserImageView()
        addNicknameLabel()
        addTimeStorysLabel()
        addSettingButtonPost()
        setupCloseButton()
        addStorysImageView()
        addStorysTextField()
        registerForKeyboardNotifications()
        addTapGestureUser()
        replySwipeStorys()
        addSendButton()
        addHeartButton()
        addShareButton()
    }
    
    //MARK: - Методы
    
    // Настраиваем сторис исходя из того, с какого экрана было взаимодействие
    private func setupStorysElements() {
        // Если выбран индекс с главной страницы
        if let mainPageIndex = selectedMainPageIndex {
            setupFromMainPageIndex(mainPageIndex)
            return
        }
        // Если выбран пользователь и индекс из Highlights
        setupFromUserPage()
    }
    
    private func setupFromMainPageIndex(_ index: Int) {
        // Данные для главной страницы
        let mainPageData: [Int: (nickname: String, imageName: String, time: String)] = [
            1: ("neymarjr", "Neymar", "23 ч."),
            2: ("leomessi", "Messi", "12 ч."),
            3: ("k.mbappe", "Mbappe", "3 ч."),
            4: ("cristiano", "Ronaldo", "11 ч."),
            5: ("vinijr", "Vinicius", "8 ч."),
            6: ("lukamodric10", "Modric", "19 ч.")
        ]
        
        guard let data = mainPageData[index] else { return }
        nickname = data.nickname
        userImageView.image = UIImage(named: data.imageName)
        timeStorysLabel.text = data.time
        storysImageView.image = UIImage(named: "\(data.imageName)Storys")
    }

    private func setupFromUserPage() {
        guard let nickname = nickname, let userStories = storiesData[nickname] else { return }
        
        // Настраиваем аватар пользователя
        userImageView.image = UIImage(named: imageForNickname(nickname))
        
        // Получаем сторис по индексу или используем -1 (последнюю сторис)
        let highlightIndex = selectedHighlightIndex ?? -1
        guard let (date, imageName) = userStories[highlightIndex] else { return }
        timeStorysLabel.text = date
        storysImageView.image = UIImage(named: imageName)
    }

    private func imageForNickname(_ nickname: String) -> String {
        switch nickname {
        case "leomessi": return "Messi"
        case "k.mbappe": return "Mbappe"
        case "neymarjr": return "Neymar"
        case "cristiano": return "Ronaldo"
        case "vinijr": return "Vinicius"
        case "lukamodric10": return "Modric"
        default: return ""
        }
    }
    
    // Метод, который останавливает таймер и закрывает сторис
    private func closeStorys() {
        timer?.invalidate()
        timer = nil
        dismiss(animated: true)
    }
    
    // Настраиваем, чтобы сторис закрывалась свайпом вниз
    private func closeSwipeStorys() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
        swipeGesture.direction = .down
        view.addGestureRecognizer(swipeGesture)
    }
    
    // Если открыта клавиатура, свайп закрывает ее; если закрыта, свайп закрывает саму сторис
    @objc private func handleSwipeGesture() {
        if storysTextField.isFirstResponder {
            storysTextField.resignFirstResponder()
        } else {
            closeStorys()
        }
    }
    
    // Создаем полоску прогресса сторис
    private func setupStorysProgressView() {
        storysProgressView.progress = 0.0
        storysProgressView.progressTintColor = .white
        storysProgressView.trackTintColor = .systemGray.withAlphaComponent(0.8)
        storysProgressView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(storysProgressView)
        NSLayoutConstraint.activate([
            storysProgressView.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            storysProgressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            storysProgressView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            storysProgressView.heightAnchor.constraint(equalToConstant: 2)
        ])
        startTimer()
    }
    
    // Функция запуска таймера
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    
    // обновление полоски прогресса сторис
    @objc private func updateProgress() {
        if storysProgressView.progress < 1.0 {
            let newProgress = storysProgressView.progress + 0.015
            UIView.animate(withDuration: 0.1, animations: {
                self.storysProgressView.setProgress(newProgress, animated: true)
            })
        } else {
            closeStorys()
        }
    }
    
    // Добавялем аватарку
    private func addUserImageView() {
        userImageView.layer.cornerRadius = 15
        userImageView.layer.masksToBounds = true
        userImageView.isUserInteractionEnabled = true
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userImageView)
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: storysProgressView.bottomAnchor, constant: 10),
            userImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userImageView.widthAnchor.constraint(equalToConstant: 30),
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor)
        ])
    }
    
    // Добавляем никнейм
    private func addNicknameLabel() {
        nicknameLabel.text = nickname
        nicknameLabel.textColor = .white
        nicknameLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        nicknameLabel.isUserInteractionEnabled = true
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nicknameLabel)
        NSLayoutConstraint.activate([
            nicknameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            nicknameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10)
        ])
    }
    
    // Обработчик нажатий
    private func addTapGestureUser() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        view.addGestureRecognizer(tapGesture)
    }
    
    // Возращаемся на страничку пользователя при нажатии на область в левом верхнем углу (аватарка + никнейм пользователя) (закрываем сторис), либо закрываем клавиатуру (вне этой области)
    @objc private func handleTapGesture(gesture: UITapGestureRecognizer) {
        let touchPoint = gesture.location(in: view)
        let rect = CGRect(x: userImageView.frame.origin.x,
                              y: userImageView.frame.origin.y,
                              width: userImageView.frame.width + nicknameLabel.frame.width + 10,
                              height: max(userImageView.frame.height, nicknameLabel.frame.height))
        if rect.contains(touchPoint) {
            closeStorys() // закрываем сторис
        } else {
            view.endEditing(true) // закрываем клавиатуру
        }
    }
    
    // Добавляем время сторис
    private func addTimeStorysLabel() {
        timeStorysLabel.font = UIFont.systemFont(ofSize: 14)
        timeStorysLabel.textColor = .white
        timeStorysLabel.alpha = 0.8
        timeStorysLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timeStorysLabel)
        NSLayoutConstraint.activate([
            timeStorysLabel.centerYAnchor.constraint(equalTo: nicknameLabel.centerYAnchor),
            timeStorysLabel.leadingAnchor.constraint(equalTo: nicknameLabel.trailingAnchor, constant: 10)
        ])
    }
    
    // Добавляем кнопку настроек поста (три точки)
    private func addSettingButtonPost() {
        settingStorysButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        settingStorysButton.tintColor = .white
        settingStorysButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingStorysButton)
        NSLayoutConstraint.activate([
            settingStorysButton.centerYAnchor.constraint(equalTo: timeStorysLabel.centerYAnchor),
            settingStorysButton.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70)
        ])
    }
    
    // Создаем кнопку закрытия сторис
    private func setupCloseButton() {
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .white
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 24, weight: .regular, scale: .medium), forImageIn: .normal) // увеличиваем системный значок
        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: settingStorysButton.centerYAnchor),
            closeButton.leadingAnchor.constraint(equalTo: settingStorysButton.trailingAnchor, constant: 15)
        ])
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    // По нажатию на кнопку закрываем сторис и останавливаем таймер прогресса сторис
    @objc private func closeButtonTapped() {
        closeStorys()
    }
    
    // Добавляем саму сторис
    private func addStorysImageView() {
        storysImageView.layer.cornerRadius = 10
        storysImageView.contentMode = .scaleAspectFill
        storysImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(storysImageView)
        NSLayoutConstraint.activate([
            storysImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            storysImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            storysImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            storysImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
        view.insertSubview(storysImageView, at: 0) // на задний план
    }
    
    // Добавляем окно для ответа на историю
    private func addStorysTextField() {
        storysTextField.translatesAutoresizingMaskIntoConstraints = false
        storysTextField.textColor = .white
        storysTextField.backgroundColor = .black
        storysTextField.borderStyle = .none
        storysTextField.layer.cornerRadius = 20
        storysTextField.layer.masksToBounds = true
        storysTextField.layer.borderWidth = 1
        storysTextField.layer.borderColor = UIColor.systemGray.cgColor
        storysTextField.isUserInteractionEnabled = true
        storysTextField.delegate = self
        // Настраиваем placeholder
        storysTextField.attributedPlaceholder = NSAttributedString(string: "Отправить сообщение...", attributes: [.foregroundColor: UIColor.white])
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        storysTextField.leftView = leftPaddingView
        storysTextField.leftViewMode = .always
        view.addSubview(storysTextField)
        // Констрейнты для storysTextField
        constraintsForStorysTextField()
    }
    
    // Констрейнты для storysTextField
    private func constraintsForStorysTextField() {
        // Деактивируем старые ограничения, если они существуют
        NSLayoutConstraint.deactivate(storysTextFieldConstraints)
        // Ограничения для storysTextField
        let topConstraint = storysTextField.topAnchor.constraint(equalTo: storysImageView.bottomAnchor, constant: 10)
        let leadingConstraint = storysTextField.leadingAnchor.constraint(equalTo: storysImageView.leadingAnchor, constant: 10)
        let widthConstraint = storysTextField.widthAnchor.constraint(equalToConstant: 280)
        let heightConstraint = storysTextField.heightAnchor.constraint(equalToConstant: 45)
        // сохраняем ссылки на ограничения
        storysTextFieldConstraints = [topConstraint, leadingConstraint, widthConstraint, heightConstraint]
        // Активируем
        NSLayoutConstraint.activate(storysTextFieldConstraints)
    }
    
    // Создаем полупрозрачный черный слой поверх изображения (понадобится для затемнения сторис при открытии клавиатуры)
    private func addDarkEffect() {
        dimLayer.frame = storysImageView.bounds
        dimLayer.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        storysImageView.addSubview(dimLayer)
    }
    
    // Универсальная функция добавления смайликов при написании ответа на сторис
    private func addSmiles(text: String, leading: CGFloat, top: CGFloat) {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: storysImageView.topAnchor, constant: top),
            button.leadingAnchor.constraint(equalTo: storysImageView.leadingAnchor, constant: leading),
            button.widthAnchor.constraint(equalToConstant: 70),
            button.heightAnchor.constraint(equalTo: button.widthAnchor)
        ])
        smileButtons.append(button)
        button.alpha = 0
        button.transform = CGAffineTransform(scaleX: 0.5, y: 0.5) // Начальный размер кнопки меньше
        // Анимация плавного появления
        UIView.animate(withDuration: 0.3, delay: 0.1 * Double(smileButtons.count), options: .curveEaseInOut, animations: {
            button.alpha = 1
            button.transform = CGAffineTransform.identity // Возвращаем в обычный размер
        })
        button.addTarget(self, action: #selector(smileTapped), for: .touchUpInside)
    }
    
    // Функция для отображения кратких сообщений (уведомления о выполненном действии)
    private func showToast(message: String) {
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.textColor = .white
        toastLabel.backgroundColor = .black
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        toastLabel.numberOfLines = 0
        toastLabel.layer.cornerRadius = 8
        toastLabel.clipsToBounds = true
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toastLabel)
        NSLayoutConstraint.activate([
            toastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toastLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            toastLabel.widthAnchor.constraint(equalToConstant: 170),
            toastLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        // Анимация появления и исчезновения
        UIView.animate(withDuration: 1.7, delay: 0.5, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0
        }) { _ in
            toastLabel.removeFromSuperview()
        }
    }
    
    // По нажатию на смайл выводим уведомление
    @objc private func smileTapped() {
        storysTextField.resignFirstResponder()
        showToast(message: "Реакция отправлена")
    }
    
    // Функция добавления необходимых смайлов
    private func addSixSmiles() {
        if smileButtons.isEmpty {
            addSmiles(text: "😂", leading: 75, top: 100)
            addSmiles(text: "😮", leading: 160, top: 100)
            addSmiles(text: "😍", leading: 245, top: 100)
            addSmiles(text: "😢", leading: 75, top: 170)
            addSmiles(text: "👏", leading: 160, top: 170)
            addSmiles(text: "🔥", leading: 245, top: 170)
        } else {
            smileButtons.forEach { $0.isHidden = false }
        }
    }
    
    // Функция скрытия смайлов
    private func clearSmiles() {
        smileButtons.forEach { $0.isHidden = true }
    }
    
    // Регистрация уведомлений о клавиатуре
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { [weak self] _ in
            guard let self = self else { return }
            self.timer?.invalidate() // останавливаем таймер сторис
            self.storysTextField.layer.borderColor = UIColor.white.cgColor // цвет линии
            self.storysTextField.backgroundColor = .clear // прозрачный фон
            DispatchQueue.main.async {
                self.addDarkEffect() // Добавляем полупрозрачный слой
            }
            // с анимацией двигаем текстфилд выше клавиатуры
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut) {
                NSLayoutConstraint.deactivate(self.storysTextFieldConstraints) // деактивируем старые ограничения
                // Создаем новые ограничения для клавиатуры
                let topConstraint = self.storysTextField.topAnchor.constraint(equalTo: self.storysImageView.bottomAnchor, constant: -290)
                let leadingConstraint = self.storysTextField.leadingAnchor.constraint(equalTo: self.storysImageView.leadingAnchor, constant: 10)
                let widthConstraint = self.storysTextField.widthAnchor.constraint(equalToConstant: 370)
                let heightConstraint = self.storysTextField.heightAnchor.constraint(equalToConstant: 40)
                self.storysTextFieldConstraints = [topConstraint, leadingConstraint, widthConstraint, heightConstraint]
                NSLayoutConstraint.activate(self.storysTextFieldConstraints)
                self.view.layoutIfNeeded()
            }
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { [weak self] _ in
            guard let self = self else { return }
            self.storysTextField.layer.borderColor = UIColor.systemGray.cgColor // цвет линии
            self.storysTextField.backgroundColor = .black // возвращаем черный цвет (для кликабельности всего поля)
            self.startTimer() // запускаем таймер, продолжаем сторис
            self.dimLayer.removeFromSuperview()
            // возвращаем текстфилд на место
            UIView.animate(withDuration: 0.3) {
                NSLayoutConstraint.deactivate(self.storysTextField.constraints)
                self.constraintsForStorysTextField()
                self.view.layoutIfNeeded()
            }
        }
    }
    
    // Функция добавления значка отправки для ответа на сторис
    private func addSendButton() {
        sendButton.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        sendButton.backgroundColor = .white
        sendButton.tintColor = .black
        sendButton.layer.cornerRadius = 15
        sendButton.layer.masksToBounds = true
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        rightViewContainer.addSubview(sendButton)
        storysTextField.rightViewMode = .always
        // Устанавливаем размеры и отступы для контейнера и кнопки
        NSLayoutConstraint.activate([
            rightViewContainer.widthAnchor.constraint(equalToConstant: 60),
            rightViewContainer.heightAnchor.constraint(equalToConstant: 30),
            sendButton.widthAnchor.constraint(equalToConstant: 60),
            sendButton.heightAnchor.constraint(equalToConstant: 30),
            sendButton.centerYAnchor.constraint(equalTo: rightViewContainer.centerYAnchor),
            sendButton.trailingAnchor.constraint(equalTo: rightViewContainer.trailingAnchor, constant: -5)
        ])
        sendButton.addTarget(self, action: #selector(buttonSendTapped), for: .touchUpInside)
    }
    
    // Выводим уведомление о том, что сообщение отправлено, очищаем окно ответа и убираем значок отправки
    @objc private func buttonSendTapped() {
        storysTextField.resignFirstResponder()
        storysTextField.rightView = nil
        storysTextField.text = nil
        showToast(message: "Сообщение отправлено!")
    }
    
    // Настраиваем, чтобы ответ на сторис открывался свайпом вверх
    private func replySwipeStorys() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleUpSwipeGesture))
        swipeGesture.direction = .up
        view.addGestureRecognizer(swipeGesture)
    }

    @objc private func handleUpSwipeGesture() {
        storysTextField.becomeFirstResponder()
    }
    
    // Добавляем значок сердечка
    private func addHeartButton() {
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.tintColor = .white
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        heartButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 26, weight: .regular, scale: .medium), forImageIn: .normal)
        view.addSubview(heartButton)
        NSLayoutConstraint.activate([
            heartButton.centerYAnchor.constraint(equalTo: storysTextField.centerYAnchor),
            heartButton.leadingAnchor.constraint(equalTo: storysTextField.trailingAnchor, constant: 15)
        ])
        heartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
    }
    
    @objc private func heartButtonTapped() {
        heartButton.isSelected.toggle()
        if heartButton.isSelected {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heartButton.tintColor = .systemRed
        } else {
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            heartButton.tintColor = .white
        }
    }
    
    // Добавляем значок поделиться
    private func addShareButton() {
        shareButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        shareButton.tintColor = .white
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 24, weight: .regular, scale: .medium), forImageIn: .normal)
        view.addSubview(shareButton)
        NSLayoutConstraint.activate([
            shareButton.centerYAnchor.constraint(equalTo: storysTextField.centerYAnchor),
            shareButton.leadingAnchor.constraint(equalTo: heartButton.trailingAnchor, constant: 15)
        ])
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
    }
    
    @objc private func shareButtonTapped() {
        let activity = UIActivityViewController(activityItems: ["Делюсь сторис"], applicationActivities: nil)
        present(activity, animated: true)
    }
}

//MARK: - UITextFieldDelegate

extension StorysViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Если пользователь начал отвечать на сторис - показываем смайлы
        addSixSmiles()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // Если пользователь вернулся к сторис - скрываем смайлы
        clearSmiles()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Если пользователь печатает (добавляет или удаляет символы), скрываем смайлы и показываем значок отправки сообщения (только если есть символы, исключая пробелы)
        clearSmiles()
        let textFieldText = storysTextField.text ?? ""
        if !textFieldText.trimmingCharacters(in: .whitespaces).isEmpty { // если строка не пуста
            storysTextField.rightView = rightViewContainer
        } else {
            storysTextField.rightView = nil // если в строке либо нет символов, либо только пробелы
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        // Если пользователь стер все символы (но остается в строке) - показываем смайлы и убираем значок отправки сообщения
        if textField.text?.isEmpty == true {
            addSixSmiles()
            storysTextField.rightView = nil
        }
    }
}
