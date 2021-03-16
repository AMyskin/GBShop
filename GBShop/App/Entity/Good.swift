//
//  Good.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

struct Good: Codable {
     let id: Int
     let productName: String
     let price: Int
     let quantity: Int

     enum CodingKeys: String, CodingKey {
         case id = "id_product"
         case productName = "product_name"
         case price
         case quantity
     }
 }
