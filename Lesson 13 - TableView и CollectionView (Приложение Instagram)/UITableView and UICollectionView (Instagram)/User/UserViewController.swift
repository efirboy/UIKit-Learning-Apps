//
//  UserViewController.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 13.11.2024.
//

import UIKit

final class UserViewController: UIViewController {
    
    // Никнейм с предыдущего экрана
    var nickname: String?
   
    //MARK: - Элементы модели
    private var messiInfo: UserInfo = {
        var messiElement = UserInfo()
        messiElement.imageName = "Messi"
        messiElement.username = "Leo Messi"
        messiElement.proffesion = "Спортсмен"
        messiElement.bio = "Bienvenidos a la cuenta oficial de Instagram de Leo Messi / Welcome to the official Leo Messi Instagram account"
        messiElement.location = "Miami, Florida"
        messiElement.subscribers = "neymarjr"
        messiElement.countPublications = "1286 публикации"
        messiElement.countSubscribers = "504 млн подписчиков"
        messiElement.countSubscriptions = "326 подписки"
        return messiElement
    }()
    
    private var mbappeInfo: UserInfo = {
        var mbappeElement = UserInfo()
        mbappeElement.imageName = "Mbappe"
        mbappeElement.username = "Kylian Mbappé"
        mbappeElement.proffesion = "Спортсмен"
        mbappeElement.bio = "Official account of Kylian Mbappé ⚡ World Champion 🌍 Forward for Real Madrid & French National Team 🇫🇷"
        mbappeElement.location = "Madrid, Spain"
        mbappeElement.subscribers = "neymarjr"
        mbappeElement.countPublications = "1345 публикации"
        mbappeElement.countSubscribers = "122 млн подписчиков"
        mbappeElement.countSubscriptions = "452 подписки"
        return mbappeElement
    }()
    
    private var neymarInfo: UserInfo = {
        var neymarElement = UserInfo()
        neymarElement.imageName = "Neymar"
        neymarElement.username = "Neymar Jr"
        neymarElement.proffesion = "Спортсмен"
        neymarElement.bio = "Just a man from Brazil living the dream ⚽️ Forward for Al Hilal and the Seleção. Welcome to my official account! 🙌"
        neymarElement.location = "El Riyadh, Saudi Arabia"
        neymarElement.subscribers = "leomessi"
        neymarElement.countPublications = "5707 публикации"
        neymarElement.countSubscribers = "226 млн подписчиков"
        neymarElement.countSubscriptions = "1817 подписки"
        return neymarElement
    }()
    
    
    //MARK: - Объекты для таблицы
    private var myTableView = UITableView()
    private var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Реализация методов
        setupNavigationControllerItems()
        setupTableView()
    }
    
    //MARK: - Методы
    
    // Настраиваем элементы навигационного контроллера
    private func setupNavigationControllerItems() {
        navigationController?.navigationBar.tintColor = .black
        // добавялем правый элемент (три точки)
        let rightButton = UIButton()
        rightButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        // Добавляем логин по центру
        let userLabel = UILabel()
        userLabel.text = nickname
        userLabel.textAlignment = .center
        userLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        navigationItem.titleView = userLabel
    }
    
    // Настраиваем таблицу и refreshControl
    private func setupTableView() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(InfoUserTableViewCell.self, forCellReuseIdentifier: "InfoUserTableViewCell") // ячейка информации о пользователе
        myTableView.register(HighlightsTableViewCell.self, forCellReuseIdentifier: "HighlightsTableViewCell") // ячейка секции "Актуальное" (хайлайты)
        myTableView.register(MediaTableViewCell.self, forCellReuseIdentifier: "MediaTableViewCell") // ячейка ленты (коллекции) фотографий
        myTableView.separatorStyle = .none
        myTableView.showsVerticalScrollIndicator = false
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        view.addSubview(myTableView)
    }
    
    @objc private func refreshData() {
        refreshControl.endRefreshing() // визуальный эффект
    }
}

//MARK: UITableView Data Source
extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 { // ячейка информации о пользователе
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoUserTableViewCell", for: indexPath) as! InfoUserTableViewCell
            switch nickname {
            case "leomessi": cell.element = messiInfo
            case "k.mbappe": cell.element = mbappeInfo
            case "neymarjr": cell.element = neymarInfo
            default: break
            }
            cell.delegate = self
            cell.delegateSubscriber = self
            return cell
        } else if indexPath.row == 1 { // ячейка секции "Актуальное" (хайлайты)
            let cell = tableView.dequeueReusableCell(withIdentifier: "HighlightsTableViewCell", for: indexPath) as! HighlightsTableViewCell
            cell.nickname = nickname
            cell.delegate = self
            return cell
        } else { // ячейка ленты (коллекции) фотографий
            let cell = tableView.dequeueReusableCell(withIdentifier: "MediaTableViewCell", for: indexPath) as! MediaTableViewCell
            cell.nickname = nickname
            cell.delegate = self
            return cell
        }
    }
}

//MARK: UITableView Delegate
extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 320 // высота ячейки информации о пользователе
        } else if indexPath.row == 1 {
            return 100 // высота ячейки секции "Актуальное" (хайлайты)
        } else {
            return 700 // высота ячейки с коллекией фотографий
        }
    }
    
    // Запрещаем выделение ячеек таблицы
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}


//MARK: - Реализация протокола StorysViewCellDelegate (для открытия главной сторис)
extension UserViewController: StorysViewCellDelegate {
    func didTapStorys(in cell: UITableViewCell) {
        let storysVC = StorysViewController()
        storysVC.nickname = nickname
        storysVC.modalPresentationStyle = .fullScreen
        storysVC.modalTransitionStyle = .crossDissolve
        present(storysVC, animated: true)
    }
}

//MARK: - Реализация протокола HighlightsTableViewCellDelegate (для открытия сторис из "Актуального")
extension UserViewController: HighlightsTableViewCellDelegate {
    func didSelectItemAt(in cell: UITableViewCell, index: Int) {
        let storysVC = StorysViewController()
        storysVC.nickname = nickname
        storysVC.selectedHighlightIndex = index
        storysVC.modalPresentationStyle = .fullScreen
        storysVC.modalTransitionStyle = .crossDissolve
        present(storysVC, animated: true)
    }
}

//MARK: - Реализация протокола MediaCellDelegate (для открытия выбранной фотографии из коллекции)
extension UserViewController: MediaCellDelegate {
    func didTapCollectionItem(at indexPath: IndexPath, in tableCell: UITableViewCell, didSelectPhoto photo: MediaPost) {
        let postVC = PostViewController()
        postVC.modalPresentationStyle = .fullScreen
        postVC.modalTransitionStyle = .crossDissolve
        postVC.nickname = nickname
        postVC.mediaPost = photo
        present(postVC, animated: true)
    }
}

//MARK: - Реализация протокола UserViewControllerDelegate (для перехода на страничку подписчика из странички пользователя, при любом количестве переходов, возврат назад из странички пользователя всегда будет на домашнюю страницу)
extension UserViewController: UserViewControllerDelegate {
    func didTapSubscriber(subscriber: String) {
        let userVC = UserViewController()
        userVC.nickname = subscriber
        
        // Получаем текущий TabBarController
        if let tabBarController = self.tabBarController,
           let navigationController = tabBarController.viewControllers?.first(where: { $0 is UINavigationController }) as? UINavigationController {
            navigationController.setViewControllers([navigationController.viewControllers.first!, userVC], animated: true)
        }
    }
}







