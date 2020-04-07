//
//  InstaLogFormatterMock.swift
//  IB-LoggerTests
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import XCTest
@testable import IB_Logger

class InstaLogFormatterMock: LogFormatterProtocol {
    var isformatFuncCalled: Bool = false
    func format(message: String, logLevel: LogLevel, date: String) -> String {
        isformatFuncCalled = true 
        return message
    }
}
