//
//  UserInfoRouter.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol UserInfoRoutingLogic {

}


final class UserInfoRouter: NSObject, UserInfoRoutingLogic {

    weak var viewController: UserInfoDisplayLogic?

    init(viewController: UserInfoDisplayLogic) {
        self.viewController = viewController
    }
}
