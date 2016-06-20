//
//  KZFormatter.swift
//  Whos in
//
//  Created by Wassim Seifeddine on 4/25/16.
//  Copyright © 2016 Wassim Seifeddine. All rights reserved.
//

import Foundation
import CocoaLumberjack.DDDispatchQueueLogFormatter

class KZFormatter: DDDispatchQueueLogFormatter {
    
    lazy var formatter: NSDateFormatter = {
        let dateFormatter = NSDateFormatter()
        dateFormatter.formatterBehavior = .Behavior10_4
        dateFormatter.dateFormat = "HH:mm:ss.SSS"
        return dateFormatter
    }()
    
    override func formatLogMessage(logMessage: DDLogMessage!) -> String {
        let dateAndTime = formatter.stringFromDate(logMessage.timestamp)
        
        var logLevel: String
        let logFlag = logMessage.flag
        if logFlag.contains(.Error) {
            logLevel = "ERROR"
        } else if logFlag.contains(.Warning){
            logLevel = "WARNING"
        } else if logFlag.contains(.Info) {
            logLevel = "INFO"
        } else if logFlag.contains(.Debug) {
            logLevel = "DEBUG"
        } else if logFlag.contains(.Verbose) {
            logLevel = "VERBOSE"
        } else {
            logLevel = "???"
        }
        
        let formattedLog = "\(dateAndTime) |\(logLevel)| \((logMessage.file as NSString).lastPathComponent):\(logMessage.line): ( \(logMessage.function) ): \(logMessage.message)"
        return formattedLog;
    }
}
