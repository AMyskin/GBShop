//
//  LogoutRequestFactory.swift
//  GBShop
//
//  Created by Alexander Myskin on 16.02.2021.
//

import Alamofire

protocol LogoutRequestFactory {
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
