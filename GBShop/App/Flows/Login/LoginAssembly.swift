//
//  LoginAssembly.swift
//  GBShop
//
//  Created by Alexander Myskin on 11.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class LoginAssembly {
    static func assembly() -> LoginViewController {
        let viewController = LoginViewController()
        let presenter = LoginPresenter(viewController: viewController)
        let router = LoginRouter(viewController: viewController)
        let worker = LoginWorker()
        let interactor = LoginInteractor(presenter: presenter, worker: worker)
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
