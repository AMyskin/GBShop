//
//  BasketTets.swift
//  GBShopTests
//
//  Created by Alexander Myskin on 08.03.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class ReviewTests: XCTestCase {

    func testAddToBasket() throws {

        let requestFactory = RequestFactory()

        let basket = requestFactory.makeAddToBasketFactory()

        let basketExpectation = expectation(description: "Add basket")
        basket.AddToBasket(idProduct: 123, quantity: 4) { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                basketExpectation.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }

    func testAddToBasketFail() throws {
        let requestFactory = RequestFactory()

        let basket = requestFactory.makeAddToBasketFactory()

        let basketExpectation = expectation(description: "Add basket")
        basket.AddToBasket(idProduct: 1234, quantity: 4) { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 0)
                basketExpectation.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }

    func testRemoveFromBasket() throws {
        let requestFactory = RequestFactory()

        let basket = requestFactory.makeRemoveFromBasketFactory()

        let basketExpectation = expectation(description: "RemoveFromBasket(")
        basket.RemoveFromBasket(idProduct: 123) { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                basketExpectation.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }

    func testRemoveFromBasketFail() throws {
        let requestFactory = RequestFactory()

        let basket = requestFactory.makeRemoveFromBasketFactory()

        let basketExpectation = expectation(description: "RemoveFromBasketFail")
        basket.RemoveFromBasket(idProduct: 1234) { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 0)
                basketExpectation.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }

    func testGetUserBasket() throws {
        let requestFactory = RequestFactory()

        let basket = requestFactory.makeGetUserBasketFactory()

        let basketExpectation = expectation(description: "GetUserBasket")
        basket.getBasket(idUser: 123) { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                basketExpectation.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }

    func testGetUserBasketFail() throws {
        let requestFactory = RequestFactory()

        let basket = requestFactory.makeGetUserBasketFactory()

        let basketExpectation = expectation(description: "GetUserBasket")
        basket.getBasket(idUser: 1235) { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 0)
                basketExpectation.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }

    func testPayBasket() throws {
        let requestFactory = RequestFactory()

        let basket = requestFactory.makePayBasketFactory()

        let basketExpectation = expectation(description: "PayBasket")
        basket.payBasket(idBasket: 100) { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 200)
                basketExpectation.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }

    func testPayBasketFail() throws {
        let requestFactory = RequestFactory()

        let basket = requestFactory.makePayBasketFactory()

        let basketExpectation = expectation(description: "PayBasket")
        basket.payBasket(idBasket: 123) { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 404)
                basketExpectation.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }

}

