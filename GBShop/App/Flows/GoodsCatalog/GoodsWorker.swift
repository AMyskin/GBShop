//
//  GoodsWorker.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GoodsWorkerLogic {
    func fetchCatalog(page: Int, idCategory: Int,
                      completion: @escaping (CatalogResult) -> Void)
}

class GoodsWorker: GoodsWorkerLogic {
    let requestFactory = RequestFactory().makeFetchCatalogFactory()

    func fetchCatalog(page: Int, idCategory: Int,
                   completion: @escaping (CatalogResult) -> Void){
        requestFactory.getCatalog(pageNumber: page, idCategory: idCategory) { (response) in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let model):
                    completion(model)
                case .failure:
                    let model = CatalogResult(result: 0, page_number: nil, contents: nil, error_message: "Error")
                    completion(model)
                }
            }
        }
    }
}
