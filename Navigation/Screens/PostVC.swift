//
// Created by Denis Yūgen
//

import UIKit

class PostVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureBarItem()
    }

    private func configureBarItem() {
        let barItem                         = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem   = barItem
    }

    @objc private func barItemAction() {
        let modalVC                     = InfoVC()
        modalVC.modalPresentationStyle  = .fullScreen
        present(modalVC, animated: true)
    }
}
