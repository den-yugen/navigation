//
// Created by Denis Yūgen
//

import UIKit

class ProfileHeaderView: UIView {
    private let avatar              = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    private let name                = UILabel()
    private let status              = UILabel()
    private let statusText          = UITextField()
    private let setStatusButton     = AppButton(backgroundColor: .systemCyan, title: "Установить статус")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAvatar()
        configureName()
        configureStatus()
        configureStatusText()
        configureSetStatusButon()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureAvatar() {
        addSubview(avatar)

        avatar.image                = UIImage(named: "avatar")
        avatar.layer.borderWidth    = 3
        avatar.layer.masksToBounds  = false
        avatar.clipsToBounds        = true
        avatar.layer.borderColor    = UIColor.white.cgColor
        avatar.layer.cornerRadius   = avatar.frame.height / 2
    }

    private func configureName() {
        addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false

        name.text       = "Доктор Ливси"
        name.font       = UIFont.systemFont(ofSize: 18, weight: .bold)
        name.textColor  = .black

        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 11),
            name.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16)
        ])
    }

    private func configureStatus() {
        addSubview(status)
        status.translatesAutoresizingMaskIntoConstraints = false

        status.text         = "Текущий статус..."
        status.font         = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textColor    = .systemGray

        NSLayoutConstraint.activate([
            status.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16),
            status.bottomAnchor.constraint(equalTo: avatar.bottomAnchor, constant: -18)
        ])
    }

    private func configureStatusText() {
        addSubview(statusText)
        statusText.translatesAutoresizingMaskIntoConstraints = false

        statusText.layer.cornerRadius   = 12
        statusText.layer.borderWidth    = 1
        statusText.layer.borderColor    = UIColor.black.cgColor

        statusText.font             = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusText.textColor        = .black
        statusText.backgroundColor  = .white
        statusText.textAlignment    = .center
        statusText.placeholder      = "Введите текст"

        NSLayoutConstraint.activate([
            statusText.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 6),
            statusText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 116),
            statusText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            statusText.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func configureSetStatusButon() {
        addSubview(setStatusButton)
        
        setStatusButton.layer.shadowColor   = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset  = CGSize(width: 4, height: 5)
        setStatusButton.layer.shadowRadius  = 4
        setStatusButton.layer.shadowOpacity = 0.7

        setStatusButton.addTarget(self, action: #selector(setStatusButtonPressed), for: .touchUpInside)

        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 40),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func setStatusButtonPressed() {
        print(status)
    }
}
