//
//  LoginViewController.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import UIKit

protocol LoginDisplayLogic: AnyObject {
    func displaySomething()
}

class LoginViewController: UIViewController, LoginDisplayLogic {

    var contentView = LoginView()
    private lazy var router = LoginRouter(viewController: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        view.addTapGestureToHideKeyboard()

    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    private func setupUI() {
        setupWhiteView()
        setupMainView()
    }

    private func setupWhiteView() {
        view.backgroundColor = .white
    }


    private func setupMainView() {
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges()
        contentView.callbackMainButtonAction = { [weak self] in
            self?.router.routeToUserInfo()
        }

        contentView.callbackRegButtonAction = { [weak self] in
            self?.router.routeToReg()
        }
    }

    func displaySomething() {
        
    }

}
