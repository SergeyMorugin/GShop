//
//  CartItemCreateRequstFactory.swift
//  GShop
//
//  Created by Matthew on 06.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Alamofire

protocol CartItemsCreateRequestFactory {
    func create(productId: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<CommonResponse>) -> Void)
}

