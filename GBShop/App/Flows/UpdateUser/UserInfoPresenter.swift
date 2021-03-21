//
//  UserInfoPresenter.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol UserInfoPresentationLogic {
    func presentUser()
    func presentError()
}

class UserInfoPresenter: UserInfoPresentationLogic {
    weak var viewController: UserInfoDisplayLogic?

    init(viewController: UserInfoDisplayLogic) {
        self.viewController = viewController
    }
    
    // MARK: UserInfoPresentationLogic

    func presentUser() {
        viewController?.displayUser()
    }

    func presentError() {
        viewController?.displayError()
    }
}
