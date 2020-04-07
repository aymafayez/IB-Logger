//
//  ValidatorTest.swift
//  IB-LoggerTests
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import XCTest
@testable import IB_Logger

class ValidatorTest: XCTestCase {

    let validator: ValidatorProtocol = InstaValidator()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_validate_charactersLess1K_returnAllMessage() {
        var message = ""
        for _ in 0 ..< 1000 {
            message = message + "m"
        }
        let newMessage = validator.validate(message: message)
        XCTAssertEqual(message, newMessage)
    }
    
    func test_validate_charactersLess1K_returnMessageWithDots() {
        var message = ""
        for _ in 0 ..< 10001 {
            message = message + "m"
        }
        
        let newMessage = validator.validate(message: message)
        var stubMessage = ""
        for _ in 0 ..< 1000 {
            stubMessage = stubMessage + "m"
        }
        stubMessage = stubMessage + "..."
        
        XCTAssertEqual(newMessage, stubMessage)
    }
    
    func test_validateMessages_MessagesLes5K_returnTrue() {
        var message = ""
        for _ in 0 ..< 1000 {
            message = message + "m"
        }
        let messages = [message,message,message,message,message]
        XCTAssertTrue(validator.validate(messages: messages))
    }
    
    func test_validateMessages_MessagesBiggerThan5K_returnFalse() {
        var message = ""
        for _ in 0 ..< 1000 {
            message = message + "m"
        }
        let messages = [message,message,message,message,message, message]
        XCTAssertFalse(validator.validate(messages: messages))
    }

}
