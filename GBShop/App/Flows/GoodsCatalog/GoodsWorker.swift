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
    func fetchProduct(id: Int,
                   completion: @escaping (GoodResult) -> Void)
}

class GoodsWorker: GoodsWorkerLogic {

    let requestFactory: RequestFactory?

    init(_ requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }

    func fetchCatalog(page: Int, idCategory: Int,
                   completion: @escaping (CatalogResult) -> Void){
        let makeFetchCatalogFactory = requestFactory?.makeFetchCatalogFactory()
        makeFetchCatalogFactory?.getCatalog(pageNumber: page, idCategory: idCategory) { (response) in
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

    func fetchProduct(id: Int,
                   completion: @escaping (GoodResult) -> Void){
        let makeFetchCatalogFactory = requestFactory?.makeFetchGoodFactory()
        makeFetchCatalogFactory?.fetchGoodById(idProduct: id) { (response) in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let model):
                    completion(model)
                case .failure:
                    let model = GoodResult(result: 0, productName: "", productPrice: 0, productDescription: "")
                    completion(model)
                }
            }
        }
    }
}
