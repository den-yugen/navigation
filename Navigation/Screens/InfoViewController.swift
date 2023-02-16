//
// Created by Denis Yūgen
//

import UIKit

class InfoViewController: UIViewController {

    let alertButton = AppButton(backgroundColor: .systemCyan, title: "Предупреждение")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        configureAlertButton()
    }

    private func configureAlertButton() {
        view.addSubview(alertButton)
        alertButton.addTarget(self, action: #selector(alertAction), for: .touchUpInside)

        NSLayoutConstraint.activate([
            alertButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            alertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            alertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            alertButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func alertAction() {
        let alert           = UIAlertController(title: "Закрыть окно", message: "Вы уверены?", preferredStyle: .alert)
        let cancelAction    = UIAlertAction(title: "Отмена", style: .destructive) { _ in
            print("Действие отменено")
        }
        let okAction        = UIAlertAction(title: "Закрыть", style: .default) { _ in
            self.dismiss(animated: true)
            print("Окно закрыто")
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
