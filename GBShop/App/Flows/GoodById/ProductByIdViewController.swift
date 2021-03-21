//
//  ProductByIdViewController.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol ProductByIdDisplayLogic: AnyObject {
    func displaySomething(product: GoodResult)
}

final class ProductByIdViewController: UIViewController, ProductByIdDisplayLogic {
    var interactor: ProductByIdBusinessLogic?
    var router: ProductByIdRoutingLogic?

    private var product: GoodResult
    var contentView = ProductView()

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
        setupMainView()
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        displaySomething(product: product)
    }

    private func setupMainView() {
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges()

    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    

    
    func displaySomething(product: GoodResult) {

        let viewModel = ProductById.ViewModel(
            name: product.productName,
            price: "\(product.productPrice)",
            description: product.productDescription)

        contentView.model = ProductView.Model(viewModel: viewModel)
    }
}
