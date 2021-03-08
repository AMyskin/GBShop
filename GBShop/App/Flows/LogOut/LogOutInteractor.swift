//
//  LogOutInteractor.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LogOutBusinessLogic {
    func doSomething(request: LogOut.Something.Request)
}

final class LogOutInteractor: LogOutBusinessLogic {
    private let presenter: LogOutPresentationLogic
    private let worker: LogOutWorker

    init(presenter: LogOutPresentationLogic, worker: LogOutWorker) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: Do something
    
    func doSomething(request: LogOut.Something.Request) {
        worker.doSomeWork()
        
        let response = LogOut.Something.Response()
        presenter.presentSomething(response: response)
    }
}
