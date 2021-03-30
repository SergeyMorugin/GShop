//
//  Cart.swift
//  GShop
//
//  Created by Matthew on 24.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation

struct Cart: Codable {
    let id: Int
    let totalPrice: Int
    let items: [CartItem]
}
