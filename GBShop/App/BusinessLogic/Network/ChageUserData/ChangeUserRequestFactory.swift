//
//  ChangeUserRequestFactory.swift
//  GBShop
//
//  Created by Alexander Myskin on 16.02.2021.
//

import Alamofire

protocol ChangeUserRequestFactory {
    func changeUserData(userId: Int,
                      userName: String,
                      password: String,
                      email: String,
                      gender: String,
                      creditCard: String,
                      bio: String,
                      completionHandler: @escaping (AFDataResponse<ChangeUserResult>) -> Void)
}
