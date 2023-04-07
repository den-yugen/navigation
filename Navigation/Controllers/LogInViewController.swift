//
// Created by Denis Yūgen
//

import UIKit

final class LogInViewController: UIViewController {

// MARK: - Properties

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.disableAutoresizingMask()
        return scrollView
    }()

    private let contentView: UIView = {
        let contentView = UIView()
        contentView.disableAutoresizingMask()
        return contentView
    }()

    private let logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.disableAutoresizingMask()
        return logo
    }()

    private let formStack: UIStackView = {
        let formStack = UIStackView()
        formStack.axis = .vertical
        formStack.layer.cornerRadius = 10
        formStack.layer.borderWidth = 0.5
        formStack.layer.masksToBounds = true
        formStack.spacing = -0.5
        formStack.layer.borderColor = UIColor.systemGray.cgColor
        formStack.layer.backgroundColor = UIColor.systemGray6.cgColor
        formStack.disableAutoresizingMask()
        return formStack
    }()

    private lazy var login: UITextField = {
        let login = UITextField()
        login.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        login.textColor = .black
        login.autocapitalizationType = .none
        login.layer.borderWidth = 0.5
        login.placeholder = "Наберите \"login\""
        login.setPadding(17)
        login.disableAutoresizingMask()
        return login
    }()

    private let defaultLogin = "login"

    private let password: UITextField = {
        let password = UITextField()
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.textColor = .black
        password.autocapitalizationType = .none
        password.layer.borderWidth = 0.5
        password.placeholder = "Наберите \"password\""
        password.isSecureTextEntry = true
        password.setPadding(17)
        password.disableAutoresizingMask()
        return password
    }()

    private let defaultPassword = "password"

    private let errorText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .red
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        loginButton.layer.masksToBounds = true
        loginButton.disableAutoresizingMask()
        loginButton.addTarget(self, action: #selector(pushProfileVC), for: .touchUpInside)
        return loginButton
    }()

    private let notification = NotificationCenter.default

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        scrollToBottom(animated: true)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        scrollToBottom(animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }

    // MARK: - Private functions

    private func configureLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logo)
        contentView.addSubview(formStack)
        formStack.addArrangedSubview(login)
        formStack.addArrangedSubview(password)
        contentView.addSubview(errorText)
        contentView.addSubview(loginButton)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
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

            formStack.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            formStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            formStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            login.heightAnchor.constraint(equalToConstant: 50),
            password.heightAnchor.constraint(equalToConstant: 50),

            errorText.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 90),
            errorText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            loginButton.topAnchor.constraint(equalTo: formStack.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    private func scrollToBottom(animated: Bool) {
        if UIDevice.current.orientation.isLandscape {
            let bottomOffsetY = CGPointMake(0, max(scrollView.contentSize.height - scrollView.bounds.size.height + scrollView.contentInset.bottom, 200))
            scrollView.setContentOffset(bottomOffsetY, animated: true)
        }
    }

    private func showAlert(message: String) {
        let errorAlert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        errorAlert.addAction(dismissAction)
        present(errorAlert, animated: true)
    }

    // MARK: - Actions

    @objc private func pushProfileVC() {
        let profileVC = ProfileViewController()
        if login.text!.isEmpty {
            login.layer.backgroundColor = UIColor(named: "ErrorBackground")?.cgColor
            errorText.isHidden = false
            errorText.text = "Введите логин"
        } else if password.text!.isEmpty {
            password.layer.backgroundColor = UIColor(named: "ErrorBackground")?.cgColor
            errorText.isHidden = false
            errorText.text = "Введите пароль"
        } else if password.text!.count < 6 {
            errorText.isHidden = false
            errorText.text = "Пароль не может быть короче 6 символов"
        } else if login.text != defaultLogin {
            showAlert(message: "Неверный логин")
        } else if password.text != defaultPassword {
            showAlert(message: "Неверный пароль")
        } else {
            navigationController?.pushViewController(profileVC, animated: true)
        }
            CGPointMake(self.loginButton.frame.origin.x,
                        self.loginButton.frame.origin.y - self.scrollView.contentOffset.y)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keybordSize.height + 30
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }

    @objc private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}
