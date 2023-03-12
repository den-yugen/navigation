//
// Created by Denis Yūgen
//

import UIKit

final class ProfileHeaderView: UIView {
    private let avatarImageView: UIImageView = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "avatar")
        avatar.frame.size.width = Metric.avatarSize
        avatar.frame.size.height = avatar.frame.size.width
        avatar.layer.borderWidth = 3
        avatar.layer.masksToBounds = false
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = avatar.frame.width / 2
        avatar.clipsToBounds = true
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()

    private let fullNameLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: Metric.titleTextSize, weight: .bold)
        name.textColor = .black
        name.text = "Доктор Ливси"
        name.numberOfLines = 0
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    private var statusText = String()

    private let statusLabel: UILabel = {
        let status = UILabel()
        status.font = UIFont.systemFont(ofSize: Metric.defaultFontSize, weight: .regular)
        status.textColor = .systemGray
        status.text = "Текущий статус"
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()

    private let statusTextField: UITextField = {
        let newStatus = UITextField()
        newStatus.font = UIFont.systemFont(ofSize: Metric.defaultFontSize, weight: .regular)
        newStatus.textColor = .black
        newStatus.backgroundColor = .white
        newStatus.placeholder = "Введите текст"
        newStatus.setPadding(10)
        newStatus.layer.cornerRadius = Metric.cornerRadius
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
        button.layer.cornerRadius = Metric.cornerRadius
        button.backgroundColor = UIColor(named: "VCblue")
        button.setTitle("Установить статус", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureLayout() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: Metric.defaultInset),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.defaultInset),
            avatarImageView.widthAnchor.constraint(equalToConstant: Metric.avatarSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: Metric.avatarSize),

            fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 11),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Metric.defaultInset),

            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Metric.defaultInset),
            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -Metric.defaultInset),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 6),
            statusTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 116),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.defaultInset),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.defaultInset),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.defaultInset),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metric.defaultInset),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        setStatusButton.addTarget(self, action: #selector(setStatusButtonPressed), for: .touchUpInside)
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "Введите текст"
    }
    
    @objc private func setStatusButtonPressed() {
        statusLabel.text = statusText
        print(statusLabel.text as Any)
    }
}

extension ProfileHeaderView {
    enum Metric {
        static let defaultFontSize: CGFloat = 14
        static let titleTextSize: CGFloat = 18
        static let defaultInset: CGFloat = 16
        static let avatarSize: CGFloat = 100
        static let cornerRadius: CGFloat = 12
    }
}
