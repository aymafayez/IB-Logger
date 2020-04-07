//
//  InstaValidator.swift
//  IB-Logger
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import Foundation

class InstaValidator: ValidatorProtocol {
    
    func validate(message: String) -> String {
        let size = message.count
        if size <= 1000 {
            return message
        }
        else {
            var subString = message[0 ..< 1000]
            subString = subString + "..."
            return subString
        }
    }
    
    

    
    func validate(messages: [String]) -> Bool {
        var size = 0
        for message in messages {
            let messageSize = message.count
            size = size + messageSize
        }
        if size <=  5*1000 {
            return true
        }
        else {
            return false
        }
    }
    
}


extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}
