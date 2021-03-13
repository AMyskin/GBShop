//
//  RegRouter.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol RegRoutingLogic {
    func routeToUserInfo()
}


final class RegRouter: NSObject, RegRoutingLogic {

    weak var viewController: RegViewController?

    init(viewController: RegViewController) {
        self.viewController = viewController
    }

    func routeToUserInfo() {
        let userAssembly = UserInfoAssembly.assembly()
        self.viewController?.navigationController?.pushViewController(userAssembly, animated: true)
    }
}
