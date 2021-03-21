//
//  ProductByIdViewController.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol ProductByIdDisplayLogic: AnyObject {
    func displaySomething(viewModel: ProductById.Something.ViewModel)
}

final class ProductByIdViewController: UIViewController, ProductByIdDisplayLogic {
    var interactor: ProductByIdBusinessLogic?
    var router: ProductByIdRoutingLogic?

    private var product: GoodResult

    init(product: GoodResult) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: Setup
    
    private func setupUI() {
        view.backgroundColor = .green
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        doSomething()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething() {
        let request = ProductById.Something.Request()
        //interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: ProductById.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}
