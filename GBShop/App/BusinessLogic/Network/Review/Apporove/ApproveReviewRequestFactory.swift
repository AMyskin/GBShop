//
//  ApproveReviewRequestFactory.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import Alamofire

protocol ApproveReviewRequestFactory {
    func approveReview(idComment: Int,
                       completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void)
}
