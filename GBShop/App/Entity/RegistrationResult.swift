//
//  RegistrationResult.swift
//  GBShop
//
//  Created by Alexander Myskin on 13.02.2021.
//

struct RegistrationResult: Codable {
    let result: Int
    let userMessage: String

    enum CodingKeys: String, CodingKey {
        case result
        case userMessage = "user_message"
    }
}
