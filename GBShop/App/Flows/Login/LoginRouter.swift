//
//  LoginRouter.swift
//  GBShop
//
//  Created by Alexander Myskin on 11.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginRoutingLogic {
    func routeToUserInfo()
    func routeToReg()
}

final class LoginRouter:  LoginRoutingLogic {
    weak var viewController: LoginViewController?

    // MARK: - Init

    init(viewController: LoginViewController) {
        self.viewController = viewController
    }

    func routeToUserInfo() {
        let userAssembly = UserInfoAssembly.assembly(params: nil)
        self.viewController?.navigationController?.pushViewController(userAssembly, animated: true)
    }

    func routeToReg() {
        let userAssembly = RegAssembly.assembly()
        viewController?.navigationController?.pushViewController(userAssembly, animated: true)
    }
}
