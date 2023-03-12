//
// Created by Denis Yūgen
//

import UIKit

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        PhotosViewController.photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as! FeedCollectionViewCell
        cell.configureCell(photo: PhotosViewController.photos[indexPath.row])
        return cell
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 4
        let spacing: CGFloat = 8
        let width = (collectionView.bounds.width - spacing * (itemsPerRow + 1)) / itemsPerRow
        let height = collectionView.bounds.height - spacing * 2
        return CGSize(width: width, height: height)
    }
}

extension PhotosTableViewCell {
    enum Metric {
        static let defaulsSpacing: CGFloat = 8
        static let titleTextSize: CGFloat = 24
        static let defaultInset: CGFloat = 12
        static let minimumInset: CGFloat = 4
        static let feedHeight: CGFloat = 80
    }
}
