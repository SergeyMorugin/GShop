//
//  SignUpResult.swift
//  GShop
//
//  Created by Matthew on 17.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation

struct SignUpResult: Codable {
    let result: Int
    let userMessage: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case userMessage = "user_message"
    }
}
