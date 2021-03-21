//
//  FetchGoodById.swift
//  GBShop
//
//  Created by Alexander Myskin on 19.02.2021.
//

import Foundation
import Alamofire

class FetchGoodById: AbstractRequestFactory {
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

extension FetchGoodById: FetchGoodByIdRequestFactory {
    func fetchGoodById(idProduct: Int,
                       completionHandler: @escaping (AFDataResponse<GoodResult>) -> Void) {
        let requestModel = Good(baseUrl: baseUrl, idProduct: idProduct)
        
        self.request(request: requestModel, completionHandler: completionHandler)
    }
   
}

extension FetchGoodById {
    struct Good: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getGoodById"
        
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
}

