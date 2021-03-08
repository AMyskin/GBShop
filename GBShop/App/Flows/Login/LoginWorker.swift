//
//  LoginWorker.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import UIKit

class LoginWorker {

    let requestFactory = RequestFactory()

    func fetchUser(userName: String, password: String,
                   completion: @escaping (LoginResult) -> Void){

        let auth = requestFactory.makeAuthRequestFatory()

        auth.login(userName: userName, password: password) { (response) in
            switch response.result {
            case .success(let model):
                print("Ok")
                completion(model)

            case .failure(let err):
                print(err)
            }
        }
    }
}
