//
//  LoginResult.swift
//  GShop
//
//  Created by Matthew on 15.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
}
