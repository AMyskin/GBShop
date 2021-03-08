//
//  PayBasketRequestFactory.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import Alamofire

protocol PayBasketRequestFactory {
    func payBasket(idBasket: Int,
                   completionHandler: @escaping (AFDataResponse<GetBasketResult>) -> Void)
}

