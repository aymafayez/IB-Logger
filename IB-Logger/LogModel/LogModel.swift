//
//  LogModel.swift
//  IB-Logger
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import Foundation

class LogModel {
    var message: String
    var logLevel: LogLevel
    var date: Date
    
    init(message: String, logLevel: LogLevel, date: Date) {
        self.message = message
        self.logLevel = logLevel
        self.date = date
    }
}
