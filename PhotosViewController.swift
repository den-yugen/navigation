//
// Created by Denis Yūgen
//

import UIKit

final class PhotosViewController: UIViewController {
    private let photoCollection: UICollectionView = {
        let defaultSpacing: CGFloat = 8
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: defaultSpacing, left: defaultSpacing, bottom: defaultSpacing, right: defaultSpacing)
        layout.minimumLineSpacing = defaultSpacing
        layout.minimumInteritemSpacing = defaultSpacing

        let photoCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photoCollection.translatesAutoresizingMaskIntoConstraints = false
        photoCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return photoCollection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Фотогалерея"
        view.backgroundColor = .systemBackground
        setupCell()
        configureLayout()
        configureConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    private func setupCell() {
        photoCollection.dataSource = self
        photoCollection.delegate = self
    }

    private func configureLayout() {
        view.addSubview(photoCollection)
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            photoCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
