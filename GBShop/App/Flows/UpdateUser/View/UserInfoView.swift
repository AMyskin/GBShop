//
//  UserInfoView.swift
//  GBShop
//
//  Created by Alexander Myskin on 13.03.2021.
//

import UIKit

final class UserInfoView: UIView {

    // MARK: - Properties
    public var callbackMainButtonAction: (() -> Void)?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .black)
        label.text = "Информация"
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
        textField.textField.isSecureTextEntry = true
        return textField
    }()

    lazy var emailTextField: AppTextField = {
        let textField = AppTextField(title: "Почта")
        textField.textField.autocapitalizationType = .none
        return textField
    }()

    lazy var genderTextField: AppTextField = {
        let textField = AppTextField(title: "Пол")
        textField.textField.autocapitalizationType = .none
        return textField
    }()

    lazy var cardTextField: AppTextField = {
        let textField = AppTextField(title: "Карта")
        textField.textField.autocapitalizationType = .none
        return textField
    }()

    lazy var bioTextField: AppTextField = {
        let textField = AppTextField(title: "О себе")
        textField.textField.autocapitalizationType = .none
        return textField
    }()

    lazy var loginButton: AppButton = {
        let button = AppButton()
        button.setTitle("Обновить информацию", for: UIControl.State())
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()

    @objc func tappedButton() {
        callbackMainButtonAction?()
    }



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
        [titleLabel,
         userTextField,
         passwordTextField,
         emailTextField,
         genderTextField,
         cardTextField,
         bioTextField,
         loginButton,
         activityIndicationView]
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
            userTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
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

        let emailTextFieldConstraints = [
            emailTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 18),
            emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ]

        let genderTextFieldConstraints = [
            genderTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 18),
            genderTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            genderTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
            genderTextField.heightAnchor.constraint(equalToConstant: 50)
        ]

        let cardTextFieldConstraints = [
            cardTextField.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 18),
            cardTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cardTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
            cardTextField.heightAnchor.constraint(equalToConstant: 50)
        ]

        let bioTextFieldConstraints = [
            bioTextField.topAnchor.constraint(equalTo: cardTextField.bottomAnchor, constant: 18),
            bioTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bioTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
            bioTextField.heightAnchor.constraint(equalToConstant: 50)
        ]

        let loginButtonConstraints = [
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
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
         emailTextFieldConstraints,
         genderTextFieldConstraints,
         cardTextFieldConstraints,
         bioTextFieldConstraints,
         loginButtonConstraints,
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
