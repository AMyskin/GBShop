//
//  GoodsAssembly.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class GoodsAssembly {
    static func assembly() -> GoodsViewController {
        let viewController = GoodsViewController()
        let presenter = GoodsPresenter(viewController: viewController)
        let router = GoodsRouter(viewController: viewController)
        let worker = GoodsWorker()
        let interactor = GoodsInteractor(presenter: presenter, worker: worker)
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
