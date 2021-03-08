//
//  UserInfoInteractor.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol UserInfoBusinessLogic {
    func doSomething(request: UserInfo.Something.Request)
}

protocol UserInfoDataStore {
    //var name: String { get set }
}

final class UserInfoInteractor: UserInfoBusinessLogic, UserInfoDataStore {
    var presenter: UserInfoPresentationLogic?
    var worker: UserInfoWorker?

    init(presenter: UserInfoPresentationLogic, worker: UserInfoWorker) {
        self.presenter = presenter
        self.worker = worker
    }
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: UserInfo.Something.Request) {
        worker = UserInfoWorker()
        worker?.doSomeWork()
        
        let response = UserInfo.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
