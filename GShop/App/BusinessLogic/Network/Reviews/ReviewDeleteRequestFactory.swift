//
//  File.swift
//  GShop
//
//  Created by Matthew on 02.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

protocol ReviewDeleteRequestFactory {
    func reviewDelete(reviewId: Int, completionHandler: @escaping (AFDataResponse<CommonResponse>) -> Void)
}
