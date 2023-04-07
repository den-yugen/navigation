//
// Created by Denis Yūgen
//

import UIKit

final class ProfileViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.disableAutoresizingMask()
        return tableView
    }()

    let header = ProfileHeaderView()
    var initialImageFrame: CGRect = .zero

    private let transparentView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .black
        view.alpha = 0.8
        return view
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 50, y: 50, width: 25, height: 25))
        button.setBackgroundImage(UIImage(systemName: "xmark.square"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        return button
    }()

    private let animatedAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        configureLayout()
    }

    func animateAvatar(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(transparentView)
        view.addSubview(animatedAvatar)
        view.addSubview(closeButton)
        animatedAvatar.image = image
        animatedAvatar.frame = CGRect(x: imageFrame.origin.x,
                                      y: imageFrame.origin.y,
                                      width: imageFrame.width,
                                      height: imageFrame.height)

        UIView.animate(withDuration: 0.5) {
            self.animatedAvatar.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                    height: UIScreen.main.bounds.width)
            self.animatedAvatar.center = self.view.center
            self.animatedAvatar.layer.cornerRadius = 0
        }

        closeButton.alpha = 0
        UIButton.animate(withDuration: 0.3, delay: 0.5) {
            self.closeButton.alpha = 1
        }
    }

    private func reverseAvatarAnimation(rect: CGRect) {
        UIButton.animate(withDuration: 0.3) {
            self.closeButton.alpha = 0
        } completion: { _ in
            self.closeButton.removeFromSuperview()
        }

        UIView.animate(withDuration: 0.5, delay: 0.3) {
            self.animatedAvatar.frame = rect
            self.animatedAvatar.layer.cornerRadius = self.initialImageFrame.width / 2
        } completion: { _ in
            self.transparentView.removeFromSuperview()
            self.animatedAvatar.removeFromSuperview()
        }
    }

    private func configureLayout() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc private func closeButtonAction() {
        reverseAvatarAnimation(rect: initialImageFrame)
    }
}
