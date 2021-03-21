//
//  GetCatalogRequestFactory.swift
//  GBShop
//
//  Created by Alexander Myskin on 19.02.2021.
//

import Alamofire

protocol GetCatalogRequestFactory {
    func getCatalog(pageNumber: Int,
                      idCategory: Int,
                      completionHandler: @escaping (AFDataResponse<CatalogResult>) -> Void)
}
