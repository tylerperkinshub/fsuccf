//
//  Extensions.swift
//  ccf
//
//  Created by Tyler Perkins on 7/15/22.
//

import Foundation


func dateFormatMMMd(date: String) -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    
    let dateToConvert = dateFormatter.date(from: date)
    
    dateFormatter.dateFormat = "MMM d"
    
    let returnedString = dateFormatter.string(from: dateToConvert!)

    return returnedString
    
}

extension String {
    

    
}
