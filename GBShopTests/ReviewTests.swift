//
//  ReviewTests.swift
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

    func testAddReview() throws {

        let review = try XCTUnwrap(requestFactory).makeAddRevuewFactory()

        let reviewExpectation = expectation(description: "Add Review")
        review.addReview(idUser: 123, text: "Проверка review") { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                reviewExpectation.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }

    func testAddReviewMistake() throws {

        let review = try XCTUnwrap(requestFactory).makeAddRevuewFactory()

        let reviewExpectation = expectation(description: "Add Review")
        review.addReview(idUser: 1233, text: "Проверка review") { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 0)
                reviewExpectation.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }

    func testApproveReview() throws {

        let review = try XCTUnwrap(requestFactory).makeApproveReviewFactory()

        let reviewExpectation = expectation(description: "Approve Review")
        review.approveReview(idComment: 123) { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                reviewExpectation.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }
    func testRemoveReview() throws {

        let review = try XCTUnwrap(requestFactory).makeRemoveReviewFactory()

        let reviewExpectation = expectation(description: "Remove Review")
        review.removeReview(idComment: 123) { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                reviewExpectation.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }

    func testRemoveReviewFail() throws {

        let review = try XCTUnwrap(requestFactory).makeRemoveReviewFactory()

        let reviewExpectation = expectation(description: "Remove Fail Review")
        review.removeReview(idComment: 1232) { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 0)
                reviewExpectation.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }
}
