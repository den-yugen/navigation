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

    private let formStack: UIStackView = {
        let formStack = UIStackView()
        formStack.axis = .vertical
        formStack.distribution = .fillProportionally
        formStack.layer.cornerRadius = 10
        formStack.layer.borderWidth = 0.5
        formStack.layer.borderColor = UIColor.systemGray.cgColor
        formStack.layer.backgroundColor = UIColor.systemGray6.cgColor
        formStack.translatesAutoresizingMaskIntoConstraints = false
        return formStack
    }()

    private let login: UITextField = {
        let login = UITextField()
        login.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        login.textColor = .black
        login.autocapitalizationType = .none
        login.placeholder = "Email or phone"
        login.setPadding(17)
        login.translatesAutoresizingMaskIntoConstraints = false
        return login
    }()

    private let divider: UIView = {
        let divider = UIView()
        divider.backgroundColor = .systemGray

        return divider
    }()

    private let password: UITextField = {
        let password = UITextField()
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.textColor = .black
        password.autocapitalizationType = .none
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.setPadding(17)
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()

    private var loginButton: UIButton = {
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

    private func configureLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logo)
        contentView.addSubview(formStack)
        formStack.addArrangedSubview(login)
        formStack.addArrangedSubview(divider)
        formStack.addArrangedSubview(password)
        contentView.addSubview(loginButton)
    }

    private func configureConstraints() {
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
            formStack.heightAnchor.constraint(equalToConstant: 100),

            login.topAnchor.constraint(equalTo: formStack.topAnchor),
            login.leadingAnchor.constraint(equalTo: formStack.leadingAnchor),
            login.trailingAnchor.constraint(equalTo: formStack.trailingAnchor),

            divider.topAnchor.constraint(equalTo: login.bottomAnchor),
            divider.leadingAnchor.constraint(equalTo: formStack.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: formStack.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 0.5),

            password.topAnchor.constraint(equalTo: divider.bottomAnchor),
            password.leadingAnchor.constraint(equalTo: formStack.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: formStack.trailingAnchor),

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

    @objc private func pushProfileVC() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
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
