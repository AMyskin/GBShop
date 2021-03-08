//
//  RegRouter.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol RegRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}


final class RegRouter: NSObject, RegRoutingLogic {

    weak var viewController: RegDisplayLogic?

    init(viewController: RegDisplayLogic) {
        self.viewController = viewController
    }
}
