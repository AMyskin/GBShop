//
//  UserInfoWorker.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class UserInfoWorker {
    let requestFactory = RequestFactory().makeChangeUserRequestFactory()

    func updateUserInfo(user: UserInfo.User,
                   completion: @escaping (ChangeUserResult) -> Void){
        requestFactory.changeUserData(
            userId: user.idUser,
            userName: user.login,
            password: user.password,
            email: user.email,
            gender: user.gender,
            creditCard: user.creditCard,
            bio: user.bio
        )
        { (response) in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let model):
                    completion(model)
                case .failure:
                    let model = ChangeUserResult(result: 0)
                    completion(model)
                }
            }
        }
    }
}
