//
//  InstaLoggerTest.swift
//  IB-LoggerTests
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import XCTest
@testable import IB_Logger

class InstaLoggerTest: XCTestCase {

    let validatorMock = InstaValidatorMock()
    let formatterMock = InstaLogFormatterMock()
    let storageProviderMock = StorageProviderMock()
    var instaLogger: InstaLogger = InstaLogger()
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
    
    func test_log_addingCorrectMessage() {
        let message = "Hello world"
        let level = LogLevel.Verbose
        validatorMock.validateMessagesShouldReturnTrue = true
        instaLogger = InstaLogger(logValidator: validatorMock, logFormatter: formatterMock, storageProvider: storageProviderMock)
        try? instaLogger.log(message: message, level: level)
        let resultMessage = instaLogger.fetch()
        XCTAssertEqual(message, resultMessage[0])
    }
    
    func test_log_IfValidationFailed_DoNotaddingMessage() {
        let message = "Hello world"
        let level = LogLevel.Verbose
        validatorMock.validateMessagesShouldReturnTrue = false
        instaLogger = InstaLogger(logValidator: validatorMock, logFormatter: formatterMock, storageProvider: storageProviderMock)
        try? instaLogger.log(message: message, level: level)
        let resultMessage = instaLogger.fetch()
        XCTAssertEqual(resultMessage.count, 0)
    }
    
    func test_fetch_returnsStringsSortedByDate() {
        let message = "Hello world"
        let message1 = "Hello world 1"
        let message2 = "Hello world 2"
        validatorMock.validateMessagesShouldReturnTrue = true
        let level = LogLevel.Verbose
        instaLogger = InstaLogger(logValidator: validatorMock, logFormatter: formatterMock, storageProvider: storageProviderMock)
        try? instaLogger.log(message: message, level: level)
        try? instaLogger.log(message: message1, level: level)
        try? instaLogger.log(message: message2, level: level)
        let resultMessage = instaLogger.fetch()
        XCTAssertEqual(message, resultMessage[0])
        XCTAssertEqual(message1, resultMessage[1])
        XCTAssertEqual(message2, resultMessage[2])
    }
    

    
    

}
