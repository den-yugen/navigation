//
// Created by Denis Yūgen
//

import UIKit

protocol ProfileHeaderViewDelegate: AnyObject {
    func avatarTap(_ image: UIImage?, imageFrame: CGRect)
}

final class ProfileHeaderView: UIView, UITextFieldDelegate {

    weak var delegate: ProfileHeaderViewDelegate?

    let avatarImageView: UIImageView = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "avatar")
        avatar.frame.size.width = Metric.avatarSize
        avatar.frame.size.height = Metric.avatarSize
        avatar.layer.borderWidth = 3
        avatar.layer.masksToBounds = false
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = avatar.frame.width / 2
        avatar.clipsToBounds = true
        avatar.isUserInteractionEnabled = true
        avatar.disableAutoresizingMask()
        return avatar
    }()

    private let fullNameLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: Metric.titleTextSize, weight: .bold)
        name.textColor = .black
        name.text = "Доктор Ливси"
        name.numberOfLines = 0
        name.disableAutoresizingMask()
        return name
    }()

    private var statusText = String()

    private let statusLabel: UILabel = {
        let status = UILabel()
        status.font = UIFont.systemFont(ofSize: Metric.defaultTextSize, weight: .regular)
        status.textColor = .systemGray
        status.text = "Текущий статус"
        status.disableAutoresizingMask()
        return status
    }()

    private lazy var statusTextField: UITextField = {
        let newStatus = UITextField()
        newStatus.font = UIFont.systemFont(ofSize: Metric.defaultTextSize, weight: .regular)
        newStatus.textColor = .black
        newStatus.backgroundColor = .white
        newStatus.placeholder = "Введите текст"
        newStatus.setPadding(10)
        newStatus.layer.cornerRadius = Metric.cornerRadius
        newStatus.layer.borderWidth = 1
        newStatus.layer.borderColor = UIColor.black.cgColor
        newStatus.delegate = self
        newStatus.disableAutoresizingMask()
        newStatus.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return newStatus
    }()

    private lazy var setStatusButton: UIButton = {
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
        button.disableAutoresizingMask()
        button.addTarget(self, action: #selector(setStatusButtonPressed), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        addGesture()
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        avatarImageView.addGestureRecognizer(tapGesture)
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
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    
    @objc private func setStatusButtonPressed() {
        if statusText.isEmpty {
            statusLabel.text = "Введите текст"
            statusLabel.textColor = .red
            statusTextField.backgroundColor = UIColor(named: "ErrorBackground")
        } else {
            statusLabel.text = statusText
            statusLabel.textColor = .systemGray
            statusTextField.backgroundColor = .white
        }
        print(statusLabel.text as Any)
    }

    @objc private func tapAction() {
        delegate?.avatarTap(avatarImageView.image, imageFrame: avatarImageView.frame)
    }
}

extension ProfileHeaderView {
    enum Metric {
        static let defaultTextSize: CGFloat = 14
        static let titleTextSize: CGFloat = 18
        static let defaultInset: CGFloat = 16
        static let avatarSize: CGFloat = 100
        static let cornerRadius: CGFloat = 12
    }
}
