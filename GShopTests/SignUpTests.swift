//
//  SignUpTests.swift
//  GShopTests
//
//  Created by Matthew on 21.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import XCTest
import Alamofire
@testable import GShop

class SignUpTests: XCTestCase {

    func testSignUp() throws {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        let signUp = SignUp(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!)
        
        let signedInExpectation = expectation(description: "exp")
        signUp.signUp(id: "1", username: "Unknown", password: "12345678", email: "test@test.com", gender: "Male", creditCard: "4242424242424242", bio: "bio") { (response) in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
                signedInExpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testWrongLogin() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://wrong.url.com"))
        
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        let signUp = SignUp(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: baseUrl)
        
        let wrongExpectation = expectation(description: "failed exp")
        signUp.signUp(id: "1", username: "Unknown", password: "12345678", email: "test@test.com", gender: "Male", creditCard: "4242424242424242", bio: "bio") { response in
            switch response.result {
            case .success(let model):
                XCTFail("Must have failed: \(model)")
            case .failure:
                wrongExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5)
    }
}

