//
//  LogOutRouter.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LogOutRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}


final class LogOutRouter: NSObject, LogOutRoutingLogic {

    private weak var viewController: LogOutDisplayLogic?

    init(viewController: LogOutDisplayLogic) {
        self.viewController = viewController
    }


}
