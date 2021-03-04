//
//  CardsTest.swift
//  GShopTests
//
//  Created by Matthew on 04.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import XCTest
import Alamofire
@testable import GShop


class CartsTests: XCTestCase {

    func testCartCheckout() throws {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        let cart = CartCheckout(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: URL(string: TestConfiguration.shared.mockServerUrl)!)

        let textExpectation = expectation(description: "exp")
        cart.checkout(cartId: 1) { (response) in
            print(response)
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
                textExpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }

    
    
    
    func testWrongUrlCartCheckout() throws {
        let wrongUrl = try XCTUnwrap(URL(string: "https://wrong.url.com"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        let cart = CartCheckout(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: wrongUrl)

        let textExpectation = expectation(description: "exp")
        cart.checkout(cartId: 1) { (response) in
            switch response.result {
            case .success(let model):
                XCTFail("Must have failed: \(model)")
            case .failure:
                textExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5)
    }
}

