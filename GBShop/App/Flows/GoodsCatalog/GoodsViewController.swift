//
//  GoodsViewController.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol GoodsDisplayLogic: AnyObject {
    func displayGoods(viewModel : GoodsModel.ViewModel)
    func displayError(alert: UIAlertController)
    func displayProduct(viewModel: GoodResult)
}

final class GoodsViewController: UIViewController, GoodsDisplayLogic {


    var interactor: GoodsBusinessLogic?
    var router:  GoodsRoutingLogic?

    var contentView = GoodsView()
    
    
    // MARK: Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        setupMainView()
    }

    private func setupMainView() {
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges()

    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        setupUI()
        fetchData()
    }
    
    // MARK: Do something

    private func fetchData() {
        interactor?.fetchCatalog()
    }

    func displayGoods(viewModel : GoodsModel.ViewModel) {
        contentView.model = GoodsView.Model(goods: viewModel.goods)
        contentView.callbackMainButtonAction = { [weak self] in
            guard let self = self else { return }
            let productId = 1
            self.interactor?.fetchProduct(productId: productId)
        }
    }

    func displayProduct(viewModel: GoodResult) {
        router?.routeToProduct(viewModel)
    }

    func displayError(alert: UIAlertController) {
        self.present(alert, animated: true)
    }
}
