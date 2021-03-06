//
//  CartItemsDelete.swift
//  GShop
//
//  Created by Matthew on 06.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//


import Foundation
import Alamofire

class CartItemsDelete: AbstractRequestFactory {
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

extension CartItemsDelete: CartItemsDeleteRequestFactory {
    func delete(productId: Int, completionHandler: @escaping (AFDataResponse<CommonResponse>) -> Void) {
        let requestModel = CartItemsDeleteRequest(
            baseUrl: self.baseUrl,
            productId: productId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension CartItemsDelete{
    struct CartItemsDeleteRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .delete
        let productId: Int
        let path: String = "cartItems"
        
        var parameters: Parameters? {
            return [
                "productId": productId
            ]
        }
    }
}
