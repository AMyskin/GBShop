//
//  AddReviewRequestFactory.swift
//  GBShop
//
//  Created by Alexander Myskin on 08.03.2021.
//

import Alamofire

protocol AddReviewRequestFactory {
    func addReview(idUser: Int,
                   text: String,
                   completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void)
}
