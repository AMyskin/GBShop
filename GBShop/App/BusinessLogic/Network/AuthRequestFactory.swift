//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Alexander Myskin on 13.02.2021.
//

import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
