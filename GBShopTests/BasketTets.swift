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

     var requestFactory: RequestFactory?

     override func setUpWithError() throws {

         requestFactory = RequestFactory()
     }

     override func tearDownWithError() throws {
         requestFactory = nil
     }

     func testAddToBasket() throws {

         let basket = try XCTUnwrap(requestFactory).makeAddToBasketFactory()

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

        let basket = try XCTUnwrap(requestFactory).makeAddToBasketFactory()

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

         let basket = try XCTUnwrap(requestFactory).makeRemoveFromBasketFactory()

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

        let basket = try XCTUnwrap(requestFactory).makeRemoveFromBasketFactory()

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
 }

