# IB-Logger
IB-Logger is a framework that helps you to log errors.

Getting started:- 

1- import IB-Logger 
2- logger = InstaLogger()
3- let message = "Hello world"
   let level = LogLevel.Verbose
   logger.log(message: message, level: level)
4- let messages = logger.fetch()
5- outbut : "[ 2020-04-07 19:45:47 +0000 Error Hello World ]"


For custom use :- 

1- implement 
public protocol ValidatorProtocol {
    func validate(message: String) -> String
    func validate(messages: [String]) -> Bool
}
public protocol LogFormatterProtocol {
    func format(message: String, logLevel: LogLevel, date: String) -> String
}
public protocol StorageProviderProtocol {
    func save(message: String,  onSucces: () -> (),  onFailure: () -> ())
    func clearLog(onSucces: () -> (),  onFailure: () -> ())
}

2- logger =  InstaLogger(logValidator: validatorObj, logFormatter: formatterObj, storageProvider: storageProviderObj)
3- let message = "Hello world"
   let level = LogLevel.Verbose
   logger.log(message: message, level: level)
4- let messages = logger.fetch()
5- outbut : "[ 2020-04-07 19:45:47 +0000 Error Hello World ]"



