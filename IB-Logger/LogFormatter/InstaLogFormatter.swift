//
//  InstaLogFormatter.swift
//  IB-Logger
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import Foundation

class InstaLogFormatter: LogFormatterProtocol {
    
    func format(message: String, logLevel: LogLevel, date: Date) -> String {
        return date.description + " " + logLevel.rawValue + message 
    }
    
    
}
