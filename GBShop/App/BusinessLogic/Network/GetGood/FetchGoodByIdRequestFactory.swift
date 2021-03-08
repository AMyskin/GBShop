//
//  FetchGoodByIdRequestFactory.swift
//  GBShop
//
//  Created by Alexander Myskin on 19.02.2021.
//

import Alamofire

protocol FetchGoodByIdRequestFactory {
    func fetchGoodById(idProduct: Int,
                      completionHandler: @escaping (AFDataResponse<GoodResult>) -> Void)
}
