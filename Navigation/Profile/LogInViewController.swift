//
// Created by Denis Yūgen
//

import UIKit

class LogInViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private let logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()

    private let login: UITextField = {
        let login = UITextField()
        login.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        login.textColor = .black
        login.autocapitalizationType = .none
        login.placeholder = "Email or phone"
        login.setPadding(17)
        login.layer.cornerRadius = 10
        login.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        login.layer.borderWidth = 0.5
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.layer.backgroundColor = UIColor.systemGray6.cgColor
        login.translatesAutoresizingMaskIntoConstraints = false
        return login
    }()

    private let password: UITextField = {
        let password = UITextField()
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.textColor = .black
        password.autocapitalizationType = .none
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.setPadding(17)
        password.layer.cornerRadius = 10
        password.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        password.layer.borderWidth = 0.5
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.backgroundColor = UIColor.systemGray6.cgColor
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()

    private let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        loginButton.layer.masksToBounds = true
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()

    private let notification = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLayout()
        configureConstraints()
        loginButton.addTarget(self, action: #selector(pushProfileVC), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)

        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }

    private func configureLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logo)
        contentView.addSubview(login)
        contentView.addSubview(password)
        contentView.addSubview(loginButton)
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.widthAnchor.constraint(equalToConstant: 100),
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            login.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            login.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            login.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            login.heightAnchor.constraint(equalToConstant: 50),

            password.topAnchor.constraint(equalTo: login.bottomAnchor, constant: -0.5),
            password.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            password.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            password.heightAnchor.constraint(equalToConstant: 50),

            loginButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc private func pushProfileVC() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keybordSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }

    @objc private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}
