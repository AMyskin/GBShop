//
//  RequestFactoryTests.swift
//  GBShopTests
//
//  Created by Alexander Myskin on 16.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class RequestFactoryTests: XCTestCase {
    
    var requestFactory: RequestFactory?

    override func setUpWithError() throws {
        
        requestFactory = RequestFactory()
    }

    override func tearDownWithError() throws {
        requestFactory = nil
    }
    
    func testLogin() throws {

        let auth = try XCTUnwrap(requestFactory).makeAuthRequestFatory()
        
        let signedIn = expectation(description: "log in")
        auth.login(userName: "test", password: "test") { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.user.id, 123)
                signedIn.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testLogout() throws {
        
        let logout = try XCTUnwrap(requestFactory).makeLogoutRequestFatory()
        
        let signedOut = expectation(description: "log out")
        logout.logout(userId: 1) { (response) in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.result, 1)
                signedOut.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testRegistration() throws {

        let registration = try XCTUnwrap(requestFactory).makeRegistrationRequestFatory()
        
        let reg = expectation(description: "registration")
        registration.registration(
            userId: 11,
            userName: "Test",
            password: "Pass",
            email: "a@a.com",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let request):
                XCTAssertEqual(request.result, 1)
                XCTAssertEqual(request.userMessage, "Регистрация прошла успешно!")
                reg.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }

        waitForExpectations(timeout: 5)
    }
    
    func testChangeUser() throws {

        let change = try XCTUnwrap(requestFactory).makeChangeUserRequestFactory()
        
        let changeUser = expectation(description: "Update")
        change.changeUserData(
            userId: 11,
            userName: "Test",
            password: "Pass",
            email: "a@a.com",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let request):
                XCTAssertEqual(request.result, 1)
                changeUser.fulfill()
            case .failure(let err):
                XCTFail(err.localizedDescription)
            }
        }

        waitForExpectations(timeout: 5)
    }



}
