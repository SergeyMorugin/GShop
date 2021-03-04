//
//  CartCheckout.swift
//  GShop
//
//  Created by Matthew on 04.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

class CartCheckout: AbstractRequestFactory {
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

extension CartCheckout: CartCheckoutRequestFactory {
    func checkout(cartId: Int, completionHandler: @escaping (AFDataResponse<CommonResponse>) -> Void) {
        let requestModel = CartCheckoutRequest(
            baseUrl: self.baseUrl,
            cartId: cartId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension CartCheckout{
    struct CartCheckoutRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let cartId: Int
        var path: String { return "carts/\(cartId)/checkout"}
        
        var parameters: Parameters? {
            return [:
            ]
        }
    }
}

