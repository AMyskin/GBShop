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
    func routeToGoodsInfo()
    func routeToReg()
}

final class LoginRouter:  LoginRoutingLogic {
    private weak var viewController: LoginViewController?

    private weak var requestFactory: RequestFactory?


    // MARK: - Init

    init(viewController: LoginViewController, requestFactory: RequestFactory) {
        self.viewController = viewController
        self.requestFactory = requestFactory
    }

    func routeToUserInfo() {
        let userAssembly = UserInfoAssembly.assembly(params: nil)
        self.viewController?.navigationController?.pushViewController(userAssembly, animated: true)
    }

    func routeToReg() {
        let userAssembly = RegAssembly.assembly()
        viewController?.navigationController?.pushViewController(userAssembly, animated: true)
    }

    func routeToGoodsInfo() {
        if let requestFactory = requestFactory {
            let goodsAssembly = GoodsAssembly.assembly(requestFactory)
            viewController?.navigationController?.pushViewController(goodsAssembly, animated: true)
        }
    }
}
