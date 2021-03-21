//
//  GoodsModels.swift
//  GBShop
//
//  Created by Alexander Myskin on 21.03.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum GoodsModel {

    struct Request {
        let pageNumber: Int
        let idCategory: Int
    }
    struct Response {
        var result: Int
        var page_number: Int?
        var contents: [Product]?
        var error_message: String?
    }
    struct ViewModel {
        var goods: [Goods]
    }

    struct Goods {
        var name: String
        var price: String
        var description: String
    }

    
}
