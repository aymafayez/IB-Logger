//
//  InstaLogger.swift
//  IB-Logger
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import Foundation

public class InstaLogger: LoggerProtocol {
    var messages: [String]
    var validator: ValidatorProtocol
    
    init(logValidator: ValidatorProtocol) {
        messages = [String]()
        self.validator = logValidator
    }
    
    public func log(message: String, level: LogLevel) {
        
        
        
    }
    
    public func fetch() -> [String] {
        return [String]()
    }
    
    
}
