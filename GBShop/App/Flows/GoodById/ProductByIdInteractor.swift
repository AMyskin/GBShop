//
//  ProductByIdInteractor.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ProductByIdBusinessLogic {

}



final class ProductByIdInteractor: ProductByIdBusinessLogic {
    var presenter: ProductByIdPresentationLogic
    var worker: ProductByIdWorkerLogic
    //var name: String = ""
    
    init(presenter: ProductByIdPresentationLogic, worker: ProductByIdWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: Do something
    

}
