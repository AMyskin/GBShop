//
//  AddReview.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//
import Foundation
import Alamofire

class AddReview: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: AppApi.myHerokuURL.rawValue)!

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue

    }
}

extension AddReview: AddReviewRequestFactory {
    func addReview(idUser: Int,
                   text: String,
                   completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void) {
        let requestModel = Review(baseUrl: baseUrl, iduser: idUser, text: text)

        self.request(request: requestModel, completionHandler: completionHandler)
    }

}

extension AddReview {
    struct Review: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addReview"

        let iduser: Int
        let text: String
        var parameters: Parameters? {
            return [
                "id_user": iduser,
                "text": text
            ]
        }
    }
}
