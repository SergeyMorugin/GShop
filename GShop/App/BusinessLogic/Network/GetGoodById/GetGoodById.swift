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
    func getGoodById(product_id: Int, completionHandler: @escaping (AFDataResponse<Product>) -> Void) {
        let requestModel = GetGoodByIdDataRequest(
            baseUrl: self.baseUrl,
            product_id: product_id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetGoodById{
    struct GetGoodByIdDataRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        
        let product_id: Int
        
        var parameters: Parameters? {
            return [
                "product_id": product_id
            ]
        }
    }
}
