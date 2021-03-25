//
//  CartShow.swift
//  GShop
//
//  Created by Matthew on 24.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

class CartShow: AbstractRequestFactory {
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

extension CartShow: CartShowRequestFactory {
    func show(cartId: Int, completionHandler: @escaping (AFDataResponse<Cart>) -> Void) {
        let requestModel = CartShowRequest(
            baseUrl: self.baseUrl,
            cartId: cartId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension CartShow {
    struct CartShowRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let cartId: Int
        var path: String { return "carts/\(cartId)"}
        
        var parameters: Parameters? {
            return [:
            ]
        }
    }
}

