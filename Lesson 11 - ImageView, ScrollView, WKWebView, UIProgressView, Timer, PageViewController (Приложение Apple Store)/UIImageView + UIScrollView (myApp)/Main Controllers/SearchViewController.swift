//
//  SearchViewController.swift
//  UIImageView + UIScrollView (myApp)
//
//  Created by Alexandr Garkalin on 24.09.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: - Объекты
    let searchLabel = UILabel()
    let searchBar = UISearchBar()
    let recentlyViewedLabel = UILabel()
    let clearButton = UIButton(type: .system)
    let cancelButton = UIButton(type: .system)
    let devicesScroll = UIScrollView()
    let backgroungView1 = UIView()
    let backgroungView2 = UIView()
    let backgroungView3 = UIView()
    let backgroungView4 = UIView()
    let iPhoneImageView = UIImageView()
    let iPadImageView = UIImageView()
    let airPodsImageView = UIImageView()
    let appleWatchImageView = UIImageView()
    let iPhoneLabel = UILabel()
    let iPadLabel = UILabel()
    let airPodsLabel = UILabel()
    let appleWatchLabel = UILabel()
    let examplesOfQueriesLabel = UILabel()
    let searchIcon1 = UIImageView()
    let searchIcon2 = UIImageView()
    let searchIcon3 = UIImageView()
    let searchIcon4 = UIImageView()
    let searchButton1 = UIButton()
    let searchButton2 = UIButton()
    let searchButton3 = UIButton()
    let searchButton4 = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notifications для клавиатуры
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { _ in
            self.searchLabel.removeFromSuperview()
            UIView.animate(withDuration: 0.3) {
                self.navigationItem.title = ""
                self.searchBar.frame.origin.y = 60
                self.searchBar.frame.size.width = 330
                self.cancelButton.alpha = 1
            }
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { _ in
            self.view.addSubview(self.searchLabel)
            UIView.animate(withDuration: 0.3) {
                self.navigationItem.title = "Поиск"
                self.searchBar.frame.origin.y = 160
                self.searchBar.frame.size.width = 380
                self.cancelButton.alpha = 0
            }
        }
        
        
        // Реализация методов
        addTapGestureRecognizer(to: backgroungView1)
        addTapGestureRecognizer(to: backgroungView2)
        addTapGestureRecognizer(to: backgroungView3)
        addTapGestureRecognizer(to: backgroungView4)
        addTabBarItem()
        addTitle()
        addSearchBar()
        addCancelButton()
        addRecentlyViewedLabel()
        addClearButton()
        addDevicesScroll()
        addBackgroundView(backgroundView: backgroungView1, x: devicesScroll.bounds.minX)
        addBackgroundView(backgroundView: backgroungView2, x: devicesScroll.bounds.minX + 160)
        addBackgroundView(backgroundView: backgroungView3, x: devicesScroll.bounds.minX + 320)
        addBackgroundView(backgroundView: backgroungView4, x: devicesScroll.bounds.minX + 480)
        
        addImageGoods(imageItem: iPhoneImageView, nameImage: "IPhone 16 Pro", backgroundView: backgroungView1, labelItem: iPhoneLabel, text: "IPhone 16 Pro 256 Gb")
        addImageGoods(imageItem: iPadImageView, nameImage: "IPad Pro", backgroundView: backgroungView2, labelItem: iPadLabel, text: "IPad Pro 13 1 Tb (M4)")
        addImageGoods(imageItem: airPodsImageView, nameImage: "AirPods Pro", backgroundView: backgroungView3, labelItem: airPodsLabel, text: "AirPods Pro 2")
        addImageGoods(imageItem: appleWatchImageView, nameImage: "AppleWatch 10", backgroundView: backgroungView4, labelItem: appleWatchLabel, text: "Apple Watch 10")
        
        addExamplesOfQueriesLabel()
        addSearchIcon(imageView: searchIcon1, frame: CGRect(x: 20, y: 540, width: 20, height: 20))
        addSearchIcon(imageView: searchIcon2, frame: CGRect(x: 20, y: 590, width: 20, height: 20))
        addSearchIcon(imageView: searchIcon3, frame: CGRect(x: 20, y: 640, width: 20, height: 20))
        addSearchIcon(imageView: searchIcon4, frame: CGRect(x: 20, y: 690, width: 20, height: 20))
        
        addSearchButton(button: searchButton1, frame: CGRect(x: 50, y: 525, width: 100, height: 50), text: "AirPods 4")
        addSearchButton(button: searchButton2, frame: CGRect(x: 50, y: 575, width: 140, height: 50), text: "iPhone 16 Pro")
        addSearchButton(button: searchButton3, frame: CGRect(x: 31, y: 625, width: 100, height: 50), text: "Beats")
        addSearchButton(button: searchButton4, frame: CGRect(x: 30, y: 675, width: 300, height: 50), text: "Сравните модели iPhone")
    }
    
    //MARK: - Methods
    
    // Создаем и настраиваем элемент tabBar
    func addTabBarItem() {
        let tabBarItem = UITabBarItem()
        tabBarItem.image = UIImage(systemName: "magnifyingglass")
        tabBarItem.title = "Поиск"
        self.tabBarItem = tabBarItem
    }
    
    // Добавляем и настраиваем заголовок
    func addTitle() {
        navigationItem.title = "Поиск"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
                .foregroundColor: UIColor.white // Цвет большого заголовка
            ]
    }
    
    // Добавляем поисковую строку
    func addSearchBar() {
        searchBar.frame = CGRect(x: 5, y: 160, width: 380, height: 35)
        searchBar.layer.cornerRadius = 10
        searchBar.layer.masksToBounds = true
        // устанавливаем фон для Search Bar, цвет текста и курсора
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.0)
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.tintColor = .white
        // меняем иконку поиска на серую
        if let leftIconView = searchBar.searchTextField.leftView as? UIImageView {
            leftIconView.tintColor = .systemGray
        }
        // Создаем placeholder с аттрибутами
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.systemGray]
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Поиск по продуктам и магазинам", attributes: attributes)
        // Меняем цвет кнопки очистки
        if let clearButton = searchBar.searchTextField.value(forKey: "clearButton") as? UIButton {
            clearButton.setImage(clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
            clearButton.tintColor = .systemGray
        }
        view.addSubview(searchBar)
    }
    
    // Добавляем кнопку отмена (при появлении клавиатуры и поднятии SearchBar)
    func addCancelButton() {
        cancelButton.frame = CGRect(x: 310, y: 50, width: 100, height: 50)
        cancelButton.setTitle("Отмена", for: .normal)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        cancelButton.alpha = 0
        view.addSubview(cancelButton)
    }
    
    // Добавляем UITapGestureRecognizer к view (во viewDidLoad вызываем для каждого фона товара)
    func addTapGestureRecognizer(to view: UIView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        // Переходим на контроллер товара
        
        // создаем новый контроллер
        let itemVC = ItemViewController()
        // получаем backgroundView, на которое был добавлен UITapGestureRecognizer
        guard let tappedBackgroundView = sender.view else { return }
        
        // извлекаем изображение и текст из backgroundView
        if let tappedLabel = tappedBackgroundView.subviews.first(where: { $0 is UILabel}) as? UILabel {
            itemVC.nameItem = tappedLabel.text
        }
        navigationController?.navigationBar.prefersLargeTitles = true
        UIView.transition(with: navigationController!.view, duration: 0.3, options: .transitionFlipFromRight) {
            self.navigationController?.pushViewController(itemVC, animated: false)
        }
        
    }
    
    // Добавляем надпись "Недавно просмотренные"
    func addRecentlyViewedLabel() {
        recentlyViewedLabel.frame = CGRect(x: 10, y: 220, width: 300, height: 50)
        recentlyViewedLabel.text = "Недавно просмотренные"
        recentlyViewedLabel.textColor = .white
        recentlyViewedLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        view.addSubview(recentlyViewedLabel)
    }
    
    // Добавляем кнопку "Очистить" (без функционала в данном задании)
    func addClearButton() {
        clearButton.frame = CGRect(x: 290, y: 220, width: 100, height: 50)
        clearButton.setTitle("Очистить", for: .normal)
        clearButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(clearButton)
    }
    
    // Добавляем область прокрутки
    func addDevicesScroll() {
        devicesScroll.frame = CGRect(x: 10, y: 270, width: 379, height: 200)
        devicesScroll.contentSize = CGSize(width: 640, height: 200)
        devicesScroll.showsHorizontalScrollIndicator = false
        view.addSubview(devicesScroll)
    }
    
    // Универсальная функция для добавления заднего вью для товаров
    func addBackgroundView(backgroundView: UIView, x: CGFloat) {
        backgroundView.frame = CGRect(x: x, y: devicesScroll.bounds.minY, width: 150, height: 200)
        backgroundView.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 0.7)
        backgroundView.layer.cornerRadius = 12
        devicesScroll.addSubview(backgroundView)
        
    }
    
    // Универсальная функция для добавления фотографий товаров и их названий
    func addImageGoods(imageItem: UIImageView, nameImage: String, backgroundView: UIView, labelItem: UILabel, text: String) {
        imageItem.frame = CGRect(x: backgroundView.bounds.minX + 15, y: backgroundView.bounds.minY + 10, width: 120, height: 130)
        imageItem.image = UIImage(named: nameImage)
        labelItem.frame = CGRect(x: backgroundView.bounds.minX + 13, y: backgroundView.bounds.minY + 140, width: 130, height: 50)
        labelItem.text = text
        labelItem.textColor = .white
        labelItem.numberOfLines = 0
        labelItem.textAlignment = .center
        labelItem.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        backgroundView.addSubview(imageItem)
        backgroundView.addSubview(labelItem)
    }
    
    // Добавляем лейбл "Варианты запросов"
    func addExamplesOfQueriesLabel() {
        examplesOfQueriesLabel.frame = CGRect(x: 10, y: 470, width: 300, height: 50)
        examplesOfQueriesLabel.text = "Варианты запросов"
        examplesOfQueriesLabel.textColor = .white
        examplesOfQueriesLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        view.addSubview(examplesOfQueriesLabel)
    }
    
    // Универсальный метод для добавления иконок поиска
    func addSearchIcon(imageView: UIImageView, frame: CGRect) {
        imageView.frame = frame
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .systemGray
        view.addSubview(imageView)
    }
    
    // Универсальный метод для добавления кнопок поисковых запросов
    func addSearchButton(button: UIButton, frame: CGRect, text: String) {
        button.frame = frame
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.setTitle(text, for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        searchBar.text = sender.titleLabel?.text
    }
}
