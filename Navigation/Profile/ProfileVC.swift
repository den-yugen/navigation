//
// Created by Denis Yūgen
//

import UIKit

class ProfileVC: UIViewController {
    private let profileView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        configureProfileView()
    }

    private func configureProfileView() {
        view.addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
}
