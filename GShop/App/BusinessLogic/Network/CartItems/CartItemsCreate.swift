//
//  CartItemsCreate.swift
//  GShop
//
//  Created by Matthew on 06.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

class CartItemsCreate: AbstractRequestFactory {
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

extension CartItemsCreate: CartItemsCreateRequestFactory {
    func create(productId: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<CommonResponse>) -> Void) {
        let requestModel = CartItemsCreateRequest(
            baseUrl: self.baseUrl,
            productId: productId,
            quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension CartItemsCreate{
    struct CartItemsCreateRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let productId: Int
        let quantity: Int
        let path: String = "cartItems"
        
        var parameters: Parameters? {
            return [
                "productId": productId,
                "quantity": quantity
            ]
        }
    }
}
