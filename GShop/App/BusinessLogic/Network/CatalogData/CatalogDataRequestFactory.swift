//
//  CatalogDataRequestFactory.swift
//  GShop
//
//  Created by Matthew on 22.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

protocol CatalogDataRequestFactory {
    func catalogData(page: Int, perPage: Int, completionHandler: @escaping (AFDataResponse<ProductsIndex>) -> Void)
}
