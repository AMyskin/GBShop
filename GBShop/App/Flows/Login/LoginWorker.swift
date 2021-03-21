//
//  LoginWorker.swift
//  GBShop
//
//  Created by Alexander Myskin on 11.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginWorkerLogic {
    func fetchUser(userName: String, password: String,
                   completion: @escaping (LoginResult) -> Void)
}

class LoginWorker: LoginWorkerLogic {

    let requestFactory: RequestFactory?

    init(_ requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }

    func fetchUser(userName: String, password: String,
                   completion: @escaping (LoginResult) -> Void){
        let makeAuthRequestFatory = requestFactory?.makeAuthRequestFatory()
        makeAuthRequestFatory?.login(userName: userName, password: password) { (response) in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let model):
                    completion(model)
                case .failure:
                    let model = LoginResult(result: 0, user: User(id: 0, login: "", name: "", lastname: ""))
                    completion(model)
                }
            }
        }
    }
}
