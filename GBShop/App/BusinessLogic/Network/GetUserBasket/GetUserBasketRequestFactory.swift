//
//  GetUserBasketRequestFactory.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import Alamofire

protocol GetUserBasketRequestFactory {
    func getBasket(idUser: Int,
                   completionHandler: @escaping (AFDataResponse<GetBasketResult>) -> Void)
}
