//
//  InstaLogger.swift
//  IB-Logger
//
//  Created by A.F on 4/7/20.
//  Copyright © 2020 A.F. All rights reserved.
//

import Foundation

public class InstaLogger: LoggerProtocol {
    private var messages: [LogModel]
    private var validator: ValidatorProtocol
    private var logFormatter: LogFormatterProtocol
    
    init(logValidator: ValidatorProtocol, logFormatter: LogFormatterProtocol) {
        messages = [LogModel]()
        self.validator = logValidator
        self.logFormatter = logFormatter
    }
    
    public func log(message: String, level: LogLevel) {
        let message = validator.validate(message: message)
        let logModel = LogModel(message: message, logLevel: level, date: Date())
        messages.append(logModel)
    }
    
    public func fetch() -> [String] {
        let sortedMessages = messages.sorted { (first, second) -> Bool in
            first.date.compare(second.date) == .orderedDescending
        }
        var messagesString = [String]()
        for messageModel in sortedMessages {
            let messageString = logFormatter.format(message: messageModel.message, logLevel: messageModel.logLevel, date: messageModel.date)
            messagesString.append(messageString)
        }
        return messagesString
    }
    
    
}
