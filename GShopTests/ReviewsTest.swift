//
//  ReviewsTest.swift
//  GShopTests
//
//  Created by Matthew on 01.03.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import XCTest
import Alamofire
@testable import GShop


class ReviewsTests: XCTestCase {
    
    func testReviewDelete() throws {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        let reviewDelete = ReviewDelete(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: URL(string: TestConfiguration.shared.mockServerUrl)!)

        let textExpectation = expectation(description: "exp")
        reviewDelete.reviewDelete(reviewId: 1) { (response) in
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
    
    func testReviewCreate() throws {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        let reviewCreate = ReviewCreate(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: URL(string: TestConfiguration.shared.mockServerUrl)!)

        let textExpectation = expectation(description: "exp")
        reviewCreate.reviewCreate(reviewText: "Test review") { (response) in
            print(response)
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
                XCTAssertEqual(result.userMessage, "Ваш отзыв был принят на модерацию")
                textExpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }

    func testRewiewsIndex() throws {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        let reviewsIndex = ReviewsIndex(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: URL(string: TestConfiguration.shared.mockServerUrl)!)

        let textExpectation = expectation(description: "exp")
        reviewsIndex.reviewsIndex(page: 1, perPage: 10) { (response) in
            print(response)
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.items.count, 2)
                XCTAssertEqual(result.items[0].id, 1)
                XCTAssertEqual(result.items[0].userId, 1)
                XCTAssertEqual(result.items[0].text, "Review1")
                textExpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    
    
    
    func testWrongUrlRewiewsIndex() throws {
        let wrongUrl = try XCTUnwrap(URL(string: "https://wrong.url.com"))
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        let reviewsIndex = ReviewsIndex(
            errorParser: ErrorParser(),
            sessionManager: manager,
            queue: DispatchQueue.global(qos: .utility),
            baseUrl: wrongUrl)

        let textExpectation = expectation(description: "exp")
        reviewsIndex.reviewsIndex(page: 1, perPage: 10) { (response) in
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
