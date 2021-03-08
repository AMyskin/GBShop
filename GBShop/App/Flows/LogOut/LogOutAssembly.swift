//
//  LogOutAssembly.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class LogOutAssembly {
    static func assembly() -> LogOutViewController {
        let viewController = LogOutViewController()
        let presenter = LogOutPresenter(viewController: viewController)
        let router = LogOutRouter(viewController: viewController)
        let worker = LogOutWorker()
        let interactor = LogOutInteractor(presenter: presenter, worker: worker)
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
