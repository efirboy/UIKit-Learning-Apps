//
//  HighlightsTableViewCell.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 26.11.2024.
//

import UIKit

protocol HighlightsTableViewCellDelegate: AnyObject {
    func didSelectItemAt(in cell: UITableViewCell, index: Int)
}

final class HighlightsTableViewCell: UITableViewCell {

    //MARK: - Объекты

    var nickname: String?
    weak var delegate: HighlightsTableViewCellDelegate?
    
    private var messiHighlights: [Highlights] = {
        var messiHighlightOne = Highlights()
        messiHighlightOne.imageName = "MessiHighlightOne"
        messiHighlightOne.nameHighlights = "Barcelona"
        var messiHighlightTwo = Highlights()
        messiHighlightTwo.imageName = "MessiHighlightTwo"
        messiHighlightTwo.nameHighlights = "PSG"
        var messiHighlightThree = Highlights()
        messiHighlightThree.imageName = "messiHighlightThree"
        messiHighlightThree.nameHighlights = "Family"
        var messiHighlightFour = Highlights()
        messiHighlightFour.imageName = "messiHighlightFour"
        messiHighlightFour.nameHighlights = "Camp Nou"
        var messiHighlightFive = Highlights()
        messiHighlightFive.imageName = "messiHighlightFive"
        messiHighlightFive.nameHighlights = "Inter Miami"
        var messiHighlightSix = Highlights()
        messiHighlightSix.imageName = "messiHighlightSix"
        messiHighlightSix.nameHighlights = "Friends"
        return [messiHighlightOne, messiHighlightTwo, messiHighlightThree, messiHighlightFour, messiHighlightFive, messiHighlightSix]
    }()
    
    private var mbappeHighlights: [Highlights] = {
        var mbappeHighlightOne = Highlights()
        mbappeHighlightOne.imageName = "mbappeHighlightOne"
        mbappeHighlightOne.nameHighlights = "Paris"
        var mbappeHighlightTwo = Highlights()
        mbappeHighlightTwo.imageName = "mbappeHighlightTwo"
        mbappeHighlightTwo.nameHighlights = "Monaco"
        var mbappeHighlightThree = Highlights()
        mbappeHighlightThree.imageName = "mbappeHighlightThree"
        mbappeHighlightThree.nameHighlights = "Cars"
        var mbappeHighlightFour = Highlights()
        mbappeHighlightFour.imageName = "mbappeHighlightFour"
        mbappeHighlightFour.nameHighlights = "Santiago Bernabeu"
        var mbappeHighlightFive = Highlights()
        mbappeHighlightFive.imageName = "mbappeHighlightFive"
        mbappeHighlightFive.nameHighlights = "Real Madrid"
        var mbappeHighlightSix = Highlights()
        mbappeHighlightSix.imageName = "mbappeHighlightSix"
        mbappeHighlightSix.nameHighlights = "World Cup 2018"
        return [mbappeHighlightOne, mbappeHighlightTwo, mbappeHighlightThree, mbappeHighlightFour, mbappeHighlightFive, mbappeHighlightSix]
    }()
    
    private var neymarHighlights: [Highlights] = {
        var neymarHighlightOne = Highlights()
        neymarHighlightOne.imageName = "neymarHighlightOne"
        neymarHighlightOne.nameHighlights = "Blaze"
        var neymarHighlightTwo = Highlights()
        neymarHighlightTwo.imageName = "neymarHighlightTwo"
        neymarHighlightTwo.nameHighlights = "INJr"
        var neymarHighlightThree = Highlights()
        neymarHighlightThree.imageName = "neymarHighlightThree"
        neymarHighlightThree.nameHighlights = "Poker"
        var neymarHighlightFour = Highlights()
        neymarHighlightFour.imageName = "neymarHighlightFour"
        neymarHighlightFour.nameHighlights = "Games"
        var neymarHighlightFive = Highlights()
        neymarHighlightFive.imageName = "neymarHighlightFive"
        neymarHighlightFive.nameHighlights = "Brazil"
        var neymarHighlightSix = Highlights()
        neymarHighlightSix.imageName = "neymarHighlightSix"
        neymarHighlightSix.nameHighlights = "Santos"
        return [neymarHighlightOne, neymarHighlightTwo, neymarHighlightThree, neymarHighlightFour, neymarHighlightFive, neymarHighlightSix]
    }()
    
    private let highlightsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    

    //MARK: - Инициализация
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHighlightsCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        highlightsCollectionView.frame = contentView.bounds
    }
    
    //MARK: - Методы
    
    // Настраиваем colectionView
    private func setupHighlightsCollectionView() {
        highlightsCollectionView.delegate = self
        highlightsCollectionView.dataSource = self
        highlightsCollectionView.showsHorizontalScrollIndicator = false
        highlightsCollectionView.register(HighlightsCollectionViewCell.self, forCellWithReuseIdentifier: "HighlightsCollectionViewCell")
        contentView.addSubview(highlightsCollectionView)
    }

}

//MARK: UICollectionViewDataSource
extension HighlightsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch nickname {
        case "leomessi": return messiHighlights.count
        case "k.mbappe": return mbappeHighlights.count
        case "neymarjr": return neymarHighlights.count
        default: break
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HighlightsCollectionViewCell", for: indexPath) as! HighlightsCollectionViewCell
        switch nickname {
        case "leomessi": cell.element = messiHighlights[indexPath.row]
        case "k.mbappe": cell.element = mbappeHighlights[indexPath.row]
        case "neymarjr": cell.element = neymarHighlights[indexPath.row]
        default: break
        }
        return cell
    }
    
 
}

//MARK: UICollectionViewDelegate
extension HighlightsTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // находим индекс нажатого элемента коллекции (хайлайта) и сообщаем делегату
        let selectedItemIndex = indexPath.item
        delegate?.didSelectItemAt(in: self, index: selectedItemIndex)
    }
}

