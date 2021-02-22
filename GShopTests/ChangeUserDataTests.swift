//
//  ChangeUserDataTests.swift
//  GShopTests
//
//  Created by Matthew on 22.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import XCTest
import Alamofire
@testable import GShop

class ChangeUserDataTests: XCTestCase {

    func testChangeUserData() throws {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        let changeUserData = ChangeUserData(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!)
        
        let logOutExpectation = expectation(description: "exp")
        changeUserData.changeUserData(id: "123", username: "Unknown2", password: "12345678", email: "test@test.com", gender: "Male", creditCard: "4242424242424242", bio: "bio"){ (response) in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
                logOutExpectation.fulfill()
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
        let changeUserData = ChangeUserData(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: baseUrl)
        
        let wrongExpectation = expectation(description: "failed exp")
        changeUserData.changeUserData(id: "123", username: "Unknown2", password: "12345678", email: "test@test.com", gender: "Male", creditCard: "4242424242424242", bio: "bio"){ response in
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
