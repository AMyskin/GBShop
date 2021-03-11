//
//  RegViewController.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol RegDisplayLogic: AnyObject {
    func displaySomething(viewModel: Reg.ViewModel)
}

final class RegViewController: UIViewController, RegDisplayLogic {
    var interactor: RegBusinessLogic?
    var router: RegRoutingLogic?

    var contentView = RegistrationView()
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addTapGestureToHideKeyboard()
        setup()
        doSomething()
    }

    
    // MARK: Setup
    
    private func setup() {
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Регистрация"
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges()
        contentView.callbackMainButtonAction = {
            // route to info
        }
    }
    

    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething() {
//        let request = Reg.Request()
//        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Reg.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}
