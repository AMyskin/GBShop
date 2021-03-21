//
//  ProductByIdPresenter.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ProductByIdPresentationLogic {

}

class ProductByIdPresenter: ProductByIdPresentationLogic {
    weak var viewController: ProductByIdDisplayLogic?

    // MARK: - Init

    init(viewController: ProductByIdDisplayLogic) {
        self.viewController = viewController
    }
    
    // MARK: Do something

}
