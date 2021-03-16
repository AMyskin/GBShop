//
//  RemoveFromBasket.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//


import Foundation
import Alamofire

class RemoveFromBasket: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: AppApi.myHerokuURL.rawValue)!

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue

    }
}

extension RemoveFromBasket: RemoveFromBasketRequestFactory {

    func RemoveFromBasket(idProduct: Int,
                     completionHandler: @escaping (AFDataResponse<BasketResult>) -> Void) {
        let requestModel = Basket(baseUrl: baseUrl, idProduct: idProduct)

        self.request(request: requestModel, completionHandler: completionHandler)
    }

}

extension RemoveFromBasket {
    struct Basket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "deleteFromBasket"

        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct,
            ]
        }
    }
}

