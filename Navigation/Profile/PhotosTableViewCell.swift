//
// Created by Denis Yūgen
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    private let photosContentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .systemBackground
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private let title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private let arrowImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let feedCollection: UICollectionView = {
        let defaultSpacing: CGFloat = 8
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: defaultSpacing, left: defaultSpacing, bottom: defaultSpacing, right: defaultSpacing)
        layout.minimumLineSpacing = defaultSpacing
        layout.minimumInteritemSpacing = defaultSpacing

        let feedCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        feedCollection.translatesAutoresizingMaskIntoConstraints = false
        feedCollection.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
        return feedCollection
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        configureLayout()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        feedCollection.dataSource = self
        feedCollection.delegate = self
    }

    func configureCell(photo: Photo) {
        title.text = "Фотографии"
        arrowImage.image = UIImage(systemName: "arrow.right")
    }

    private func configureLayout() {
        contentView.addSubview(photosContentView)
        contentView.addSubview(title)
        contentView.addSubview(arrowImage)
        contentView.addSubview(feedCollection)
    }

    private func configureConstraints() {
        let defaultInset: CGFloat = 12
        let minimumInset: CGFloat = 4

        NSLayoutConstraint.activate([
            photosContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photosContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photosContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            title.topAnchor.constraint(equalTo: photosContentView.topAnchor, constant: defaultInset),
            title.leadingAnchor.constraint(equalTo: photosContentView.leadingAnchor, constant: defaultInset),

            arrowImage.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            arrowImage.trailingAnchor.constraint(equalTo: photosContentView.trailingAnchor, constant: -defaultInset),

            feedCollection.topAnchor.constraint(equalTo: title.bottomAnchor, constant: minimumInset),
            feedCollection.leadingAnchor.constraint(equalTo: photosContentView.leadingAnchor, constant: minimumInset),
            feedCollection.trailingAnchor.constraint(equalTo: photosContentView.trailingAnchor, constant: -minimumInset),
            feedCollection.bottomAnchor.constraint(equalTo: photosContentView.bottomAnchor, constant: -minimumInset),
            feedCollection.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
