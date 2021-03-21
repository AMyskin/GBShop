//
//  RegWorker.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RegWorkerLogic {
    func regUser(user: Reg.RegUser,
                   completion: @escaping (RegistrationResult) -> Void)
}

class RegWorker: RegWorkerLogic {

    let requestFactory = RequestFactory().makeRegistrationRequestFatory()

    func regUser(user: Reg.RegUser,
                   completion: @escaping (RegistrationResult) -> Void){
        requestFactory.registration(
            userId: 100,
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
                    let model = RegistrationResult(result: 0, userMessage: "")
                    completion(model)
                }
            }
        }
    }
}
