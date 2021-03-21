//
//  GoodsInteractor.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GoodsBusinessLogic {
    func fetchCatalog()
}

protocol GoodsDataStore {
    //var name: String { get set }
}

final class GoodsInteractor: GoodsBusinessLogic, GoodsDataStore {
    var presenter: GoodsPresentationLogic
    var worker: GoodsWorkerLogic
    //var name: String = ""
    
    init(presenter: GoodsPresentationLogic, worker: GoodsWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: Do something
    
    func fetchCatalog() {

        worker.fetchCatalog(page: 1, idCategory: 1) { (response) in
            switch response.result{
            case 1:
                self.presenter.presentGoods(contents: response.contents)
            default:
                self.presenter.presentError()
            }
        }

    }
}
