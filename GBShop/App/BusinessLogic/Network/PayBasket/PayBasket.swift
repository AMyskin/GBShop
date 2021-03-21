//
//  PayBasket.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import Foundation
import Alamofire

class PayBasket: AbstractRequestFactory {
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

extension PayBasket: PayBasketRequestFactory {

    func payBasket(idBasket: Int,
                     completionHandler: @escaping (AFDataResponse<GetBasketResult>) -> Void) {
        let requestModel = Basket(baseUrl: baseUrl, idBasket: idBasket)

        self.request(request: requestModel, completionHandler: completionHandler)
    }

}

extension PayBasket {
    struct Basket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "payBasket"

        let idBasket: Int
        var parameters: Parameters? {
            return [
                "id_basket": idBasket
            ]
        }
    }
}
