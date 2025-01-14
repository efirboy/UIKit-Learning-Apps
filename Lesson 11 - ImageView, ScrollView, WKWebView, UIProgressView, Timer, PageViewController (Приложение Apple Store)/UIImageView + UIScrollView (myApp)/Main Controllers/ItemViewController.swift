//
//  ItemViewController.swift
//  UIImageView + UIScrollView (myApp)
//
//  Created by Alexandr Garkalin on 25.09.2024.
//

import UIKit

class ItemViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - Объекты
    
    var heartButton = UIBarButtonItem()
    var shareButton = UIBarButtonItem()
    var nameItem: String?
    let lineView = UIView()
    let itemLabel = UILabel()
    let priceLabel = UILabel()
    let itemsScroll = UIScrollView()
    let oneImage = UIImageView()
    let twoImage = UIImageView()
    let threeImage = UIImageView()
    let itemLabelDownPhoto = UILabel()
    let whiteColorView = UIView()
    let blackColorView = UIView()
    let borderView = UIView()
    let whiteCircleView = UIView()
    let blackCircleView = UIView()
    let compatibilityLabel = UILabel()
    var forCompatibilityLabel: String?
    let compatibilityImage = UIImageView()
    let basketButton = UIButton()
    let boxImageView = UIImageView()
    let infoDeliveryLabel = UILabel()
    let dateDeliveryLabel = UILabel()
    let addressButton = UIButton(type: .system)
    let infoItemButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Реализация методов
        addHeartButton()
        addShareButton()
        navigationItem.rightBarButtonItems = [heartButton, shareButton]
        addBoxImageView()
        addItemLabel()
        addPriceLabel()
        addItemsScroll()
        addImageSet()
        addItemLabelDownPhoto()
        
        // для AirPods добавялем только один цвет, для остальный товаров - два цвета
        if itemLabel.text == "AirPods Pro 2" {
            addBorderColor(x: 185, y: 490)
            addColorView(colorView: whiteColorView, color: .systemGray5, x: 185, y: 490)
        } else {
            addBorderColor(x: 160, y: 490)
            addColorView(colorView: blackColorView, color: .darkGray, x: 160, y: 490)
            addColorView(colorView: whiteColorView, color: .systemGray5, x: 210, y: 490) // systemGray5 - отражение белого
            addTapGestureColor(to: whiteColorView)
            addTapGestureColor(to: blackColorView)
        }
        addCompatibilityImage()
        addCompatibilityLabel()
        addBasketButton()
        addInfoDeliveryLabel()
        addDateDeliveryLabel()
        addAddressButton()
        addTapGestureRecognizer(to: oneImage)
        addTapGestureRecognizer(to: twoImage)
        addTapGestureRecognizer(to: threeImage)
        addInfoItemButton()
    }
    
    
    //MARK: - Methods
    
    // Создаем поделиться
    func addShareButton() {
        shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareButtonTapped))
    }
    
    @objc func shareButtonTapped() {
        let activity = UIActivityViewController(activityItems: [itemLabel.text ?? "Магазин Apple"], applicationActivities: nil)
        present(activity, animated: true)
    }
    
    
    //  Добавляем сердечко и поделиться в навигационный бар (избранное)
    func addHeartButton() {
        heartButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(heartButtonTapped))
    }
    
    @objc func heartButtonTapped() {
        heartButton = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(heartButtonFillTapped))
        navigationItem.rightBarButtonItems = [heartButton, shareButton]
    }
    
    @objc func heartButtonFillTapped() {
        heartButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(heartButtonTapped))
        navigationItem.rightBarButtonItems = [heartButton, shareButton]
    }
    
    
    // Добавляем лейбл названия товара
    func addItemLabel() {
        itemLabel.frame = CGRect(x: 15, y: 105, width: 360, height: 50)
        itemLabel.text = nameItem
        itemLabel.textColor = .white
        itemLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        itemLabel.textAlignment = .center
        view.addSubview(itemLabel)
    }
    
    // Добавляем цену
    func addPriceLabel() {
        priceLabel.frame = CGRect(x: 15, y: 130, width: 360, height: 50)
        priceLabel.textColor = .systemGray.withAlphaComponent(0.8)
        priceLabel.font = UIFont.systemFont(ofSize: 14)
        priceLabel.textAlignment = .center
        switch nameItem {
        case "IPhone 16 Pro 256 Gb": priceLabel.text = "154 999.00 руб."
        case "IPad Pro 13 1 Tb (M4)": priceLabel.text = "179 999.00 руб."
        case "AirPods Pro 2": priceLabel.text = "26 999.00 руб."
        case "Apple Watch 10": priceLabel.text = "54 990.00 руб."
        default: priceLabel.text = "???"
        }
        view.addSubview(priceLabel)
        
    }
    
    // Добавляем скроллВью с фотографиями
    func addItemsScroll() {
        itemsScroll.frame = CGRect(x: 0, y: 170, width: 390, height: 290)
        itemsScroll.contentSize = CGSize(width: itemsScroll.bounds.width * 3, height: 280)
        itemsScroll.isPagingEnabled = true
        itemsScroll.delegate = self
        view.addSubview(itemsScroll)
    }
    
    // Универсальная функция для добавления фотографий в скролл
    func addItemImage(itemImage: UIImageView, nameImage: String, x: CGFloat, y: CGFloat) {
        itemImage.frame = CGRect(x: 15 + x, y: 20 + y, width: 230, height: 255)
        itemImage.image = UIImage(named: nameImage)
        itemsScroll.addSubview(itemImage)
    }
    
    // Реализация добавления фото и меняется лейбл "Совместимо с ... в зависимости от типа товара"
    func addImageSet() {
        switch itemLabel.text {
        case "IPhone 16 Pro 256 Gb":
            addItemImage(itemImage: oneImage, nameImage: "IPhone 16 Pro", x: 65, y: 0)
            addItemImage(itemImage: twoImage, nameImage: "IPhone 16 Pro 2", x: 470, y: 0)
            addItemImage(itemImage: threeImage, nameImage: "IPhone 16 Pro 3", x: 850, y: 20)
            forCompatibilityLabel = "AirPods Pro 2"
            compatibilityImage.frame = CGRect(x: 80, y: 530, width: 25, height: 25)
        case "IPad Pro 13 1 Tb (M4)":
            addItemImage(itemImage: oneImage, nameImage: "IPad Pro", x: 70, y: 0)
            addItemImage(itemImage: twoImage, nameImage: "IPad Pro 2", x: 460, y: 0)
            addItemImage(itemImage: threeImage, nameImage: "IPad Pro 3", x: 845, y: 0)
            forCompatibilityLabel = "AirPods Pro 2"
            compatibilityImage.frame = CGRect(x: 80, y: 530, width: 25, height: 25)
        case "AirPods Pro 2":
            addItemImage(itemImage: oneImage, nameImage: "AirPods Pro", x: 75, y: 0)
            addItemImage(itemImage: twoImage, nameImage: "AirPods Pro 2", x: 465, y: 0)
            addItemImage(itemImage: threeImage, nameImage: "AirPods Pro 3", x: 855, y: 0)
            forCompatibilityLabel = "IPhone 16 Pro и IPad 13 Pro"
            compatibilityImage.frame = CGRect(x: 45, y: 530, width: 25, height: 25)
        case "Apple Watch 10":
            addItemImage(itemImage: oneImage, nameImage: "AppleWatch 10", x: 75, y: 0)
            addItemImage(itemImage: twoImage, nameImage: "AppleWatch 10_2", x: 465, y: 0)
            addItemImage(itemImage: threeImage, nameImage: "AppleWatch 10_3", x: 855, y: 0)
            forCompatibilityLabel = "IPhone 16 Pro"
            compatibilityImage.frame = CGRect(x: 80, y: 530, width: 25, height: 25)
        default: return
        }
    }
    
    // Добавляем название под фото
    func addItemLabelDownPhoto() {
        itemLabelDownPhoto.frame = CGRect(x: 50, y: 460, width: 300, height: 30)
        itemLabelDownPhoto.text = nameItem
        itemLabelDownPhoto.textColor = .systemGray
        itemLabelDownPhoto.textAlignment = .center
        itemLabelDownPhoto.alpha = 0.8
        itemLabelDownPhoto.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(itemLabelDownPhoto)
    }
    
    // Универсальная функция для добавления кружочка цвета
    func addColorView(colorView: UIView, color: UIColor, x: CGFloat, y: CGFloat) {
        colorView.frame = CGRect(x: x, y: y, width: 35, height: 35)
        colorView.backgroundColor = color
        colorView.layer.cornerRadius = colorView.bounds.height / 2
        view.addSubview(colorView)
    }
    
    // Добавление границы (эффект выделения цвета)
    func addBorderColor(x: CGFloat, y: CGFloat) {
        borderView.frame = CGRect(x: x - 5, y: y - 5, width: 45, height: 45)
        borderView.layer.cornerRadius = borderView.bounds.height / 2
        borderView.layer.borderColor = UIColor.systemBlue.cgColor
        borderView.layer.borderWidth = 1.0
        view.addSubview(borderView)
    }
    
    // Добавляем tapGesture (по нажатию на каждый выбор цвета)
    func addTapGestureColor(to view: UIView) {
        if view == blackColorView {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapBlack))
            view.isUserInteractionEnabled = true
            view.addGestureRecognizer(tapGesture)
        } else {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapWhite))
            view.isUserInteractionEnabled = true
            view.addGestureRecognizer(tapGesture)
        }
    }
    
    // Если белый, добавляем изображения с белым цветом (кроме AirPods - у них всегда один цвет - белый и нет функции нажатия на цвет)
    @objc func handleTapWhite(_ sender: UITapGestureRecognizer) {
        print("Белый")
        borderView.removeFromSuperview()
        addBorderColor(x: 210, y: 490)
        oneImage.removeFromSuperview()
        twoImage.removeFromSuperview()
        threeImage.removeFromSuperview()
        switch itemLabel.text {
        case "IPhone 16 Pro 256 Gb":
            addItemImage(itemImage: oneImage, nameImage: "IPhone 16 Pro White", x: 65, y: 0)
            addItemImage(itemImage: twoImage, nameImage: "IPhone 16 Pro 2 White", x: 470, y: 0)
            addItemImage(itemImage: threeImage, nameImage: "IPhone 16 Pro 3 White", x: 850, y: 20)
        case "IPad Pro 13 1 Tb (M4)":
            addItemImage(itemImage: oneImage, nameImage: "IPad Pro White", x: 70, y: 0)
            addItemImage(itemImage: twoImage, nameImage: "IPad Pro 2 White", x: 460, y: 0)
            addItemImage(itemImage: threeImage, nameImage: "IPad Pro 3 White", x: 845, y: 0)
        case "Apple Watch 10":
            addItemImage(itemImage: oneImage, nameImage: "AppleWatch 10 White", x: 75, y: 0)
            addItemImage(itemImage: twoImage, nameImage: "AppleWatch 10_2 White", x: 465, y: 0)
            addItemImage(itemImage: threeImage, nameImage: "AppleWatch 10_3 White", x: 855, y: 0)
        default: return
        }
        
    }
    
    // Если черный, добавляем изображения с черным цветом (используя ранее созданную функцию, которая добавляет изображения черного цвета изначально при открытии)
    @objc func handleTapBlack(_ sender: UITapGestureRecognizer) {
        print("Черный")
        borderView.removeFromSuperview()
        addBorderColor(x: 160, y: 490)
        oneImage.removeFromSuperview()
        twoImage.removeFromSuperview()
        threeImage.removeFromSuperview()
        addImageSet()
    }
    
    // Добавляем изображение галочки (совместимость)
    func addCompatibilityImage() {
        compatibilityImage.image = UIImage(systemName: "checkmark.circle.fill")
        compatibilityImage.tintColor = .systemGreen
        view.addSubview(compatibilityImage)
    }
    
    // Добавляем лейбл "Совместимо" и разный шрифт для строки
    func addCompatibilityLabel() {
        compatibilityLabel.frame = CGRect(x: 80, y: 517, width: 250, height: 50)
        compatibilityLabel.text = "Совместимо с \(forCompatibilityLabel ?? "")"
        let range = (compatibilityLabel.text! as NSString).range(of: forCompatibilityLabel ?? "")
        let attributedText = NSMutableAttributedString(string: compatibilityLabel.text ?? "")
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: NSMakeRange(0, compatibilityLabel.text!.count))
        attributedText.addAttribute(.foregroundColor, value: UIColor.systemGray.withAlphaComponent(0.8), range: NSMakeRange(0, compatibilityLabel.text!.count))
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: range)
        attributedText.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: range)
        compatibilityLabel.attributedText = attributedText
        compatibilityLabel.textAlignment = .center
        view.addSubview(compatibilityLabel)
    }
    
    // Добавляем кнопку "Добавить в корзину"
    func addBasketButton() {
        basketButton.frame = CGRect(x: 10, y: 580, width: 370, height: 50)
        basketButton.setTitle("Добавить в корзину", for: .normal)
        basketButton.setTitleColor(.white, for: .normal)
        basketButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        basketButton.backgroundColor = .systemBlue
        basketButton.layer.cornerRadius = 12
        view.addSubview(basketButton)
        basketButton.addTarget(self, action: #selector(basketButtonTapped), for: .touchUpInside)
    }
    
    // Добавляем бадж на элемент ТабБара "Корзина" (для интерфейса, без дальнейшей реализации)
    @objc func basketButtonTapped() {
        tabBarController?.tabBar.items?[3].badgeValue = "1"
    }
    
    // Добавляем значок коробки (доставки)
    func addBoxImageView() {
        boxImageView.frame = CGRect(x: 20, y: 660, width: 25, height: 25)
        boxImageView.image = UIImage(systemName: "shippingbox")
        boxImageView.tintColor = .systemGray
        view.addSubview(boxImageView)
    }
    
    // Добавляем информацию (лейбл) о доставке
    func addInfoDeliveryLabel() {
        infoDeliveryLabel.frame = CGRect(x: 60, y: 645, width: 300, height: 50)
        infoDeliveryLabel.text = "Заказ сегодня в течение дня, доставка:"
        infoDeliveryLabel.textColor = .white
        infoDeliveryLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        view.addSubview(infoDeliveryLabel)
    }
    
    // Добавляем информацию (лейбл) о дате доставки
    func addDateDeliveryLabel() {
        dateDeliveryLabel.frame = CGRect(x: 60, y: 660, width: 200, height: 50)
        dateDeliveryLabel.text = "Пн 30 Сен - Бесплатно"
        dateDeliveryLabel.textColor = .systemGray
        dateDeliveryLabel.alpha = 0.8
        dateDeliveryLabel.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(dateDeliveryLabel)
    }
    
    // Добавляем информацию (кнопку) о адресе доставки
    func addAddressButton() {
        addressButton.frame = CGRect(x: 55, y: 690, width: 300, height: 20)
        addressButton.setTitle("Варианты доставки для местоположения: 115533", for: .normal)
        addressButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(addressButton)
    }
    
    // Добавляем UITapGestureRecognizer к изображению товара
    func addTapGestureRecognizer(to imageView: UIImageView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
    }
    
    // Отображаем модально
    @objc func handleTap() {
        let webInfoItemVC = WebInfoItemController()
        webInfoItemVC.infoItem = itemLabel.text
        present(webInfoItemVC, animated: true)
    }
    
    // Добавляем кнопку, которая будет открывать pdf с информацией о товаре
    func addInfoItemButton() {
        infoItemButton.frame = CGRect(x: 330, y: 180, width: 40, height: 40)
        infoItemButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        infoItemButton.addTarget(self, action: #selector(infoItemButtonTapped), for: .touchUpInside)
        view.addSubview(infoItemButton)
    }
    // переходим на контроллер с информацией о товаре
    @objc func infoItemButtonTapped() {
        let infoItemVC = InfoItemViewController()
        infoItemVC.infoItem = itemLabel.text
        present(infoItemVC, animated: true)
    }
    
    //MARK: - ScrollViewDelegate
    
    // добавляем линию (вью) вместо индикатора
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        lineView.frame = CGRect(x: 5, y: itemsScroll.bounds.height - 6, width: itemsScroll.contentSize.width - 8, height: 3)
        lineView.backgroundColor = .white
        lineView.layer.cornerRadius = lineView.frame.height / 2
        lineView.alpha = 1
        scrollView.addSubview(lineView)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Чтобы линия убиралась через 1 секунду (с затуханием)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            print("Прокрутка завершена")
            UIView.animate(withDuration: 0.5, animations: {
                self.lineView.alpha = 0
            }, completion: { _ in
                self.lineView.removeFromSuperview()
            })
        }
    }
}

