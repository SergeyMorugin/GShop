//
//  Product.swift
//  GShop
//
//  Created by Matthew on 22.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation

struct Product: Codable {
    let id: Int
    let name: String
    let price: Int
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case id = "result"
        case name = "product_name"
        case price = "product_price"
        case desc = "product_description"
    }
}
