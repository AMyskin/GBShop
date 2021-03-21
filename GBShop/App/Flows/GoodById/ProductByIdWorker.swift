//
//  ProductByIdWorker.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ProductByIdWorkerLogic {
    func doSomeWork()
}

class ProductByIdWorker: ProductByIdWorkerLogic {

    let requestFactory: RequestFactory?

    init(_ requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }

    func doSomeWork() {
    }
}
