//
//  Review.swift
//  GShop
//
//  Created by Matthew on 01.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation

struct Review: Codable {
    let id: Int
    let userId: Int
    let text: String
}
