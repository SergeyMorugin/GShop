//
//  SignUp.swift
//  GShop
//
//  Created by Matthew on 17.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

class SignUp: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility),
        baseUrl: URL) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

extension SignUp: SignUpRequestFactory {
    func signUp(id:String, username: String, password: String, email: String, gender: String, creditCard: String, bio: String,
                completionHandler: @escaping (AFDataResponse<SignUpResult>) -> Void) {
        let requestModel = SignUpRequest(
            baseUrl: self.baseUrl, 
            id: id,
            username: username,
            password: password,
            email: email,
            gender: gender,
            creditCard: creditCard,
            bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension SignUp {
    struct SignUpRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "auth/register"
        
        let id: String
        let username: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        
        var parameters: Parameters? {
            return [
                "id_user": id,
                "username": username,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}

