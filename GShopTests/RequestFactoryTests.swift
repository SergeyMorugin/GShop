//
//  RequestFactoryTests.swift
//  GShopTests
//
//  Created by Matthew on 18.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import XCTest
import Alamofire
@testable import GShop

class RequestFactoryTests: XCTestCase {


    func testLogIn() throws {
        let requestFactory = RequestFactory()
        let auth = requestFactory.makeAuthRequestFatory()
        
        let signedInExpectation = expectation(description: "log in")
        auth.login(userName: "test", password: "test") { (response) in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.user.id, 123)
                signedInExpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5)
    }


}
