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
}

final class GoodsViewController: UIViewController, GoodsDisplayLogic {


    var interactor: GoodsBusinessLogic?
    var router: (NSObjectProtocol & GoodsRoutingLogic & GoodsDataPassing)?

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
        navigationItem.title = "Регистрация"
       // displayGoods()
        setupUI()
        fetchData()
    }
    
    // MARK: Do something

    private func fetchData() {
        interactor?.fetchCatalog()
    }

    func displayGoods(viewModel : GoodsModel.ViewModel) {
        contentView.model = GoodsView.Model(goods: viewModel.goods)
    }

    func displayError(alert: UIAlertController) {
        self.present(alert, animated: true)
    }
}
