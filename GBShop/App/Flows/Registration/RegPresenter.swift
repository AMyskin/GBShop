//
//  RegPresenter.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RegPresentationLogic {
    func presentSomething(response: Reg.Something.Response)
}

class RegPresenter: RegPresentationLogic {
    weak var viewController: RegDisplayLogic?

    init(viewController: RegDisplayLogic) {
        self.viewController = viewController
    }
    
    // MARK: Do something
    
    func presentSomething(response: Reg.Something.Response) {
        let viewModel = Reg.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
