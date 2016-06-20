   
   DDLog.addLogger(DDTTYLogger.sharedInstance()) // TTY = Xcode console
   
   DDTTYLogger.sharedInstance().colorsEnabled = true
   DDTTYLogger.sharedInstance().logFormatter = KZFormatter()
   
   //Setting the Colors
   DDTTYLogger.sharedInstance().setForegroundColor(UIColor(netHex:Int(Constants.Colors.red)), backgroundColor: nil, forFlag: DDLogFlag.Error)
   DDTTYLogger.sharedInstance().setForegroundColor(UIColor(netHex:Int(Constants.Colors.green)), backgroundColor: nil, forFlag: DDLogFlag.Verbose)
   DDTTYLogger.sharedInstance().setForegroundColor(UIColor(netHex:Int(Constants.Colors.orange)), backgroundColor: nil, forFlag: DDLogFlag.Warning)
   DDTTYLogger.sharedInstance().setForegroundColor(UIColor(netHex:Int(Constants.Colors.backgroundWhite)), backgroundColor: nil, forFlag: DDLogFlag.Info)
   DDTTYLogger.sharedInstance().setForegroundColor(UIColor(netHex:Int(Constants.Colors.white)), backgroundColor: nil, forFlag: DDLogFlag.Debug)
   
   
   let fileLogger: DDFileLogger = DDFileLogger() // File Logger
   fileLogger.rollingFrequency = 60*60*24  // 24 hours
   fileLogger.logFileManager.maximumNumberOfLogFiles = 7
   DDLog.addLogger(fileLogger)
