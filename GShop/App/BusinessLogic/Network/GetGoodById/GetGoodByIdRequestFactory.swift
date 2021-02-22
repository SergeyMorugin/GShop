//
//  GetGoodByIdRequestFactory.swift
//  GShop
//
//  Created by Matthew on 22.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

protocol GetGoodByIdRequestFactory {
    func getGoodById(product_id: Int, completionHandler: @escaping (AFDataResponse<Product>) -> Void)
}
