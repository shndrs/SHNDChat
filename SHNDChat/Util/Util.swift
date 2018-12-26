//
//  Util.swift
//  SHNDChat
//
//  Created by Sahand Raeisi on 12/24/18.
//  Copyright © 2018 Sahand Raeisi. All rights reserved.
//

import Foundation

public protocol SHNDDateStringBuilder {
    var inputDateString:String { get }
    var inputDateFormat:SHNDDateFormatType { get }
    var outputDateFormat:SHNDDateFormatType { get }
}

public enum LocaleFor:String {
    case chinese = "zh_Hans_CN"
    case USEnglish = "en_US"
    case UKEnglish = "en_UK"
    case persian = "fa_IR"
    case arabic = "ar_SA"
    case italy = "it_IT"
}

public enum SHNDDateFormatType:String {
    
    case minuteSecond
    case time
    case date
    case fullWithoutSeconds
    case full
    case persianCustomFull
    case persianCustomDate
    case persianCustomDateFormate
    case MMMdyyy
    case MMddyyyy
    
    public func getUIFormat()-> String {
        switch self {
        case .minuteSecond:
            return "mm:ss"
        case .time:
            return "HH:mm"
        case .date:
            return "yyyy-MM-dd"
        case .fullWithoutSeconds:
            return "yyyy-MM-dd HH:mm"
        case .full:
            return "yyyy-MM-dd HH:mm:ss Z"
        case .persianCustomFull:
            return "d/MMM/yyyy  HH:mm"
        case .persianCustomDateFormate:
            return "yyyy/MM/dd"
        case .persianCustomDate:
            return "d/MMM/yyyy"
        case .MMMdyyy :
            return "MMM d, yyyy"
        case .MMddyyyy:
            return "MM/dd/yyyy"
        }
    }
}

open class SHNDDateFormatter {
    
    public private(set) var inputDateString: String
    public private(set) var inputDateFormat: SHNDDateFormatType
    public private(set) var outputDateFormat: SHNDDateFormatType
    
    init(builder:SHNDDateStringBuilder) {
        self.inputDateString = builder.inputDateString
        self.inputDateFormat = builder.inputDateFormat
        self.outputDateFormat = builder.outputDateFormat
    }
    
    @discardableResult
    public func create() -> String {
        let df = DateFormatter()
        df.dateFormat = self.inputDateFormat.getUIFormat()
        
        df.locale = NSLocale(localeIdentifier: LocaleFor.USEnglish.rawValue) as Locale
        df.calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian) as Calendar?
        guard let date = df.date(from: self.inputDateString) else {
            return ""
        }
        
        df.calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian) as Calendar?
        df.dateFormat = outputDateFormat.getUIFormat()
        let newDate = df.string(from: date)
        return newDate
    }
}

public struct SimpleDateBuilder:SHNDDateStringBuilder {
    public var inputDateString: String
    public var inputDateFormat: SHNDDateFormatType = .full
    public var outputDateFormat: SHNDDateFormatType = .MMMdyyy
    
    init(dateString:String) {
        self.inputDateString = dateString
    }
}

public extension Date {
    static func dateFromCustomString(dateString:String) -> Date {
        
        let df = DateFormatter()
        df.dateFormat = SHNDDateFormatType.MMddyyyy.getUIFormat()
        return df.date(from: dateString) ?? Date()
    }
}
