//
//  GetUserBasket.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import Foundation
import Alamofire

class GetUserBasket: AbstractRequestFactory {
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

extension GetUserBasket: GetUserBasketRequestFactory {

    func getBasket(idUser: Int,
                     completionHandler: @escaping (AFDataResponse<GetBasketResult>) -> Void) {
        let requestModel = Basket(baseUrl: baseUrl, idUser: idUser)

        self.request(request: requestModel, completionHandler: completionHandler)
    }

}

extension GetUserBasket {
    struct Basket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getBasket"

        let idUser: Int
        var parameters: Parameters? {
            return [
                "id_user": idUser
            ]
        }
    }
}
