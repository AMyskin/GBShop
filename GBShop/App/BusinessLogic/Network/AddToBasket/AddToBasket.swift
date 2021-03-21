//
//  AddToBasket.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import Foundation
import Alamofire

class AddToBasket: AbstractRequestFactory {
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

extension AddToBasket: AddToBasketRequestFactory {

    func AddToBasket(idProduct: Int,
                     quantity: Int,
                     completionHandler: @escaping (AFDataResponse<BasketResult>) -> Void) {
        let requestModel = Basket(baseUrl: baseUrl, idProduct: idProduct, quantity: quantity)

        self.request(request: requestModel, completionHandler: completionHandler)
    }

}

extension AddToBasket {
    struct Basket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addToBasket"

        let idProduct: Int
        let quantity: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct,
                "quantity": quantity
            ]
        }
    }
}

