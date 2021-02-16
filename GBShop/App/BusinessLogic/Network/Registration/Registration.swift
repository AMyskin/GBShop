//
//  Registration.swift
//  GBShop
//
//  Created by Alexander Myskin on 16.02.2021.
//

import Foundation
import Alamofire

class Registration: AbstractRequestFactory {
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

extension Registration: RegistrationRequestFactory {
    func registration(userId: Int,
                      userName: String,
                      password: String,
                      email: String,
                      gender: String,
                      creditCard: String,
                      bio: String,
                      completionHandler: @escaping (AFDataResponse<RegistrationResult>) -> Void) {
        let requestModel = Registeration(baseUrl: baseUrl,
                                         idUser: userId,
                                         login: userName,
                                         password: password,
                                         email: email,
                                         gender: gender,
                                         creditCard: creditCard,
                                         bio: bio
                                         )
        self.request(request: requestModel, completionHandler: completionHandler)
    }
   
}

extension Registration {
    struct Registeration: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
        
        let idUser: Int
        let login: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "id_user": idUser,
                "username": login,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}
