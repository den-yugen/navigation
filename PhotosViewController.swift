//
// Created by Denis Yūgen
//

import UIKit

final class PhotosViewController: UIViewController {
    lazy var photoCollection: UICollectionView = {
        let defaultSpacing: CGFloat = 8
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: defaultSpacing, left: defaultSpacing, bottom: defaultSpacing, right: defaultSpacing)
        layout.minimumLineSpacing = defaultSpacing
        layout.minimumInteritemSpacing = defaultSpacing

        let photoCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photoCollection.disableAutoresizingMask()
        photoCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        photoCollection.dataSource = self
        photoCollection.delegate = self
        return photoCollection
    }()

    var initialImageRect: CGRect = .zero
    
    private let transparentView: UIView = {
        let view = UIView()
        view.frame = UIScreen.main.bounds
        view.backgroundColor = .black
        view.alpha = 0.8
        return view
    }()

    private let animatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 50, y: 100, width: 25, height: 25))
        button.setBackgroundImage(UIImage(systemName: "xmark.square"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()

    private func animateImageToInitial(rect: CGRect) {
        UIButton.animate(withDuration: 0.3) {
            self.closeButton.alpha = 0
        } completion: { _ in
            self.closeButton.removeFromSuperview()
        }

        UIView.animate(withDuration: 0.5, delay: 0.3) {
            self.animatingImageView.frame = rect
        } completion: { _ in
            self.transparentView.removeFromSuperview()
            self.animatingImageView.removeFromSuperview()
        }
    }

    func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(transparentView)
        view.addSubview(animatingImageView)
        view.addSubview(closeButton)
        animatingImageView.image = image
        animatingImageView.frame = CGRect(x: imageFrame.origin.x,
                                          y: imageFrame.origin.y,
                                          width: imageFrame.width,
                                          height: imageFrame.height)

        UIView.animate(withDuration: 0.5) {
            self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.width)
            self.animatingImageView.center = self.view.center
        }

        closeButton.alpha = 0
        UIButton.animate(withDuration: 0.3, delay: 0.5) {
            self.closeButton.alpha = 1
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Фотогалерея"
        view.backgroundColor = .systemBackground
        configureLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    private func configureLayout() {
        view.addSubview(photoCollection)

        NSLayoutConstraint.activate([
            photoCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc private func closeButtonTapped() {
        animateImageToInitial(rect: initialImageRect)
    }
}
