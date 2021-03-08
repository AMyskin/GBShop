//
//  UserInfoPresenter.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol UserInfoPresentationLogic {
    func presentSomething(response: UserInfo.Something.Response)
}

class UserInfoPresenter: UserInfoPresentationLogic {
    weak var viewController: UserInfoDisplayLogic?

    init(viewController: UserInfoDisplayLogic) {
        self.viewController = viewController
    }
    
    // MARK: Do something
    
    func presentSomething(response: UserInfo.Something.Response) {
        let viewModel = UserInfo.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
