//
//  File.swift
//  GShop
//
//  Created by Matthew on 02.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

class ReviewCreate: AbstractRequestFactory {
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

extension ReviewCreate: ReviewCreateRequestFactory {
    func reviewCreate(reviewText: String, completionHandler: @escaping (AFDataResponse<ReviewCreateResponse>) -> Void) {
        let requestModel = ReviewCreateRequest(
            baseUrl: self.baseUrl,
            reviewText: reviewText)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ReviewCreate{
    struct ReviewCreateRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "reviews"
        
        let reviewText: String
        
        var parameters: Parameters? {
            return [
                "text": reviewText
            ]
        }
    }
}
