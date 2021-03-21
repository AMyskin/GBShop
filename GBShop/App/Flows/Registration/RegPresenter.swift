//
//  RegPresenter.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RegPresentationLogic {
    func presentUser()
    func presentError()
}

class RegPresenter: RegPresentationLogic {
    weak var viewController: RegDisplayLogic?

    init(viewController: RegDisplayLogic) {
        self.viewController = viewController
    }
    
    // MARK: LoginPresentationLogic

    func presentUser() {
        viewController?.displayUser()
    }

    func presentError() {
        viewController?.displayError()
    }
}
