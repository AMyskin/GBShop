//
//  UserInfoAssembly.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class UserInfoAssembly {
    static func assembly() -> UserInfoViewController {
        let viewController = UserInfoViewController()
        let presenter = UserInfoPresenter(viewController: viewController)
        let router = UserInfoRouter(viewController: viewController)
        let worker = UserInfoWorker()
        let interactor = UserInfoInteractor(presenter: presenter, worker: worker)
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
