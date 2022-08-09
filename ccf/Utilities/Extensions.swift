//
//  Extensions.swift
//  ccf
//
//  Created by Tyler Perkins on 7/15/22.
//

import Foundation


func dateFormatMMMd(date: String) -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    let dateToConvert = dateFormatter.date(from: date)
    
    dateFormatter.dateFormat = "MMM d"
    
    let returnedString = dateFormatter.string(from: dateToConvert!)

    return returnedString
    
}


func dateFormatMMMdyyyy(date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    let dateToConvert = dateFormatter.date(from: date)
    
    dateFormatter.dateFormat = "MMM d, yyyy"
    
    let returnedString = dateFormatter.string(from: dateToConvert!)

    return returnedString
}

func timeFormathmma(time: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "hh:mma"
    
    let dateToConvert = dateFormatter.date(from: time)
    
    dateFormatter.dateFormat = "h:mm a"
    
    let returnedString = dateFormatter.string(from: dateToConvert!)

    return returnedString
    
}

