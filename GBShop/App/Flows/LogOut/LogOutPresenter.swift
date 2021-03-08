//
//  LogOutPresenter.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LogOutPresentationLogic {
    func presentSomething(response: LogOut.Something.Response)
}

class LogOutPresenter: LogOutPresentationLogic {
    private weak var viewController: LogOutDisplayLogic?

    init(viewController: LogOutDisplayLogic) {
        self.viewController = viewController
    }
    
    // MARK: Do something
    
    func presentSomething(response: LogOut.Something.Response) {
        let viewModel = LogOut.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
