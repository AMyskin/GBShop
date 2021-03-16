//
//  ApproveReview.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import Foundation
import Alamofire

class ApproveReview: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: AppApi.myURL.rawValue)!

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue

    }
}

extension ApproveReview: ApproveReviewRequestFactory {
    func approveReview(idComment: Int,
                       completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void) {
        let requestModel = Review(baseUrl: baseUrl, idcomment: idComment)

        self.request(request: requestModel, completionHandler: completionHandler)
    }

}

extension ApproveReview {
    struct Review: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "approveReview"

        let idcomment: Int
        var parameters: Parameters? {
            return [
                "id_comment": idcomment
            ]
        }
    }
}
