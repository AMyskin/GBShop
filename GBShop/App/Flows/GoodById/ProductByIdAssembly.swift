//
//  ProductByIdAssembly.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ProductByIdAssembly {
    static func assembly(_ requestFactory : RequestFactory, _ product: GoodResult) -> ProductByIdViewController {
        let viewController = ProductByIdViewController(product: product)
        let presenter = ProductByIdPresenter(viewController: viewController)
        let router = ProductByIdRouter(viewController: viewController)
        let worker = ProductByIdWorker(requestFactory)
        let interactor = ProductByIdInteractor(presenter: presenter, worker: worker)
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
