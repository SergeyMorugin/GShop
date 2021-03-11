//
//  AbstractErrorParser.swift
//  GShop
//
//  Created by Matthew on 15.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation


protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
