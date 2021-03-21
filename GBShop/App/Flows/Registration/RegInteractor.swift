//
//  RegInteractor.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RegBusinessLogic {
    func  registration(user: Reg.RegUser)
}

final class RegInteractor: RegBusinessLogic {
    var presenter: RegPresentationLogic?
    var worker: RegWorker?
    init(presenter: RegPresentationLogic, worker: RegWorker) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: RegBusinessLogic
    func  registration(user: Reg.RegUser) {

        worker?.regUser(user: user) { (response) in

            switch response.result{
            case 1:
                self.presenter?.presentUser()
            default:
                self.presenter?.presentError()
            }
        }
    }
}
