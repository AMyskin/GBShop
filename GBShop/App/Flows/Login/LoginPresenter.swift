//
//  LoginPresenter.swift
//  GBShop
//
//  Created by Alexander Myskin on 11.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {
    func presentUser(user: User)
    func presentError()
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?

    // MARK: - Init

    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    
    // MARK: LoginPresentationLogic

    func presentUser(user: User) {
        let viewModel = Login.ViewModel(user: user)
        viewController?.displayUser(viewModel: viewModel)
    }

    func presentError() {
        viewController?.displayError()
    }
}
