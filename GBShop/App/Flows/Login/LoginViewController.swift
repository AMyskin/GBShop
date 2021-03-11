//
//  LoginViewController.swift
//  GBShop
//
//  Created by Alexander Myskin on 11.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol LoginDisplayLogic: AnyObject {
    func displayUser(viewModel: Login.ViewModel)
    func displayError()
}

final class LoginViewController: UIViewController, LoginDisplayLogic {
    var interactor: LoginBusinessLogic?
    var router: LoginRoutingLogic?

    var contentView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        view.addTapGestureToHideKeyboard()

    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    private func setupUI() {
        setupWhiteView()
        setupMainView()
    }

    private func setupWhiteView() {
        view.backgroundColor = .white
    }


    private func setupMainView() {
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges()
        contentView.callbackMainButtonAction = { [weak self] in
            if let login = self?.contentView.emailTextField.textField.text,
               let password = self?.contentView.passwordTextField.textField.text {
                self?.interactor?.fetchUser(login: login, password: password)
            }
        }

        contentView.callbackRegButtonAction = { [weak self] in
            self?.router?.routeToReg()
        }
    }

    func displayUser(viewModel: Login.ViewModel) {
        router?.routeToUserInfo()
    }

    func displayError() {
        let alert = UIAlertController(title: "Ошибка", message: "Пользователь не найден\nили пароль не верен. \n Пароль \"password\"", preferredStyle: .alert)

        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}
