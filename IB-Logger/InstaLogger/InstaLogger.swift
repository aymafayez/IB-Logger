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
    private var storageProvider: StorageProviderProtocol
    
    public init(logValidator: ValidatorProtocol, logFormatter: LogFormatterProtocol, storageProvider: StorageProviderProtocol) {
        messages = [LogModel]()
        self.validator = logValidator
        self.logFormatter = logFormatter
        self.storageProvider = storageProvider
        storageProvider.clearLog(onSucces: {}, onFailure: {})
    }
    
    public init() {
        messages = [LogModel]()
        self.validator = InstaValidator()
        self.logFormatter = InstaLogFormatter()
        self.storageProvider = InstaStorageProvider()
        storageProvider.clearLog(onSucces: {}, onFailure: {})
    }
    
    public func log(message: String, level: LogLevel) throws  {
        let message = validator.validate(message: message)
        let date = Date()
        let logModel = LogModel(message: message, logLevel: level, date: date)
        let messagesStrings = getListOfLogMessages(messages: self.messages)
        if validator.validate(messages: messagesStrings) {
            messages.append(logModel)
            storeMessage(messageModel: logModel)
        }
        else {
            throw InstaError.sessionLimitExceed
        }
    }
    
    public func fetch() -> [String] {
        let sortedMessages = getSortedMessages(messages: messages)
        return getsortedStringMessages(sortedMessages: sortedMessages)
    }
    
    private func storeMessage(messageModel: LogModel) {
        let messageString = logFormatter.format(message: messageModel.message, logLevel: messageModel.logLevel, date: messageModel.date.description)
        storageProvider.save(message: messageString, onSucces: {}, onFailure: {})
    }
    
    private func getListOfLogMessages(messages: [LogModel]) -> [String] {
        let messagesStrings = self.messages.map { messageModel -> String in
            return messageModel.message
        }
        return messagesStrings
    }
    
    private func getSortedMessages(messages: [LogModel]) -> [LogModel] {
        let sortedMessages = messages.sorted { (first, second) -> Bool in
            first.date.compare(second.date) == .orderedAscending
        }
        return sortedMessages
    }
    
    private func getsortedStringMessages(sortedMessages: [LogModel]) -> [String] {
        var messagesString = [String]()
        for messageModel in sortedMessages {
            let messageString = logFormatter.format(message: messageModel.message, logLevel: messageModel.logLevel, date: messageModel.date.description)
            messagesString.append(messageString)
        }
        return messagesString
    }
    
}
