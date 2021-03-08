//
//  LogOutViewController.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol LogOutDisplayLogic: AnyObject {
    func displaySomething(viewModel: LogOut.Something.ViewModel)
}

final class LogOutViewController: UIViewController, LogOutDisplayLogic {
    var interactor: LogOutBusinessLogic?
    var router: LogOutRoutingLogic?
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        doSomething()
    }
    
    // MARK: Setup
    
    private func setup() {
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Выход"
        view.backgroundColor = .white
    }
    

    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething() {
        let request = LogOut.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: LogOut.Something.ViewModel) {

    }
}
