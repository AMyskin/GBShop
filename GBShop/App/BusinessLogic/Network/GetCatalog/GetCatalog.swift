//
//  GetCatalog.swift
//  GBShop
//
//  Created by Alexander Myskin on 19.02.2021.
//

import Foundation
import Alamofire

class GetCatalog: AbstractRequestFactory {
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

extension GetCatalog: GetCatalogRequestFactory {
    func getCatalog(pageNumber: Int,
                    idCategory: Int,
                    completionHandler: @escaping (AFDataResponse<CatalogResult>) -> Void) {
        let requestModel = Catalor(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)
                                         
        self.request(request: requestModel, completionHandler: completionHandler)
    }
   
}

extension GetCatalog {
    struct Catalor: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getCatalog"
        
        let pageNumber: Int
        let idCategory: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": idCategory
            ]
        }
    }
}
