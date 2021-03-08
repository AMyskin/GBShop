//
//  RequestFactory.swift
//  GBShop
//
//  Created by Alexander Myskin on 13.02.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    func makeLogoutRequestFatory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    func makeRegistrationRequestFatory() -> RegistrationRequestFactory {
        let errorParser = makeErrorParser()
        return Registration(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    func makeChangeUserRequestFactory() -> ChangeUserRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUser(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    func makeFetchCatalogFactory() -> GetCatalogRequestFactory {
        let errorParser = makeErrorParser()
        return GetCatalog(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    func makeFetchGoodFactory() -> FetchGoodByIdRequestFactory {
        let errorParser = makeErrorParser()
        return FetchGoodById(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    func makeAddToBasketFactory() -> AddToBasketRequestFactory {
        let errorParser = makeErrorParser()
        return AddToBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    func makeRemoveFromBasketFactory() -> RemoveFromBasketRequestFactory {
        let errorParser = makeErrorParser()
        return RemoveFromBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    func makeGetUserBasketFactory() -> GetUserBasketRequestFactory {
        let errorParser = makeErrorParser()
        return GetUserBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    func makePayBasketFactory() -> PayBasketRequestFactory {
        let errorParser = makeErrorParser()
        return PayBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
