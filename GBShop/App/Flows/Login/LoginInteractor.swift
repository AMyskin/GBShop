//
//  LoginInteractor.swift
//  GBShop
//
//  Created by Alexander Myskin on 11.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
    func fetchUser(login: String, password: String)
}

protocol LoginDataStore {
    //var name: String { get set }
}

final class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    
    
    var presenter: LoginPresentationLogic
    var worker: LoginWorkerLogic
    //var name: String = ""
    private let network = RequestFactory().makeAuthRequestFatory()
    
    init(presenter: LoginPresentationLogic, worker: LoginWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: LoginBusinessLogic
    func fetchUser(login: String, password: String) {

        worker.fetchUser(userName: login, password: password) { (response) in

            switch response.result{
            case 1:
                let user = Login.Response(user: response.user)
                self.presenter.presentUser(user: user.user)
            default:
                self.presenter.presentError()
            }
        }
    }
    
}
