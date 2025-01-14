//
//  PostViewController.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 25.12.2024.
//

import UIKit

class PostViewController: UIViewController {
    
    var nickname: String?
    var mediaPost: MediaPost?
    private var myTableView = UITableView()
    private var timer: Timer?
    
    // создаем универсальный пост, чтобы не создавать огромное количество элементов модели для каждой фото каждого пользователя (в полноценном приложении данные приходят из интернета). Сейчас передаем только нажатую фотографию, никнейм и на его основе аватар конкретного пользователя.
    private lazy var universalPost: MainPost = {
        var universalElement = MainPost()
        switch nickname {
        case "leomessi": universalElement.userPhoto = "Messi"
        case "k.mbappe": universalElement.userPhoto = "Mbappe"
        case "neymarjr": universalElement.userPhoto = "Neymar"
        default: break
        }
        universalElement.userNickname = nickname
        universalElement.timePost = "12 ч."
        universalElement.postPhoto = mediaPost?.imageName
        universalElement.quantityLikes = "9,2 млн"
        universalElement.quantityComments = "120 тыс."
        universalElement.quantityShares = "196 тыс."
        universalElement.messagePost = "Football is not just a game, it’s constant work on yourself and striving for new heights. Thank you to everyone who supports me on and off the field. Your belief gives me the strength to keep moving forward."
        universalElement.messagePostTranslate = "Футбол — это не просто игра, это постоянная работа над собой и стремление к новым вершинам. Спасибо всем, кто поддерживает меня на поле и за его пределами. Ваша вера дает мне силы двигаться вперед."
        universalElement.datePost = "16 октября •"
        return universalElement
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Реализация методов
        setupMyTable()
        setupTimer()
        
    }
    
    // Настраиваем таблицу
    private func setupMyTable() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        myTableView.separatorStyle = .none
        myTableView.showsVerticalScrollIndicator = false
        myTableView.delegate = self
        myTableView.dataSource = self
        view.addSubview(myTableView)
    }
    
    // Настраиваем таймер
    private func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(closePost), userInfo: nil, repeats: false)
    }
    
    // Закрываем пост через 5 секунд
    @objc private func closePost() {
        dismiss(animated: true)
        timer?.invalidate()
        timer = nil
    }
}

//MARK: - UITableViewDataSource
extension PostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell.element = universalPost
        return cell
    }
}

//MARK: - UITableViewDelegate
extension PostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 730 // задаем высоту поста
    }
    // Запрещаем выделение ячеек таблицы
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
