//
//  CatalogResult.swift
//  GBShop
//
//  Created by Alexander Myskin on 19.02.2021.
//

struct CatalogResult: Codable {
    var result: Int
    var page_number: Int?
    var contents: [Product]?
    var error_message: String?
}

struct Product: Codable {
    let idProduct: Int
    let productName: String
    let price: Int
    let quantity: Int
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price
        case quantity
    }
}
