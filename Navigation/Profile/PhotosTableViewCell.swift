//
// Created by Denis Yūgen
//

import UIKit

protocol PhotosTableViewCellDelegate: AnyObject {
    func tapAction()
}

final class PhotosTableViewCell: UITableViewCell {
    weak var delegate: PhotosTableViewCellDelegate?

    private let photosContentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .systemBackground
        contentView.disableAutoresizingMask()
        return contentView
    }()

    private let title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: Metric.titleTextSize, weight: .bold)
        title.textColor = .black
        title.disableAutoresizingMask()
        return title
    }()

    private lazy var arrowImage: UIButton = {
        let image = UIButton()
        image.tintColor = .black
        image.setBackgroundImage(UIImage(systemName: "arrow.right"), for: .normal)
        image.addTarget(self, action: #selector(openPhotoGallery), for: .touchUpInside)
        image.disableAutoresizingMask()
        return image
    }()
 
    private lazy var feedCollection: UICollectionView = {
        let defaultSpacing: CGFloat = Metric.defaulsSpacing
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: defaultSpacing, left: defaultSpacing, bottom: defaultSpacing, right: defaultSpacing)
        layout.minimumLineSpacing = defaultSpacing
        layout.minimumInteritemSpacing = defaultSpacing

        let feedCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        feedCollection.disableAutoresizingMask()
        feedCollection.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
        feedCollection.dataSource = self
        feedCollection.delegate = self
        return feedCollection
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(photo: Photo) {
        title.text = "Фотографии"
    }

    private func configureLayout() {
        contentView.addSubview(photosContentView)
        contentView.addSubview(title)
        contentView.addSubview(arrowImage)
        contentView.addSubview(feedCollection)

        NSLayoutConstraint.activate([
            photosContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photosContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photosContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            title.topAnchor.constraint(equalTo: photosContentView.topAnchor, constant: Metric.defaultInset),
            title.leadingAnchor.constraint(equalTo: photosContentView.leadingAnchor, constant: Metric.defaultInset),

            arrowImage.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            arrowImage.trailingAnchor.constraint(equalTo: photosContentView.trailingAnchor, constant: -Metric.defaultInset),

            feedCollection.topAnchor.constraint(equalTo: title.bottomAnchor, constant: Metric.minimumInset),
            feedCollection.leadingAnchor.constraint(equalTo: photosContentView.leadingAnchor, constant: Metric.minimumInset),
            feedCollection.trailingAnchor.constraint(equalTo: photosContentView.trailingAnchor, constant: -Metric.minimumInset),
            feedCollection.bottomAnchor.constraint(equalTo: photosContentView.bottomAnchor, constant: -Metric.minimumInset),
            feedCollection.heightAnchor.constraint(equalToConstant: Metric.feedHeight)
        ])
    }

    @objc private func openPhotoGallery() {
        delegate?.tapAction()
    }
}
