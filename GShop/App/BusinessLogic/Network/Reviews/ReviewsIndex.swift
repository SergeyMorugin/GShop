//
//  ReviewsIndex.swift
//  GShop
//
//  Created by Matthew on 01.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

class ReviewsIndex: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility),
        baseUrl: URL) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

extension ReviewsIndex: ReviewsIndexRequestFactory {
    func reviewsIndex(page: Int,
                      perPage: Int,
                      completionHandler: @escaping (AFDataResponse<ReviewsIndexResponse>) -> Void) {
        let requestModel = ReviewsIndexRequest(
            baseUrl: self.baseUrl,
            page: page,
            perPage: perPage)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ReviewsIndex {
    struct ReviewsIndexRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "reviews"
        //
        let page: Int
        let perPage: Int
        //
        var parameters: Parameters? {
            return [
                "page": page,
                "perPage": perPage
            ]
        }
    }
}
