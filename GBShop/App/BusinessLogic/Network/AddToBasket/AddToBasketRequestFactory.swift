//
//  AddToBasketRequestFactory.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import Alamofire

protocol AddToBasketRequestFactory {
    func AddToBasket(idProduct: Int,
                     quantity: Int,
                     completionHandler: @escaping (AFDataResponse<BasketResult>) -> Void)
}
