//
//  LoginRouter.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import UIKit

final class LoginRouter {
    private weak var viewController: LoginViewController?

    init(viewController: LoginViewController) {
        self.viewController = viewController
    }

    func routeToUserInfo() {
        let worker = LoginWorker()
        guard let userName = viewController?.contentView.emailTextField.textField.text,
              let password = viewController?.contentView.passwordTextField.textField.text else {return}
        worker.fetchUser(userName: userName, password: password) { (result) in
            print(result)
            DispatchQueue.main.async {
                let userAssembly = UserInfoAssembly.assembly()
                self.viewController?.navigationController?.pushViewController(userAssembly, animated: true)

            }
        }


    }

    func routeToReg() {
        let userAssembly = RegAssembly.assembly()
        viewController?.navigationController?.pushViewController(userAssembly, animated: true)
    }


}
