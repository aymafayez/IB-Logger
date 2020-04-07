//
//  InstaLogFormatterTests.swift
//  IB-LoggerTests
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import XCTest
@testable import IB_Logger

class InstaLogFormatterTests: XCTestCase {
    
    let formatter: LogFormatterProtocol = InstaLogFormatter()

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
    
    func test_format_returnCorrectMessage() {
        let message = "Hello World"
        let logLevel = LogLevel.Error
        let date = "2020-04-07 19:45:47 +0000"
        let loggedMessage = formatter.format(message: message, logLevel: logLevel, date: date)
        let stubMessage = "[ 2020-04-07 19:45:47 +0000 Error Hello World ]"
        XCTAssertEqual(loggedMessage, stubMessage)
        
    }

}
