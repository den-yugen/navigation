//
// Created by Denis Yūgen
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {
    private let photoCollection: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoCollection.image = nil
    }

    func configureCell(photo: Photo) {
        photoCollection.image = photo.image
    }

    private func configureLayout() {
        contentView.addSubview(photoCollection)

        NSLayoutConstraint.activate([
            photoCollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
