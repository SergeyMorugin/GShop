//
//  RequestFactory.swift
//  GShop
//
//  Created by Matthew on 15.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import Foundation
import Alamofire

class RequestFactory {
    
    var baseUrl = URL(string: "https://gshopserver.herokuapp.com/")
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: self.baseUrl!)
    }
    
    func makeSignUpRequestFatory() -> SignUpRequestFactory {
        let errorParser = makeErrorParser()
        return SignUp(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: self.baseUrl!)
    }
    
    func makeLogOutRequestFatory() -> LogOutRequestFactory {
        let errorParser = makeErrorParser()
        return LogOut(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: self.baseUrl!)
    }
    
    func makeChangeUserDataRequestFatory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: self.baseUrl!)
    }
    
    func makeGetGoodById() -> GetGoodByIdRequestFactory {
        let errorParser = makeErrorParser()
        return GetGoodById(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: self.baseUrl!)
    }
    
    func makeCatalogData() -> CatalogDataRequestFactory {
        let errorParser = makeErrorParser()
        return CatalogData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: self.baseUrl!)
    }
    
    func makeReviewsIndex() -> ReviewsIndexRequestFactory {
        let errorParser = makeErrorParser()
        return ReviewsIndex(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: self.baseUrl!)
    }
    
    func makeCardCheckout() -> CartCheckoutRequestFactory {
        let errorParser = makeErrorParser()
        return CartCheckout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: self.baseUrl!)
    }
    
}
