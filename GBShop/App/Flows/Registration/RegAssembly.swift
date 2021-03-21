//
//  RegAssembly.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class RegAssembly {
    static func assembly() -> RegViewController {
        let viewController = RegViewController()
        let presenter = RegPresenter(viewController: viewController)
        let router = RegRouter(viewController: viewController)
        let worker = RegWorker()
        let interactor = RegInteractor(presenter: presenter, worker: worker)
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
