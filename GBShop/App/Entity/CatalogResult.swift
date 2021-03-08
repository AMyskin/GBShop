//
//  CatalogResult.swift
//  GBShop
//
//  Created by Alexander Myskin on 19.02.2021.
//

struct CatalogResult: Codable {
    let products: [Product]
}

struct Product: Codable {
    let idProduct: Int
    let productName: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price
    }
}
