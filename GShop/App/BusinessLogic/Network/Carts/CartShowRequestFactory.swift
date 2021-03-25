//
//  CartShowRequestFactory.swift
//  GShop
//
//  Created by Matthew on 24.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Alamofire

protocol CartShowRequestFactory {
    func show(cartId: Int, completionHandler: @escaping (AFDataResponse<Cart>) -> Void)
}
