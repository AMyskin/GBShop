//
//  RemoveFromBasketRequestFactory.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import Alamofire

protocol RemoveFromBasketRequestFactory {
    func RemoveFromBasket(idProduct: Int,
                     completionHandler: @escaping (AFDataResponse<BasketResult>) -> Void)
}
