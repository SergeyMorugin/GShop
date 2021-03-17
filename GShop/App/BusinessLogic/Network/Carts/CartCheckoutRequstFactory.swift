//
//  CartCheckoutRequstFactory.swift
//  GShop
//
//  Created by Matthew on 04.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//


import Alamofire

protocol CartCheckoutRequestFactory {
    func checkout(cartId: Int, completionHandler: @escaping (AFDataResponse<CommonResponse>) -> Void)
}
