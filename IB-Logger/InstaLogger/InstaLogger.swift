//
//  InstaLogger.swift
//  IB-Logger
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import Foundation

public class InstaLogger: LoggerProtocol {
    private var messages: [String]
    private var validator: ValidatorProtocol
    private var logFormatter: LogFormatterProtocol
    
    init(logValidator: ValidatorProtocol, logFormatter: LogFormatterProtocol) {
        messages = [String]()
        self.validator = logValidator
        self.logFormatter = logFormatter
    }
    
    public func log(message: String, level: LogLevel) {
        if validator.validate(message: message) {
            let message = logFormatter.format(message: message, logLevel: level, date: Date())
            messages.append(message)
        }
        else {
            
        }
        
    }
    
    public func fetch() -> [String] {
        return messages
    }
    
    
}
