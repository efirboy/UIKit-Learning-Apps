//
//  ForYouViewController.swift
//  UIImageView + UIScrollView (myApp)
//
//  Created by Alexandr Garkalin on 24.09.2024.
//

import UIKit

final class ForYouViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    //MARK: - Объекты
    private let infoText = UILabel()
    private let horizontLine = UIView()
    private let userImage = UIImageView()
    private let newInfoLabel = UILabel()
    private let orderView = UIView()
    private let orderItemView = UIImageView()
    private let statusDeliveryLabel = UILabel()
    private let infoDeliveryLabel = UILabel()
    private let arrowButton = UIButton()
    private let horizontLine2 = UIView()
    private let progressOrder = UIProgressView()
    private let statusOneLabel = UILabel()
    private let statusTwoLabel = UILabel()
    private let statusThreeLabel = UILabel()
    private let recommendationLabel = UILabel()
    private let notificationImageView = UIImageView()
    private let infoNotificationLabelOne = UILabel()
    private let infoNotificationLabelTwo = UILabel()
    private let arrowButtonNotification = UIButton()
    private let horizontLine3 = UIView()
    private let yourDevicesLabel = UILabel()
    private let showAllButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Реализация методов
        addTabBarItem()
        addTitle()
        addHorizontLine()
        addUserImage()
        addNewInfoLabel()
        addOrderView()
        addOrderItemView()
        addStatusDeliveryLabel()
        addInfoDeliveryLabel()
        addArrowButton()
        addHorizontLine2()
        addProgressOrder()
        addStatusLabel(statusLabel: statusOneLabel, text: "Обрабатывается", x: 15, alpha: 1)
        addStatusLabel(statusLabel: statusTwoLabel, text: "Отправлено", x: 140, alpha: 1)
        addStatusLabel(statusLabel: statusThreeLabel, text: "Доставлено", x: 260, alpha: 0.5)
        addRecommendationLabel()
        addNotificationImageView()
        addInfoNotificationLabelOne()
        addInfoNotificationLabelTwo()
        addArrowButtonNotification()
        addHorizontLine3()
        addYourDevicesLabel()
        addShowAllButton()
        addTapGesture(to: userImage)
        loadImageFromUserDefaults()
    }
    
    //MARK: - Methods
    
    // Создаем и настраиваем элемент tabBar
    private func addTabBarItem() {
        let tabBarItem = UITabBarItem()
        tabBarItem.image = UIImage(systemName: "person.crop.circle")
        tabBarItem.title = "Для вас"
        self.tabBarItem = tabBarItem
    }
    
    // Реализуем заголовок
    private func addTitle() {
        navigationItem.title = "Для Вас"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    // Добавляем горизонтальную линию
    private func addHorizontLine() {
        horizontLine.frame = CGRect(x: 15, y: 150, width: 350, height: 1)
        horizontLine.alpha = 0.3
        horizontLine.backgroundColor = .systemGray
        view.addSubview(horizontLine)
    }
    
    // Добавляем изображение юзера
    private func addUserImage() {
        userImage.frame = CGRect(x: 320, y: 90, width: 50, height: 50)
        userImage.image = UIImage(systemName: "person.crop.circle.fill")
        userImage.tintColor = .black
        userImage.layer.cornerRadius = userImage.bounds.height / 2
        userImage.layer.masksToBounds = true
        navigationController?.navigationBar.isUserInteractionEnabled = false // отключили взаимодействие с навигационным баром (взаимодействие здесь не требуется), чтобы он не блокировал нажатие на изображение
        view.addSubview(userImage)
    }
    
    // Сохранение изображения в UserDefaults
    private func saveImageToUserDefaults(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            UserDefaults.standard.setValue(imageData, forKey: "savedImage")
        }
    }
    
    // Загрузка изображения из UserDefaults
    private func loadImageFromUserDefaults() {
        if let imageData = UserDefaults.standard.data(forKey: "savedImage") {
            if let savedImage = UIImage(data: imageData) {
                userImage.image = savedImage
            }
        }
    }
    
    // Добавляем лейбл с описанием новых событий
    private func addNewInfoLabel() {
        newInfoLabel.frame = CGRect(x: 15, y: 165, width: 250, height: 80)
        newInfoLabel.text = "Вот что нового"
        newInfoLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.addSubview(newInfoLabel)
    }
    
    // Добавляем вью для отображения заказа и его статуса (+ тень)
    private func addOrderView() {
        orderView.frame = CGRect(x: 20, y: 250, width: 350, height: 180)
        orderView.backgroundColor = .white
        orderView.layer.shadowColor = UIColor.lightGray.cgColor
        orderView.layer.shadowOpacity = 0.5
        orderView.layer.shadowOffset = CGSize(width: 7, height: 7)
        orderView.layer.shadowRadius = 10
        orderView.layer.cornerRadius = 12
        view.addSubview(orderView)
    }
    
    // Добавляем изображение товара во вью
    private func addOrderItemView() {
        orderItemView.frame = CGRect(x: orderView.bounds.minX + 15, y: orderView.bounds.minY + 15, width: 75, height: 75)
        orderItemView.image = UIImage(named: "AirPods Pro")
        orderView.addSubview(orderItemView)
    }
    
    // Добавляем лейбл с информацией о статусе доставки (в данном задании - отправлен по умолчанию)
    private func addStatusDeliveryLabel() {
        statusDeliveryLabel.frame = CGRect(x: orderItemView.bounds.minX + 100, y: orderItemView.bounds.minY + 10, width: 200, height: 50)
        statusDeliveryLabel.text = "Ваш заказ отправлен"
        statusDeliveryLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        orderView.addSubview(statusDeliveryLabel)
    }
    
    // Добавляем лейбл с информацией о доставке
    private func addInfoDeliveryLabel() {
        infoDeliveryLabel.frame = CGRect(x: orderItemView.bounds.minX + 100, y: orderItemView.bounds.minY + 40, width: 200, height: 50)
        infoDeliveryLabel.text = "1 товар, доставка завтра"
        infoDeliveryLabel.font = UIFont.systemFont(ofSize: 14)
        infoDeliveryLabel.textColor = .systemGray
        orderView.addSubview(infoDeliveryLabel)
    }
    
    // Добавляем стрелку для перехода к подробностям доставки (в данном задании без функционала)
    private func addArrowButton() {
        arrowButton.frame = CGRect(x: orderView.bounds.minX + 310, y: infoDeliveryLabel.bounds.minY + 43, width: 40, height: 40)
        arrowButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        arrowButton.tintColor = .systemGray
        orderView.addSubview(arrowButton)
    }
    
    // Добавляем горизонтальную линию (внутри OrderView)
    private func addHorizontLine2() {
        horizontLine2.frame = CGRect(x: orderView.bounds.minX, y: orderView.bounds.minY + 110, width: 350, height: 1)
        horizontLine2.backgroundColor = .systemGray
        horizontLine2.alpha = 0.5
        orderView.addSubview(horizontLine2)
    }
    
    // Добавляем полоску прогресса заказа
    private func addProgressOrder() {
        progressOrder.frame = CGRect(x: orderView.bounds.minX + 15, y: orderView.bounds.minY + 130, width: 320, height: 50)
        progressOrder.progress = 0.5
        progressOrder.progressTintColor = .systemGreen
        progressOrder.trackTintColor = .systemGray.withAlphaComponent(0.3)
        orderView.addSubview(progressOrder)
    }
    
    // Универсальная функция для добавления лейблов статуса заказа
    private func addStatusLabel(statusLabel: UILabel, text: String, x: CGFloat, alpha: Double) {
        statusLabel.frame = CGRect(x: x, y: orderView.bounds.minY + 130, width: 150, height: 50)
        statusLabel.text = text
        statusLabel.textColor = .black
        statusLabel.alpha = alpha
        statusLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        orderView.addSubview(statusLabel)
    }
    
    // Добавляем лейбл "Рекомендуется Вам"
    private func addRecommendationLabel() {
        recommendationLabel.frame = CGRect(x: 15, y: 480, width: 250, height: 80)
        recommendationLabel.text = "Рекомендуется Вам"
        recommendationLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        view.addSubview(recommendationLabel)
    }
    
    // Добавляем вью значка уведомлений
    private func addNotificationImageView() {
        notificationImageView.frame = CGRect(x: 30, y: 560, width: 50, height: 50)
        notificationImageView.image = UIImage(systemName: "app.badge")
        notificationImageView.tintColor = .systemRed
        view.addSubview(notificationImageView)
    }
    
    // Добавляем инофрмацию об уведомлениях №1
    private func addInfoNotificationLabelOne() {
        infoNotificationLabelOne.frame = CGRect(x: 100, y: 540, width: 200, height: 100)
        infoNotificationLabelOne.text = "Получайте новости о своём заказе в режиме реального времени."
        infoNotificationLabelOne.numberOfLines = 0
        infoNotificationLabelOne.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        view.addSubview(infoNotificationLabelOne)
    }
    
    // Добавляем инофрмацию об уведомлениях №2
    private func addInfoNotificationLabelTwo() {
        infoNotificationLabelTwo.frame = CGRect(x: 100, y: 590, width: 250, height: 100)
        infoNotificationLabelTwo.text = "Включите уведомления, чтобы получать новости о своём заказе."
        infoNotificationLabelTwo.numberOfLines = 0
        infoNotificationLabelTwo.font = UIFont.systemFont(ofSize: 14)
        infoNotificationLabelTwo.alpha = 0.5
        view.addSubview(infoNotificationLabelTwo)
    }
    
    // Добавляем стрелку для перехода к включению уведомлений (в данном задании без функционала)
    private func addArrowButtonNotification() {
        arrowButtonNotification.frame = CGRect(x: 350, y: 600, width: 30, height: 30)
        arrowButtonNotification.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        arrowButtonNotification.tintColor = .systemGray.withAlphaComponent(0.7)
        view.addSubview(arrowButtonNotification)
    }
    
    // Добавляем горизонтальную линию
    private func addHorizontLine3() {
        horizontLine3.frame = CGRect(x: 15, y: 680, width: 400, height: 1)
        horizontLine3.alpha = 0.3
        horizontLine3.backgroundColor = .systemGray
        view.addSubview(horizontLine3)
    }
    
    // Добавляем лейбл "Ваши устройства"
    private func addYourDevicesLabel() {
        yourDevicesLabel.frame = CGRect(x: 15, y: 690, width: 280, height: 80)
        yourDevicesLabel.text = "Ваши устройства"
        yourDevicesLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        view.addSubview(yourDevicesLabel)
    }
    
    // Добавялем кнопку "Показать все" (в данном задании без функционала)
    private func addShowAllButton() {
        showAllButton.frame = CGRect(x: 260, y: 707, width: 150, height: 50)
        showAllButton.setTitle("Показать все", for: .normal)
        view.addSubview(showAllButton)
    }
    
    // Добавялем обработчик нажатий для вью
    private func addTapGesture(to imageView: UIImageView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        print("Нажатие")
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let actionPhoto = UIAlertAction(title: "Медиатека", style: .default) { _ in
            // открываем приложение фото
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePickerController = UIImagePickerController()
                imagePickerController.delegate = self
                imagePickerController.sourceType = .photoLibrary
                imagePickerController.allowsEditing = true
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }
        // устанавливаем изображение для кнопки Медиатека
        let photoIcon = UIImage(systemName: "photo.fill")
        actionPhoto.setValue(photoIcon, forKey: "image")
        let actionCamera = UIAlertAction(title: "Камера", style: .default) // в данном задании без функционала
        // устанавливаем изображение для кнопки Медиатека
        let cameraIcon = UIImage(systemName: "camera.fill")
        actionCamera.setValue(cameraIcon, forKey: "image")
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(actionPhoto)
        alert.addAction(actionCamera)
        alert.addAction(actionCancel)
        present(alert, animated: true)
        
    }
    
    //MARK: - UIImagePickerControllerDelegate
    
    // выбираем изображение, ставим его вместо стандартного фото, вызываем функцию сохранения, закрываем приложение фото
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            userImage.image = editedImage
            saveImageToUserDefaults(image: editedImage)
        } else if let originalImage = info[.originalImage] as? UIImage {
            userImage.image = originalImage
            saveImageToUserDefaults(image: originalImage)
        }
        dismiss(animated: true)
    }
}

    
    
    
    
    
    

    


