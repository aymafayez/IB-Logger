//
//  InstaValidatorMock.swift
//  IB-LoggerTests
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import Foundation
@testable import IB_Logger

class InstaValidatorMock: ValidatorProtocol {
    var validateMessagesShouldReturnTrue = true
    func validate(message: String) -> String {
        return message
    }
    
    func validate(messages: [String]) -> Bool {
        return validateMessagesShouldReturnTrue
    }
    
    
}
