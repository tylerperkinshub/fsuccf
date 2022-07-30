//
//  Announcement.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import UIKit

struct Announcement: Identifiable {
    
    let id = UUID()
    let title: String
    let createdBy: String
    let date: String
    let publishDate: String
    let description: String
    let urlString: String?
    
}

extension MockData {
    
    static let announcement = Announcement(title: "Beach Trip Sign Up Deadline Approaching", createdBy: "Kane", date: "07/14/2022", publishDate: "07/07/2022", description: "You will need to keep in mind that there will be a deadline and will need to be signed up in order to register. Please follow the link below to get any futher information.", urlString: nil)
    
    static let announcements = [
        Announcement(title: "Beach Trip Sign Up Deadline Approaching", createdBy: "Kane", date: "07/14/2022", publishDate: "07/07/2022", description: "You will need to keep in mind that there will be a deadline and will need to be signed up in order to register. Please follow the link below to get any futher information.", urlString: nil),
        Announcement(title: "Beach Trip Sign Up Deadline Approaching", createdBy: "Kane", date: "07/14/2022", publishDate: "07/07/2022", description: "You will need to keep in mind that there will be a deadline and will need to be signed up in order to register. Please follow the link below to get any futher information.", urlString: nil),
        Announcement(title: "Beach Trip Sign Up Deadline Approaching", createdBy: "Kane", date: "07/14/2022", publishDate: "07/07/2022", description: "You will need to keep in mind that there will be a deadline and will need to be signed up in order to register. Please follow the link below to get any futher information.", urlString: nil),
        Announcement(title: "Beach Trip Sign Up Deadline Approaching", createdBy: "Kane", date: "07/14/2022", publishDate: "07/07/2022", description: "You will need to keep in mind that there will be a deadline and will need to be signed up in order to register. Please follow the link below to get any futher information.", urlString: nil)
    ]
    
}
