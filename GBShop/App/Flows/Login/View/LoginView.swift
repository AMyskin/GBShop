//
//  LoginView.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import UIKit

final class LoginView: UIView {

    // MARK: - Properties
    public var callbackMainButtonAction: (() -> Void)?
    public var callbackRegButtonAction: (() -> Void)?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .black)
        label.text = "Войдите в свой аккаунт"
        label.textAlignment = .center
        label.textColor = .headerTextColor
        return label
    }()

    lazy var userTextField: AppTextField = {
        let textField = AppTextField(title: "Имя пользователя")
        textField.textField.autocapitalizationType = .none
        return textField
    }()

    lazy var passwordTextField: AppTextField = {
        let textField = AppTextField(title: "Пароль")
        textField.textField.text = "password"
        textField.textField.isSecureTextEntry = true
        return textField
    }()

    lazy var loginButton: AppButton = {
        let button = AppButton()
        button.setTitle("Вход", for: UIControl.State())
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()

    lazy var registrationButton: AppButton = {
        let button = AppButton()
        button.setTitle("Регистрация", for: UIControl.State())
        button.addTarget(self, action: #selector(tappedButtonReg), for: .touchUpInside)
        return button
    }()

    @objc func tappedButton() {
        callbackMainButtonAction?()
    }
    @objc func tappedButtonReg() {
        callbackRegButtonAction?()
    }

    lazy var passwordlLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .ultraLight)
        label.numberOfLines = 0
        label.text = "Пароль Password"
        label.textAlignment = .center
        label.textColor = .mainTextColor
        return label
    }()


    lazy var activityIndicationView: UIActivityIndicatorView = {
        let activityIndicationView = UIActivityIndicatorView(style: .medium)
        activityIndicationView.color = .white
        activityIndicationView.backgroundColor = .darkGray
        activityIndicationView.layer.cornerRadius = 5.0
        activityIndicationView.hidesWhenStopped = true
        return activityIndicationView
    }()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        [titleLabel, userTextField, passwordTextField, passwordlLabel, loginButton, registrationButton, activityIndicationView]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }

    private func setUpConstraints() {
        let titleLabelConstraints = [
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            titleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40)
        ]

        let userTextFieldConstraints = [
            userTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            userTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
            userTextField.heightAnchor.constraint(equalToConstant: 50)
        ]

        let passwordTextFieldConstraints = [
            passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 18),
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ]

        let passwordlLabelConstraints = [
            passwordlLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
            passwordlLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordlLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
            passwordlLabel.heightAnchor.constraint(equalToConstant: 41)
        ]

        let loginButtonConstraints = [
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
        ]

        let registrationButtonConstraints = [
            registrationButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            registrationButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            registrationButton.heightAnchor.constraint(equalToConstant: 50),
            registrationButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -16),
        ]


        let activityIndicatorViewConstraints = [
            activityIndicationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicationView.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicationView.heightAnchor.constraint(equalToConstant: 50),
            activityIndicationView.widthAnchor.constraint(equalToConstant: 50.0)
        ]

        [titleLabelConstraints,
         userTextFieldConstraints,
         passwordTextFieldConstraints,
         passwordlLabelConstraints,
         loginButtonConstraints,
         registrationButtonConstraints,
         activityIndicatorViewConstraints]
            .forEach(NSLayoutConstraint.activate(_:))
    }

    func startLoading() {
        activityIndicationView.isHidden = false
        activityIndicationView.startAnimating()
    }

    func finishLoading() {
        activityIndicationView.stopAnimating()
    }
}

