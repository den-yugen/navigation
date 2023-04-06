//
// Created by Denis Yūgen
//

import UIKit

protocol PhotosCollectionViewCellDelegate: AnyObject {
    func didTapPhoto(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}

final class PhotosCollectionViewCell: UICollectionViewCell {

    weak var delegate: PhotosCollectionViewCellDelegate?

    var indexPathCell = IndexPath()

    private lazy var photoCollectionView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.disableAutoresizingMask()
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAction)))
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
        photoCollectionView.image = nil
    }

    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }

    func configureCell(photo: Photo) {
        photoCollectionView.image = photo.image
    }

    private func configureLayout() {
        contentView.addSubview(photoCollectionView)

        NSLayoutConstraint.activate([
            photoCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    @objc private func tapAction() {
        delegate?.didTapPhoto(photoCollectionView.image, frameImage: photoCollectionView.frame, indexPath: indexPathCell)
    }
}
