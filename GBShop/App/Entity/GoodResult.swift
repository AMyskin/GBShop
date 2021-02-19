//
//  GoodResult.swift
//  GBShop
//
//  Created by Alexander Myskin on 19.02.2021.
//

struct GoodResult: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
        case result
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
    }
}
