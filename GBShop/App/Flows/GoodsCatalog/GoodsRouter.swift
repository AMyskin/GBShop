//
//  GoodsRouter.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
protocol GoodsRoutingLogic {
    func routeToProduct(_ product: GoodResult)
}

protocol GoodsDataPassing {
    var dataStore: GoodsDataStore? { get }
}

final class GoodsRouter: GoodsRoutingLogic, GoodsDataPassing {
    private weak var  viewController: GoodsViewController?
    private weak var requestFactory: RequestFactory?


    // MARK: - Init

    init(viewController: GoodsViewController, requestFactory: RequestFactory) {
        self.viewController = viewController
        self.requestFactory = requestFactory
    }
    var dataStore: GoodsDataStore?

    // MARK: Routing

    func routeToProduct(_ product: GoodResult) {
        if let requestFactory = requestFactory {
            let productAssembly = ProductByIdAssembly.assembly(requestFactory , product)
            viewController?.navigationController?.pushViewController(productAssembly, animated: true)
        }
    }

}
