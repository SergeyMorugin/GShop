//
//  LogOutTests.swift
//  GShopTests
//
//  Created by Matthew on 22.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import XCTest
import Alamofire
@testable import GShop

class LogOutTests: XCTestCase {

    func testLogOut() throws {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        let logOut = LogOut(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!)
        
        let logOutExpectation = expectation(description: "sign up")
        logOut.logOut(id: "123") { (response) in
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
        let logOut = LogOut(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: baseUrl)
        
        let wrongExpectation = expectation(description: "failed loged in")
        logOut.logOut(id: "123") { response in
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

