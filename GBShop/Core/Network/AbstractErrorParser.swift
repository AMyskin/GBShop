//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Alexander Myskin on 13.02.2021.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
