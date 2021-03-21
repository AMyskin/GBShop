//
//  UserInfoModels.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum UserInfo {
    // MARK: Use cases
    

    struct Request {
    }
    struct Response {
    }
    struct ViewModel {
    }
    struct User {
        let idUser: Int
        let login: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
    }
}