//
//  MediaTableViewCell.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 09.12.2024.
//

import UIKit

protocol MediaCellDelegate: AnyObject {
    func didTapCollectionItem(at indexPath: IndexPath, in tableCell: UITableViewCell, didSelectPhoto photo: MediaPost)
}

final class MediaTableViewCell: UITableViewCell {
    
    //MARK: - Объекты
    var nickname: String?
    weak var delegate: MediaCellDelegate?
    
    private var messiMedia: [MediaPost] = {
        var messiPostOne = MediaPost()
        messiPostOne.imageName = "messiPostOne"
        var messiPostTwo = MediaPost()
        messiPostTwo.imageName = "messiPostTwo"
        var messiPostThree = MediaPost()
        messiPostThree.imageName = "messiPostThree"
        var messiPostFour = MediaPost()
        messiPostFour.imageName = "messiPostFour"
        var messiPostFive = MediaPost()
        messiPostFive.imageName = "messiPostFive"
        var messiPostSix = MediaPost()
        messiPostSix.imageName = "messiPostSix"
        var messiPostSeven = MediaPost()
        messiPostSeven.imageName = "messiPostSeven"
        var messiPostEight = MediaPost()
        messiPostEight.imageName = "messiPostEight"
        var messiPostNine = MediaPost()
        messiPostNine.imageName = "messiPostNine"
        var messiPostTen = MediaPost()
        messiPostTen.imageName = "messiPostTen"
        var messiPostEleven = MediaPost()
        messiPostEleven.imageName = "messiPostEleven"
        var messiPostTwelve = MediaPost()
        messiPostTwelve.imageName = "messiPostTwelve"
        var messiPostThirteen = MediaPost()
        messiPostThirteen.imageName = "messiPostThirteen"
        var messiPostFourteen = MediaPost()
        messiPostFourteen.imageName = "messiPostFourteen"
        return [messiPostOne, messiPostTwo, messiPostThree, messiPostFour, messiPostFive, messiPostSix, messiPostSeven, messiPostEight, messiPostNine, messiPostTen, messiPostEleven, messiPostTwelve, messiPostThirteen, messiPostFourteen]
    }()
    private var mbappeMedia: [MediaPost] = {
        var mbappePostOne = MediaPost()
        mbappePostOne.imageName = "mbappePostOne"
        var mbappePostTwo = MediaPost()
        mbappePostTwo.imageName = "mbappePostTwo"
        var mbappePostThree = MediaPost()
        mbappePostThree.imageName = "mbappePostThree"
        var mbappePostFour = MediaPost()
        mbappePostFour.imageName = "mbappePostFour"
        var mbappePostFive = MediaPost()
        mbappePostFive.imageName = "mbappePostFive"
        var mbappePostSix = MediaPost()
        mbappePostSix.imageName = "mbappePostSix"
        var mbappePostSeven = MediaPost()
        mbappePostSeven.imageName = "mbappePostSeven"
        var mbappePostEight = MediaPost()
        mbappePostEight.imageName = "mbappePostEight"
        var mbappePostNine = MediaPost()
        mbappePostNine.imageName = "mbappePostNine"
        var mbappePostTen = MediaPost()
        mbappePostTen.imageName = "mbappePostTen"
        var mbappePostEleven = MediaPost()
        mbappePostEleven.imageName = "mbappePostEleven"
        var mbappePostTwelve = MediaPost()
        mbappePostTwelve.imageName = "mbappePostTwelve"
        var mbappePostThirteen = MediaPost()
        mbappePostThirteen.imageName = "mbappePostThirteen"
        return [mbappePostOne, mbappePostTwo, mbappePostThree, mbappePostFour, mbappePostFive, mbappePostSix, mbappePostSeven, mbappePostEight, mbappePostNine, mbappePostTen, mbappePostEleven, mbappePostTwelve, mbappePostThirteen]
    }()
    private var neymarMedia: [MediaPost] = {
        var neymarPostOne = MediaPost()
        neymarPostOne.imageName = "neymarPostOne"
        var neymarPostTwo = MediaPost()
        neymarPostTwo.imageName = "neymarPostTwo"
        var neymarPostThree = MediaPost()
        neymarPostThree.imageName = "neymarPostThree"
        var neymarPostFour = MediaPost()
        neymarPostFour.imageName = "neymarPostFour"
        var neymarPostFive = MediaPost()
        neymarPostFive.imageName = "neymarPostFive"
        var neymarPostSix = MediaPost()
        neymarPostSix.imageName = "neymarPostSix"
        var neymarPostSeven = MediaPost()
        neymarPostSeven.imageName = "neymarPostSeven"
        var neymarPostEight = MediaPost()
        neymarPostEight.imageName = "neymarPostEight"
        var neymarPostNine = MediaPost()
        neymarPostNine.imageName = "neymarPostNine"
        var neymarPostTen = MediaPost()
        neymarPostTen.imageName = "neymarPostTen"
        var neymarPostEleven = MediaPost()
        neymarPostEleven.imageName = "neymarPostEleven"
        var neymarPostTwelve = MediaPost()
        neymarPostTwelve.imageName = "neymarPostTwelve"
        var neymarPostThirteen = MediaPost()
        neymarPostThirteen.imageName = "neymarPostThirteen"
        return [neymarPostOne, neymarPostTwo, neymarPostThree, neymarPostFour, neymarPostFive, neymarPostSix, neymarPostSeven, neymarPostEight, neymarPostNine, neymarPostTen, neymarPostEleven, neymarPostTwelve, neymarPostThirteen]
    }()
    
    private var mediaCollectionView: UICollectionView!

    //MARK: - Инициализация
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupMediaCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            mediaCollectionView.frame = contentView.bounds
        
        }
    
    //MARK: - Методы
    // Настраиваем коллекцию для медиа
    private func setupMediaCollectionView() {
        // Настройка макета коллекции и макета секции
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let spacing: CGFloat = 1.29 // Отступы между ячейками
        let itemsPerRow: CGFloat = 3 // Количество элементов в строке
        let width = (contentView.frame.width - (itemsPerRow + 1) * spacing) / itemsPerRow // Вычисляем ширину ячеек с учетом отступов
        layout.itemSize = CGSize(width: width * 1.24, height: width * 1.24) // // Высота и ширина ячеек одинаковые
        layout.headerReferenceSize = CGSize(width: contentView.frame.width, height: 50)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        
        // Инициализация коллекции
        mediaCollectionView = UICollectionView(frame: contentView.bounds, collectionViewLayout: layout)
        mediaCollectionView.register(MediaSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MediaSectionHeaderView.identifier) // регистрация для заголовков секции
        mediaCollectionView.showsVerticalScrollIndicator = false
        mediaCollectionView.register(MediaCollectionViewCell.self, forCellWithReuseIdentifier: "MediaCollectionViewCell")
        mediaCollectionView.delegate = self
        mediaCollectionView.dataSource = self
        mediaCollectionView.isScrollEnabled = false
        contentView.addSubview(mediaCollectionView)
    }
}

//MARK: UICollectionView Data Source
extension MediaTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch nickname {
        case "leomessi": return messiMedia.count
        case "k.mbappe": return mbappeMedia.count
        case "neymarjr": return neymarMedia.count
        default: break
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediaCollectionViewCell", for: indexPath) as! MediaCollectionViewCell
        switch nickname {
        case "leomessi": cell.element = messiMedia[indexPath.row]
        case "k.mbappe": cell.element = mbappeMedia[indexPath.row]
        case "neymarjr": cell.element = neymarMedia[indexPath.row]
        default: break
        }
        return cell
    }
    
    // Настройка отображения заголовков
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MediaSectionHeaderView.identifier, for: indexPath) as! MediaSectionHeaderView
            return header
        }
        return UICollectionReusableView()
    }
    
}

//MARK: UICollectionView Delegate
extension MediaTableViewCell: UICollectionViewDelegate {
    // Передаем на PostViewController выбранное фото из коллекции
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectedPhoto: MediaPost?
        switch nickname {
        case "leomessi": selectedPhoto = messiMedia[indexPath.item]
        case "k.mbappe": selectedPhoto = mbappeMedia[indexPath.item]
        case "neymarjr": selectedPhoto = neymarMedia[indexPath.item]
        default: break
        }
        delegate?.didTapCollectionItem(at: indexPath, in: self, didSelectPhoto: selectedPhoto ?? messiMedia[indexPath.item]) // фото из коллекции всегда будет выбранно, но для безопасного извлечения возвращаем любой элемент
    }
}
