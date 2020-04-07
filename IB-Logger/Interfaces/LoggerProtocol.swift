//
//  LoggerProtocol.swift
//  IB-Logger
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import Foundation

public protocol LoggerProtocol {
    func log(message: String, level: LogLevel)
    func fetch() -> [String]
}

public enum LogLevel: String {
    case Error
    case Verbose
}
