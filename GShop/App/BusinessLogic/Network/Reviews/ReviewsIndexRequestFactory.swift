//
//  ReviewsIndexFactory.swift
//  GShop
//
//  Created by Matthew on 01.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

protocol ReviewsIndexRequestFactory {
    func reviewsIndex(page: Int, perPage: Int, completionHandler: @escaping (AFDataResponse<ReviewsIndexResponse>) -> Void)
}
