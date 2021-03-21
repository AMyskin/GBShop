//
//  RegRouter.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RegRoutingLogic {
    func routeToUserInfo(params: Reg.RegUser?)
}


final class RegRouter: RegRoutingLogic {

    weak var viewController: RegViewController?

    init(viewController: RegViewController) {
        self.viewController = viewController
    }

    func routeToUserInfo(params: Reg.RegUser?) {
        let userAssembly = UserInfoAssembly.assembly(params: params)
        self.viewController?.navigationController?.pushViewController(userAssembly, animated: true)
    }
}
