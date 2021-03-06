//
//  LogOutRequestFactory.swift
//  GShop
//
//  Created by Matthew on 17.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

protocol LogOutRequestFactory {
    func logOut(id: Int, completionHandler: @escaping (AFDataResponse<CommonResponse>) -> Void)
}
