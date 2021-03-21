//
//  GetBasketResult.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

struct GetBasketResult: Codable {
    let result: Int
    let amount: Int?
    let countGoods: Int?
    let contents: [Good]?
    let errorMessage: String?

}
