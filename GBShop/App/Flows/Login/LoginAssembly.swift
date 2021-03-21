//
//  LoginAssembly.swift
//  GBShop
//
//  Created by Alexander Myskin on 11.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class LoginAssembly {
    static func assembly(_ requestFactory : RequestFactory) -> LoginViewController {
        let viewController = LoginViewController()
        let presenter = LoginPresenter(viewController: viewController)
        let router = LoginRouter(viewController: viewController, requestFactory: requestFactory)
        let worker = LoginWorker(requestFactory)
        let interactor = LoginInteractor(presenter: presenter, worker: worker)
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
