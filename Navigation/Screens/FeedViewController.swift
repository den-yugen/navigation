//
// Created by Denis Yūgen
//

import UIKit

class FeedViewController: UIViewController {
    private let postButton  = AppButton(backgroundColor: .systemCyan, title: "Новость")
    private let post        = Post(title: "Новость")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configurePostButton()
    }

    private func configurePostButton() {
        view.addSubview(postButton)
        postButton.addTarget(self, action: #selector(pushPostVC), for: .touchUpInside)

        NSLayoutConstraint.activate([
            postButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            postButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func pushPostVC() {
        let postVC      = PostViewController()
        postVC.title    = post.title
        navigationController?.pushViewController(postVC, animated: true)
    }
}
