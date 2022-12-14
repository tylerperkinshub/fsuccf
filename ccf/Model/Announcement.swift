//
//  Announcement.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import Foundation

struct Announcement: Identifiable {
    
    // Events are created from fsuccf.typer.dev webpage.
    let id = UUID()
    let headline: String
    let createdBy: String?
    let date: String
    let publishDate: String
    let description: String
    let urlString: String?
    
}

// Mocked Data for any UI Previews
extension MockData {
    
    static let announcement = Announcement(headline: "Beach Trip Sign Up Deadline Approaching", createdBy: "Kane", date: "07/14/2022", publishDate: "07/07/2022", description: "You will need to keep in mind that there will be a deadline and will need to be signed up in order to register. Please follow the link below to get any futher information.", urlString: nil)
    
    static let announcements = [
        Announcement(headline: "Beach Trip Sign Up Deadline Approaching", createdBy: "Kane", date: "07/14/2022", publishDate: "07/07/2022", description: "You will need to keep in mind that there will be a deadline and will need to be signed up in order to register. Please follow the link below to get any futher information.", urlString: nil),
        Announcement(headline: "Beach Trip Sign Up Deadline Approaching", createdBy: "Kane", date: "07/14/2022", publishDate: "07/07/2022", description: "You will need to keep in mind that there will be a deadline and will need to be signed up in order to register. Please follow the link below to get any futher information.", urlString: nil),
        Announcement(headline: "Beach Trip Sign Up Deadline Approaching", createdBy: "Kane", date: "07/14/2022", publishDate: "07/07/2022", description: "You will need to keep in mind that there will be a deadline and will need to be signed up in order to register. Please follow the link below to get any futher information.", urlString: nil),
        Announcement(headline: "Beach Trip Sign Up Deadline Approaching", createdBy: "Kane", date: "07/14/2022", publishDate: "07/07/2022", description: "You will need to keep in mind that there will be a deadline and will need to be signed up in order to register. Please follow the link below to get any futher information.", urlString: nil)
    ]
    
}
