//
//  CatalogData.swift
//  GShop
//
//  Created by Matthew on 22.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

class CatalogData: AbstractRequestFactory {
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

extension CatalogData: CatalogDataRequestFactory {
    func catalogData(page: Int, perPage: Int, completionHandler: @escaping (AFDataResponse<ProductsIndex>) -> Void) {
        let requestModel = CatalogDataDataRequest(
            baseUrl: self.baseUrl,
            page: page,
            perPage: perPage)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension CatalogData {
    struct CatalogDataDataRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "products"
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
