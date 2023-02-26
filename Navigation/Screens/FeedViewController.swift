//
// Created by Denis Yūgen
//

import UIKit

class FeedViewController: UIViewController {
    private let postButton = AppButton(backgroundColor: .systemCyan, title: "Новость")
    private let anotherPostButton = AppButton(backgroundColor: .systemMint, title: "Новость")
    private let post = "Новость"
    private let buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLayout()
        configureConstraints()
    }

    private func configureLayout() {
        view.addSubview(buttonsStack)
        buttonsStack.addArrangedSubview(postButton)
        buttonsStack.addArrangedSubview(anotherPostButton)
        postButton.addTarget(self, action: #selector(pushPostVC), for: .touchUpInside)
        anotherPostButton.addTarget(self, action: #selector(pushPostVC), for: .touchUpInside)
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonsStack.heightAnchor.constraint(equalToConstant: 110)
        ])
    }

    @objc private func pushPostVC() {
        let postVC = PostViewController()
        postVC.title = post
        navigationController?.pushViewController(postVC, animated: true)
    }
}
