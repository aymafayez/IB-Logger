//
//  StorageProviderMock.swift
//  IB-LoggerTests
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import Foundation
@testable import IB_Logger

class StorageProviderMock: StorageProviderProtocol {
    func save(message: String, onSucces: () -> (), onFailure: () -> ()) {
        
    }
    
    func clearLog(onSucces: () -> (), onFailure: () -> ()) {
        
    }
}
