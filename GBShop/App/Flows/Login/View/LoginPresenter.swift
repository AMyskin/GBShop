//
//  LoginPresenter.swift
//  GBShop
//
//  Created by Alexander Myskin on 11.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {
    func presentGoods()
    func presentError()
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?

    // MARK: - Init

    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    
    // MARK: LoginPresentationLogic

    func presentGoods() {
        viewController?.displayGoods()
    }

    func presentError() {
        viewController?.displayError()
    }
}
