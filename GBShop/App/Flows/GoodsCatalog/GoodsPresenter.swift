//
//  GoodsPresenter.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol GoodsPresentationLogic {
    func presentGoods(contents: [Product]?)
    func presentError()
    func presentProduct(contents: GoodResult)
}

class GoodsPresenter: GoodsPresentationLogic {

    weak var viewController: GoodsDisplayLogic?

    // MARK: - Init

    init(viewController: GoodsDisplayLogic) {
        self.viewController = viewController
    }

    func presentError() {
        let alert = UIAlertController(title: "Ошибка", message: "Пользователь не найден\nили пароль не верен. \n Пароль \"password\"", preferredStyle: .alert)

        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: { [weak self] in
            self?.viewController?.displayError(alert: alert)
        })
    }

    func presentGoods(contents: [Product]?) {

        if let contents = contents {
            var goods: [GoodsModel.Goods] = []
            contents.forEach { good in

                let result = GoodsModel.Goods(name: good.productName, price: "\(good.price)", description: "Количество \(good.quantity)")
                goods.append(result)

            }

            let viewModel = GoodsModel.ViewModel(goods: goods)

            viewController?.displayGoods(viewModel: viewModel)
        }
    }

    func presentProduct(contents: GoodResult) {
        viewController?.displayProduct(viewModel: contents)
    }
}
