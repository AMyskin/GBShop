//
//  UserInfoInteractor.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol UserInfoBusinessLogic {
    func updateUser(user: UserInfo.User)
}

final class UserInfoInteractor: UserInfoBusinessLogic {
    var presenter: UserInfoPresentationLogic?
    var worker: UserInfoWorker?

    init(presenter: UserInfoPresentationLogic, worker: UserInfoWorker) {
        self.presenter = presenter
        self.worker = worker
    }

    // MARK: RegBusinessLogic
    func updateUser(user: UserInfo.User) {

        worker?.updateUserInfo(user: user) { (response) in

            switch response.result{
            case 1:
                self.presenter?.presentUser()
            default:
                self.presenter?.presentError()
            }
        }
    }
}
