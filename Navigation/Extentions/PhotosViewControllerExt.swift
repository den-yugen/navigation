//
// Created by Denis Yūgen
//

import UIKit

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        PhotosViewController.photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.configureCell(photo: PhotosViewController.photos[indexPath.row])
        cell.delegate = self
        cell.setIndexPath(indexPath)
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 3
        let spacing: CGFloat = 8
        let width = (collectionView.bounds.width - spacing * (itemsPerRow + 1)) / itemsPerRow
        return CGSize(width: width, height: width)
    }
}

extension PhotosViewController: PhotosCollectionViewCellDelegate {
    func didTapPhoto(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath) {
        let rectCell = photoCollection.cellForItem(at: indexPath)?.frame
        let rectInSuperView = photoCollection.convert(rectCell!, to: photoCollection.superview)
        initialImageRect = CGRect(x: frameImage.origin.x + rectInSuperView.origin.x,
                                  y: frameImage.origin.y + rectInSuperView.origin.y,
                                  width: frameImage.width,
                                  height: frameImage.height)

        animateImage(image, imageFrame: initialImageRect)
    }
}

extension PhotosViewController {
    static let photos: [Photo] = [Photo(image: UIImage(named: "photo1")!),
                                  Photo(image: UIImage(named: "photo2")!),
                                  Photo(image: UIImage(named: "photo3")!),
                                  Photo(image: UIImage(named: "photo4")!),
                                  Photo(image: UIImage(named: "photo5")!),
                                  Photo(image: UIImage(named: "photo6")!),
                                  Photo(image: UIImage(named: "photo7")!),
                                  Photo(image: UIImage(named: "photo8")!),
                                  Photo(image: UIImage(named: "photo9")!),
                                  Photo(image: UIImage(named: "photo10")!),
                                  Photo(image: UIImage(named: "photo11")!),
                                  Photo(image: UIImage(named: "photo12")!),
                                  Photo(image: UIImage(named: "photo13")!),
                                  Photo(image: UIImage(named: "photo14")!),
                                  Photo(image: UIImage(named: "photo15")!),
                                  Photo(image: UIImage(named: "photo16")!),
                                  Photo(image: UIImage(named: "photo17")!),
                                  Photo(image: UIImage(named: "photo18")!),
                                  Photo(image: UIImage(named: "photo19")!),
                                  Photo(image: UIImage(named: "photo20")!)]
}
