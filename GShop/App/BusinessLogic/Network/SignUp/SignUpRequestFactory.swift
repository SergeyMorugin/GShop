//
//  SignUpRequestFactory.swift
//  GShop
//
//  Created by Matthew on 17.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

protocol SignUpRequestFactory {
    func signUp(id: String, username: String, password: String, email: String, gender: String, creditCard: String, bio: String,
    completionHandler: @escaping (AFDataResponse<SignUpResult>) -> Void) 
}
