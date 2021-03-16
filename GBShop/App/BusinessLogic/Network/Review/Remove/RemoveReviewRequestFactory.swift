//
//  RemoveReviewRequestFactory.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import Alamofire

protocol RemoveReviewRequestFactory {
    func removeReview(idComment: Int,
                      completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void)
}
