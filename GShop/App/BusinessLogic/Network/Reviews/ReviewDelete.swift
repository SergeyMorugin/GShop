//
//  File.swift
//  GShop
//
//  Created by Matthew on 02.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

class ReviewDelete: AbstractRequestFactory {
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

extension ReviewDelete: ReviewDeleteRequestFactory {
    func reviewDelete(reviewId: Int, completionHandler: @escaping (AFDataResponse<CommonResponse>) -> Void) {
        let requestModel = ReviewDeleteRequest(
            baseUrl: self.baseUrl,
            reviewId: reviewId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ReviewDelete{
    struct ReviewDeleteRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .delete
        let reviewId: Int
        var path: String { return "reviews/\(reviewId)" }
        
        var parameters: Parameters? {
            return [:]
        }
    }
}
