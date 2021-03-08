//
//  RegInteractor.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RegBusinessLogic {
    func doSomething(request: Reg.Something.Request)
}

protocol RegDataStore {
    //var name: String { get set }
}

final class RegInteractor: RegBusinessLogic, RegDataStore {
    var presenter: RegPresentationLogic?
    var worker: RegWorker?
    init(presenter: RegPresentationLogic, worker: RegWorker) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: Do something
    
    func doSomething(request: Reg.Something.Request) {
        worker = RegWorker()
        worker?.doSomeWork()
        
        let response = Reg.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
