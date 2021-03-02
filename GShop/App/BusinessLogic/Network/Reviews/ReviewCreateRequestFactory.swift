//
//  File.swift
//  GShop
//
//  Created by Matthew on 02.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

protocol ReviewCreateRequestFactory {
    func reviewCreate(reviewText: String, completionHandler: @escaping (AFDataResponse<ReviewCreateResponse>) -> Void)
}
