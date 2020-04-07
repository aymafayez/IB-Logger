//
//  InstaValidator.swift
//  IB-Logger
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import Foundation

class InstaValidator: ValidatorProtocol {
    
    func validate(message: String) -> Bool {
        let size = message.utf8.count
        if size <= 1024 {
            return true
        }
        else {
            return false
        }
    }
    
    func validate(messages: [String]) -> Bool {
        var size = 0
        for message in messages {
            let messageSize = message.utf8.count
            size = size + messageSize
        }
        if size <=  5*1024 {
            return true
        }
        else {
            return false
        }
    }
    
}
