//
//  UserInfoViewController.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol UserInfoDisplayLogic: AnyObject {
    func displaySomething(viewModel: UserInfo.Something.ViewModel)
}

final class UserInfoViewController: UIViewController, UserInfoDisplayLogic {
    var interactor: UserInfoBusinessLogic?
    var router: (NSObjectProtocol & UserInfoRoutingLogic )?

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        doSomething()
    }

    // MARK: Setup

    private func setup() {

        self.navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Информация"
        view.backgroundColor = .red

    }

    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething() {
        let request = UserInfo.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: UserInfo.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}
