//
//  RegViewController.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol RegDisplayLogic: AnyObject {
    func displaySomething(viewModel: Reg.Something.ViewModel)
}

final class RegViewController: UIViewController, RegDisplayLogic {
    var interactor: RegBusinessLogic?
    var router: (NSObjectProtocol & RegRoutingLogic )?
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        doSomething()
    }

    
    // MARK: Setup
    
    private func setup() {
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Регистрация"
        view.backgroundColor = .blue
    }
    

    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething() {
        let request = Reg.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Reg.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}
