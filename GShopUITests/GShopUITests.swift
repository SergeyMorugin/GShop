//
//  GShopUITests.swift
//  GShopUITests
//
//  Created by Matthew on 11.02.2021.
//  Copyright © 2021 Ostagram Inc. All rights reserved.
//

import XCTest

class GShopUITests: XCTestCase {
    var app: XCUIApplication!
    var scrollViewsQuery: XCUIElementQuery!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        scrollViewsQuery = app.scrollViews
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccessLogin() throws {
        let passwordLabel = app.textFields["passwordLabel"].firstMatch
        XCTAssertTrue(passwordLabel.waitForExistence(timeout: 10))
        passwordLabel.tap()
        passwordLabel.typeText("123456")
        
        let loginLabel = app.textFields["loginLabel"].firstMatch
        XCTAssertTrue(loginLabel.waitForExistence(timeout: 10))
        loginLabel.tap()
        loginLabel.typeText("admin")
        snapshot("SignInScreen")
        
        
        let button = app.buttons["loginButton"]
        XCTAssertTrue(button.isHittable, "\(app.description)")
        button.tap()
        
        let productsButton = app.tabBars.buttons["Products"].firstMatch
        
        XCTAssertTrue(productsButton.waitForExistence(timeout: 20))
        productsButton.tap()
        
    }
    
    func testSuccessSignUp() throws {
        app.buttons["toSignUpPage"].firstMatch.tap()
        
        let loginLabel = app.textFields["usernameLabel"].firstMatch
        XCTAssertTrue(loginLabel.waitForExistence(timeout: 10))
        loginLabel.tap()
        loginLabel.typeText("admin")
        
        let passwordLabel = app.textFields["passwordLabel"].firstMatch
        XCTAssertTrue(passwordLabel.waitForExistence(timeout: 10))
        passwordLabel.tap()
        passwordLabel.typeText("123456")
        
        let emailLabel = app.textFields["emailLabel"].firstMatch
        XCTAssertTrue(emailLabel.waitForExistence(timeout: 10))
        emailLabel.tap()
        emailLabel.typeText("test@test.com")
        //app.keyboards.buttons["Hide keyboard"]
        //        let pointBelowPassword = loginLabel.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 1))
        //        pointBelowPassword.press(forDuration: 0.1)
        //        RunLoop.current.run(until: Date(timeInterval: 2, since: Date()))
        ////        app.tap()
        //
        let bioLabel = app.textFields["bioLabel"].firstMatch
        XCTAssertTrue(bioLabel.waitForExistence(timeout: 10))
        bioLabel.tap()
        snapshot("SignUpScreenshot")
        
        let button = app.buttons["signUpBtn"].firstMatch
        XCTAssertTrue(button.waitForExistence(timeout: 10))
        
        
        button.tap()
        let alert = app.alerts.scrollViews
        XCTAssertTrue(alert.firstMatch.waitForExistence(timeout: 10))
        
        XCTAssertTrue(alert.otherElements.staticTexts["Successfully"].exists, "\(alert.description)")
        
    }
    
    
    private func checkAuth(_ message: String) {
        let token = addUIInterruptionMonitor(withDescription: message, handler: { alert in
            alert.buttons["Ok"].tap()
            return true
        })
        // Диалоги находятся в другом потоке, поэтому дадим им некоторое время для синхронизации
        RunLoop.current.run(until: Date(timeInterval: 2, since: Date()))
        
        // Чтобы снова взаимодействовать с приложением
        app.tap()
        removeUIInterruptionMonitor(token)
        
        let resultLabel = app.scrollViews.staticTexts["result"]
        XCTAssertNotNil(resultLabel)
        XCTAssertEqual(message, resultLabel.label)
    }
    
    
    
    
    
    /*func testLaunchPerformance() throws {
     if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
     // This measures how long it takes to launch your application.
     measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
     XCUIApplication().launch()
     }
     }
     }*/
}


