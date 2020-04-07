//
//  InstaLogFormatter.swift
//  IB-Logger
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import Foundation

class InstaLogFormatter: LogFormatterProtocol {
    func format(message: String, logLevel: LogLevel, date: String) -> String {
        return "[ " + date + " " + logLevel.rawValue + " " + message + " ]"
    }
}
