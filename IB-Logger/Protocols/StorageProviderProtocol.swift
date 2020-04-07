//
//  StorageProviderProtocol.swift
//  IB-Logger
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import Foundation

public protocol StorageProviderProtocol {
    func save(message: String,  onSucces: () -> (),  onFailure: () -> ())
    func clearLog(onSucces: () -> (),  onFailure: () -> ())
}
