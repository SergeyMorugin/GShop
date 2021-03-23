//
//  User.swift
//  GShop
//
//  Created by Matthew on 15.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let email: String
    let username: String
    let gender: String
    let bio: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case email = "user_login"
        case username = "user_name"
        case gender = "gender"
        case bio = "bio"
    }
}
