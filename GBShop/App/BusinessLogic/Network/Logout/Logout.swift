//
//  Logout.swift
//  GBShop
//
//  Created by Alexander Myskin on 16.02.2021.
//


import Foundation
import Alamofire

class Logout: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: AppApi.myURL.rawValue)!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Logout: LogoutRequestFactory {
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = Logout(baseUrl: baseUrl, idUser: userId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Logout {
    struct Logout: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        
        let idUser: Int
        var parameters: Parameters? {
            return [
                "id_user": idUser
            ]
        }
    }
}
