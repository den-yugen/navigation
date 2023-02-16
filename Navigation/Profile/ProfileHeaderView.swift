//
// Created by Denis Yūgen
//

import UIKit

class ProfileHeaderView: UIView {
    private let avatarImageView: UIImageView = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "avatar")
        avatar.frame.size.width = 100
        avatar.frame.size.height = avatar.frame.size.width
        avatar.layer.borderWidth = 3
        avatar.layer.masksToBounds = false
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = avatar.frame.width / 2
        avatar.clipsToBounds = true
        return avatar
    }()

    private let fullNameLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        name.textColor = .black
        name.text = "Доктор Ливси"
        name.numberOfLines = 0
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    private var statusText = String()

    private let statusLabel: UILabel = {
        let status = UILabel()
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textColor = .systemGray
        status.text = "Текущий статус"
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()

    private let statusTextField: UITextField = {
        let newStatus = UITextField()
        newStatus.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        newStatus.textColor = .black
        newStatus.backgroundColor = .white
        newStatus.placeholder = "Введите текст"
        newStatus.layer.cornerRadius = 12
        newStatus.layer.borderWidth = 1
        newStatus.layer.borderColor = UIColor.black.cgColor
        newStatus.translatesAutoresizingMaskIntoConstraints = false
        return newStatus
    }()

    private let setStatusButton: UIButton = {
        let button = UIButton()
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 5)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.cornerRadius = 12
        button.backgroundColor = .systemCyan
        button.setTitle("Установить статус", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
        configureConnstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureLayer() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        setStatusButton.addTarget(self, action: #selector(setStatusButtonPressed), for: .touchUpInside)
    }

    private func configureConnstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 11),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -18),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 6),
            statusTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 116),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "Введите текст"
    }
    
    @objc private func setStatusButtonPressed() {
        statusLabel.text = statusText
        print(statusLabel.text as Any)
    }
}
