//
//  GetGoodByIdTests.swift
//  GShopTests
//
//  Created by Matthew on 22.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import XCTest
import Alamofire
@testable import GShop

class GetGoodByIdTests: XCTestCase {

    func testGetGoodById() throws {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        let getGoodById = GetGoodById(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: URL(string: TestConfiguration.shared.mockServerUrl)!)
        
        let textExpectation = expectation(description: "exp")
        getGoodById.getGoodById(productId: 1) { (response) in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.id, 1)
                XCTAssertEqual(result.name, "Ноутбук")
                XCTAssertEqual(result.price, 45600)
                XCTAssertEqual(result.desc, "Мощный игровой ноутбук")
                textExpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testWrongGetGoodById() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://wrong.url.com"))
        
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        let getGoodById = GetGoodById(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: baseUrl)
        
        let wrongExpectation = expectation(description: "failed exp")
        getGoodById.getGoodById(productId: 1) { response in
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

