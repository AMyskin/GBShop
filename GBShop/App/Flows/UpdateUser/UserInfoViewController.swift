//
//  UserInfoViewController.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol UserInfoDisplayLogic: AnyObject {
    func displayUser()
    func displayError()
}

final class UserInfoViewController: UIViewController, UserInfoDisplayLogic {
    var interactor: UserInfoBusinessLogic?
    var router: (NSObjectProtocol & UserInfoRoutingLogic )?
    var params: Reg.RegUser?

    var contentView = UserInfoView()

    // MARK: View lifecycle

    init(params: Reg.RegUser?) {
        super.init(nibName: nil, bundle: nil)
        self.params = params
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.fetchData()
    }

    // MARK: Setup

    private func setup() {
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Информация"
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges()
        contentView.callbackMainButtonAction = { [weak self] in
            let user = UserInfo.User(
                idUser: 123,
                login: self?.contentView.userTextField.textField.text ?? "",
                password: self?.contentView.passwordTextField.textField.text ?? "",
                email: self?.contentView.emailTextField.textField.text ?? "",
                gender: self?.contentView.genderTextField.textField.text ?? "",
                creditCard: self?.contentView.cardTextField.textField.text ?? "",
                bio: self?.contentView.bioTextField.textField.text ?? "")
           self?.interactor?.updateUser(user: user)
        }

    }

    // MARK: fetchData
    private func fetchData() {
        contentView.userTextField.textField.text = params?.login
        contentView.passwordTextField.textField.text = params?.password
        contentView.emailTextField.textField.text = params?.email
        contentView.genderTextField.textField.text = params?.gender
        contentView.cardTextField.textField.text = params?.creditCard
        contentView.bioTextField.textField.text = params?.bio
    }

    func displayUser() {
        let alert = UIAlertController(title: "Успешно", message: "Обновление успешно", preferredStyle: .alert)

        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }

    func displayError() {
        let alert = UIAlertController(title: "Ошибка", message: "Ошибка обновления", preferredStyle: .alert)

        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}
