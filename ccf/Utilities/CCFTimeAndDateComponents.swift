//
//  CCFTimeAndDateComponents.swift
//  ccf
//
//  Created by Tyler Perkins on 7/30/22.
//

import Foundation

struct CCFTimeAndDateComponents {
    
    func year(eventDate: String) -> String {
        return String(eventDate.prefix(4))
    }
    
    func month(eventDate: String) -> String  {
        var returnedString = eventDate
        
        var lowBound = eventDate.startIndex
        var highBound = eventDate.index(eventDate.startIndex, offsetBy: 5)
        var midRange = lowBound ..< highBound
        
        returnedString.removeSubrange(midRange)
        
        lowBound = returnedString.index(returnedString.startIndex, offsetBy: 2)
        highBound = returnedString.endIndex
        midRange = lowBound ..< highBound
        
        returnedString.removeSubrange(midRange)
        
        return returnedString
    }
    
    func day(eventDate: String) -> String {
        
        return String(eventDate.suffix(2))
    }
    
    func twentyFourHour(eventTime: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mma"
        
        let date = dateFormatter.date(from: eventTime.lowercased())
        dateFormatter.dateFormat = "HH:mm"
        let date24 = dateFormatter.string(from: date!)
        
        
        return String(date24.prefix(2))
    }
    
    func minute(eventTime: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mma"
        
        let date = dateFormatter.date(from: eventTime.lowercased())
        dateFormatter.dateFormat = "HH:mm"
        let date24 = dateFormatter.string(from: date!)
        
        
        return String(date24.suffix(2))
    }
    
    
}
