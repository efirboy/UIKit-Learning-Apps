//
//  ViewController.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 17.10.2024.
//

import UIKit

final class HomeViewController: UIViewController {

    //MARK: - Объекты для навигационного бара
    private let instagramButton = UIButton(type: .custom)
    private let heartButton = UIButton(type: .custom)
    private let messageButton = UIButton(type: .custom)
    
    //MARK: - Объекты для таблицы
    private var myTableView = UITableView()
    private var refreshControl = UIRefreshControl()
    
    //MARK: - Объекты для сторис
    private let yourStorysPhoto = UIImageView()
    private let neymarStorysPhoto = UIImageView()
    private let messiStorysPhoto = UIImageView()
    private let ronaldoStorysPhoto = UIImageView()
    private let mbappeStorysPhoto = UIImageView()
    private let viniciusStorysPhoto = UIImageView()
    private let modricStorysPhoto = UIImageView()
    private let yourLabel = UILabel()
    private let neymarLabel = UILabel()
    private let messiLabel = UILabel()
    private let ronaldoLabel = UILabel()
    private let mbappeLabel = UILabel()
    private let viniciusLabel = UILabel()
    private let modricLabel = UILabel()
    private var images = [UIImage(named: "Messi"), UIImage(named: "Ronaldo"), UIImage(named: "Mbappe"), UIImage(named: "Neymar"), UIImage(named: "Vinicius"), UIImage(named: "Modric"), UIImage(named: "YourStorys")]
    
    //MARK: Элементы модели для постов
    private let messiMainPost: MainPost = {
        var messiElement = MainPost()
        messiElement.userPhoto = "Messi"
        messiElement.userNickname = "leomessi"
        messiElement.timePost = "4 ч."
        messiElement.postPhoto = "messiPost"
        messiElement.quantityLikes = "9,2 млн"
        messiElement.quantityComments = "120 тыс."
        messiElement.quantityShares = "196 тыс."
        messiElement.messagePost = "Tenía muchas ganas de volver a jugar en Argentina y me emociona más que nunca el cariño y la conexión con la gente. Seguimos adelante con la misma ilusión!"
        messiElement.messagePostTranslate = "Я с нетерпением ждал возможности снова сыграть в Аргентине, и я как никогда взволнован любовью и общением с людьми. Мы продолжаем двигаться вперед с теми же мечтами!"
        messiElement.datePost = "16 октября •"
        return messiElement
    }()
    
    private let mbappeMainPost: MainPost = {
        var mbappeElement = MainPost()
        mbappeElement.userPhoto = "Mbappe"
        mbappeElement.userNickname = "k.mbappe"
        mbappeElement.timePost = "6 ч."
        mbappeElement.postPhoto = "mbappePost"
        mbappeElement.quantityLikes = "4,4 млн"
        mbappeElement.quantityComments = "19,6 тыс."
        mbappeElement.quantityShares = "23,5 тыс."
        mbappeElement.messagePost = "My first Champions League night at home. 🏠🤍 It was incredible to feel the support from our fans, and the energy on the field was amazing. We're pushing forward together! ⚪️🔵"
        mbappeElement.messagePostTranslate = "Мой первый домашний матч в Лиге чемпионов. 🏠🤍 Было невероятно чувствовать поддержку наших болельщиков, а энергия на поле была потрясающей. Мы вместе движемся вперед! ⚪️🔵"
        mbappeElement.datePost = "12 октября •"
        return mbappeElement
    }()
    
    private let neymarMainPost: MainPost = {
        var neymarElement = MainPost()
        neymarElement.userPhoto = "Neymar"
        neymarElement.userNickname = "neymarjr"
        neymarElement.timePost = "7 ч."
        neymarElement.postPhoto = "neymarPost"
        neymarElement.quantityLikes = "4,9 млн"
        neymarElement.quantityComments = "120 тыс."
        neymarElement.quantityShares = "430 тыс."
        neymarElement.messagePost = "Feliz de estar sentindo este sentimento novamente, friozinho na barriga pré jogo é sempre muito bom.. que seja um retorno cheio de saúde! Que Deus nos abençoe e nos proteja 🙏💙"
        neymarElement.messagePostTranslate = "Счастлив снова почувствовать это чувство, бабочки в животе перед игрой всегда очень здорово. Пусть это будет возвращение, полное здоровья! Да благословит и защитит нас Бог 🙏💙 "
        neymarElement.datePost = "3 октября •"
        return neymarElement
    }()
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Реализация методов
        addTabBarItem()
        addNavControllerItems()
        addMyTableView()
    }
    
    //MARK: - Методы
    
    // Настраиваем элемент tabBar
    private func addTabBarItem() {
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "unselectHouse"), selectedImage: UIImage(named: "selectHouse"))
        tabBarItem.imageInsets = UIEdgeInsets(top: 7, left: 0, bottom: 0, right: 0)
        self.tabBarItem = tabBarItem
        tabBarController?.selectedIndex = 0
    }
    
    // Настраиваем элементы навигационного контроллера
    private func addNavControllerItems() {
        // Кнопка "Instagram" (в данном задании без функционала)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "Instagram")
        config.baseForegroundColor = .black
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -30, bottom: 0, trailing: 0) // сдвигаем чуть влево на навигационному бару
        instagramButton.configuration = config
        let instagramButtonItem = UIBarButtonItem(customView: instagramButton)
        navigationItem.leftBarButtonItem = instagramButtonItem
        
        // кнопка сердечко (в данном задании без функционала)
        var configTwo = UIButton.Configuration.plain()
        configTwo.image = UIImage(named: "heart")
        configTwo.baseForegroundColor = .black
        configTwo.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -20) // сдвигаем сердечко чуть левее
        heartButton.configuration = configTwo
        let heartBarButtonItem = UIBarButtonItem(customView: heartButton)
        
        // кнопка сообщений (в данном задании без функционала)
        var configThree = UIButton.Configuration.plain()
        configThree.image = UIImage(named: "message")
        configThree.baseForegroundColor = .black
        configThree.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -10) // сдвигаем кнопку сообщений чуть левее
        messageButton.configuration = configThree
        let messageBarButtonItem = UIBarButtonItem(customView: messageButton)
        
        // устанавливаем сердечко и сообщение
        navigationItem.rightBarButtonItems = [messageBarButtonItem, heartBarButtonItem]
    }
    
    // Создаем таблицу и настраиваем refreshControl
    private func addMyTableView() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(StorysScrollTableViewCell.self, forCellReuseIdentifier: "StorysScrollTableViewCell")
        myTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        myTableView.register(RecommendationsViewCell.self, forCellReuseIdentifier: "RecommendationsViewCell")
        myTableView.separatorStyle = .none
        myTableView.showsVerticalScrollIndicator = false
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        view.addSubview(myTableView)
    }
    
    @objc private func refreshData() {
        //myTableView.reloadData() - в данном случае обновление не нужно, лишь визуальный эффект
        refreshControl.endRefreshing()
    }
}

//MARK: UITableView Data Source

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 { // ячейка с ScrollView сторис
            let cell = tableView.dequeueReusableCell(withIdentifier: "StorysScrollTableViewCell", for: indexPath) as! StorysScrollTableViewCell
            if images[indexPath.row] != nil {
                cell.addStorys(storysImage: yourStorysPhoto, image: images[6]!, x: 10,nicknameLabel: yourLabel, nickname: "Ваша история", storysInactive: true, index: 0)
                cell.addStorys(storysImage: neymarStorysPhoto, image: images[3]!, x: 110, nicknameLabel: neymarLabel, nickname: "neymarjr", storysInactive: false, index: 1)
                cell.addStorys(storysImage: messiStorysPhoto, image: images[0]!, x: 210, nicknameLabel: messiLabel, nickname: "leomessi", storysInactive: false, index: 2)
                cell.addStorys(storysImage: mbappeStorysPhoto, image: images[2]!, x: 310, nicknameLabel: mbappeLabel, nickname: "k.mbappe", storysInactive: false, index: 3)
                cell.addStorys(storysImage: ronaldoStorysPhoto, image: images[1]!, x: 410, nicknameLabel: ronaldoLabel, nickname: "cristiano", storysInactive: false, index: 4)
                cell.addStorys(storysImage: viniciusStorysPhoto, image: images[4]!, x: 510, nicknameLabel: viniciusLabel, nickname: "vinijr", storysInactive: false, index: 5)
                cell.addStorys(storysImage: modricStorysPhoto, image: images[5]!, x: 610, nicknameLabel: modricLabel, nickname: "lukamodric10", storysInactive: false, index: 6)
                cell.delegate = self
            }
            return cell
        } else if indexPath.row == 1 { // пост Месси
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.element = messiMainPost
            cell.userName = "leomessi"
            cell.delegate = self
            return cell
        } else if indexPath.row == 2 { // ячейка "Рекомендуемое"
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendationsViewCell", for: indexPath) as! RecommendationsViewCell
            return cell
        } else if indexPath.row == 3 { // пост Мбаппе
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.element = mbappeMainPost
            cell.userName = "k.mbappe"
            cell.delegate = self
            return cell
        } else { // пост Неймара
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.element = neymarMainPost
            cell.userName = "neymarjr"
            cell.delegate = self
            return cell
        }
    }
}

//MARK: - UITableViewDelegate
    
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 140 // высота ячейки сторис
        } else if indexPath.row == 2  {
            return 340 // высота ячейки секции "Рекомендуемое"
        } else {
            return 730 // высота всех постов
        }
        }
    
    // Запрещаем выделение ячеек таблицы
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

//MARK: - Реализация протокола PostTableViewCellDelegate (для перехода на UserViewController)

extension HomeViewController: PostTableViewCellDelegate {
    func didTapNicknameButton(in cell: PostTableViewCell) {
        guard let nickname = cell.userName else { return }
        let userVC = UserViewController()
        userVC.nickname = nickname
        navigationController?.pushViewController(userVC, animated: true)
        navigationItem.backButtonTitle = ""
    }
}

//MARK: - Реализация протокола StorysScrollTableViewCellDelegate (для запоминания индекса нажатой сторис и перехода на StorysViewController)
extension HomeViewController: StorysScrollTableViewCellDelegate {
    func didTapStory(at index: Int) {
        if index > 0 { // при индексе 0 не нужен переход на показ сторис, так как это вью добавления собственной
            let storysVC = StorysViewController()
            storysVC.selectedMainPageIndex = index
            storysVC.modalPresentationStyle = .fullScreen
            storysVC.modalTransitionStyle = .crossDissolve
            present(storysVC, animated: true)
        }
    }
}

