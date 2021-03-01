//
//  CatalogDataTests.swift
//  GShopTests
//
//  Created by Matthew on 22.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//


import XCTest
import Alamofire
@testable import GShop

class CatalogDataTests: XCTestCase {

    func testatalogData() throws {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        let catalogData = CatalogData(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: URL(string: TestConfiguration.shared.mockServerUrl)!)
        
        let textExpectation = expectation(description: "exp")
        catalogData.catalogData(page: 1, perPage: 10) { (response) in
            print(response)
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.items.count, 2)
                XCTAssertEqual(result.items[0].id, 123)
                XCTAssertEqual(result.items[0].name, "Ноутбук")
                XCTAssertEqual(result.items[0].price, 45600)
                textExpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testWrongCatalogData() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://wrong.url.com"))
        
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        let catalogData = CatalogData(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: baseUrl)
        
        let wrongExpectation = expectation(description: "failed exp")
        catalogData.catalogData(page: 1, perPage: 10) { response in
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

