//
//  ValidatorProtocol.swift
//  IB-Logger
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import Foundation

public protocol ValidatorProtocol {
    func validate(message: String) -> String
    func validate(messages: [String]) -> Bool
}
