//
//  RegViewController.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol RegDisplayLogic: AnyObject {
    func displayUser()
    func displayError()
}

final class RegViewController: UIViewController, RegDisplayLogic {
    var interactor: RegBusinessLogic?
    var router: RegRoutingLogic?
    var regUser: Reg.RegUser?

    var contentView = RegistrationView()
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addTapGestureToHideKeyboard()
        setup()
    }

    
    // MARK: Setup
    
    private func setup() {
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Регистрация"
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges()
        contentView.callbackMainButtonAction = { [weak self] in
            let regUser = Reg.RegUser(
                idUser: 222,
                login: self?.contentView.userTextField.textField.text ?? "",
                password: self?.contentView.passwordTextField.textField.text ?? "",
                email: self?.contentView.emailTextField.textField.text ?? "",
                gender: self?.contentView.genderTextField.textField.text ?? "",
                creditCard: self?.contentView.cardTextField.textField.text ?? "",
                bio: self?.contentView.bioTextField.textField.text ?? "")
            self?.regUser = regUser
            self?.interactor?.registration(user: regUser)
        }
    }
    
    func displayUser() {
        let alert = UIAlertController(title: "Успех", message: "Регистрация успешна", preferredStyle: .alert)

        let ok = UIAlertAction(title: "OK", style: .default, handler: { [weak self] action in
            self?.router?.routeToUserInfo(params: self?.regUser )
        })
        alert.addAction(ok)
        DispatchQueue.main.async{ [weak self] in
            self?.present(alert, animated: true)
        }
    }

    func displayError() {
        let alert = UIAlertController(title: "Ошибка", message: "Ошибка регистрации/nпопробуйте позднее.", preferredStyle: .alert)

        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async{ [weak self] in
            self?.present(alert, animated: true)
        }
    }
}
