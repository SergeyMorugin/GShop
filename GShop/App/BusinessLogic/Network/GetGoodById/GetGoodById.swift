//
//  GetGoodById.swift
//  GShop
//
//  Created by Matthew on 22.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

class GetGoodById: AbstractRequestFactory {
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

extension GetGoodById: GetGoodByIdRequestFactory {
    func getGoodById(productId: Int, completionHandler: @escaping (AFDataResponse<ProductById>) -> Void) {
        let requestModel = GetGoodByIdDataRequest(
            baseUrl: self.baseUrl,
            productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetGoodById{
    struct GetGoodByIdDataRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let productId: Int
        var path: String { return "products/\(productId)" }
        
        
        
        var parameters: Parameters? {
            return [:]
        }
    }
}
