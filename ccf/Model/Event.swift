//
//  Event.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import UIKit
import SwiftUI

struct Event: Identifiable {
    
    // Events are created from fsuccf.typer.dev webpage. 
    let id = UUID()
    let title: String
    let image: String
    let time: String
    let createdBy: String
    let eventDate: String
    let location: String
    let publishDate: String
    let series: String?
    let cost: String?
    let registerURL: String?
    let description: String
    
}


// Mocked Data for any UI Previews
struct MockData {
    
    static let event = Event(title: "First Monday Night", image: "background", time: "07:00pm", createdBy: "Kane", eventDate: "2022-03-28", location: "925 W. Jefferson", publishDate: "2022-03-28", series: "This is Series", cost: "100", registerURL: "http://www.fsuccf.com", description: "Bible study, Music, Free Food, Great Community")
    
    
    static let events = [
        Event(title: "Last Monday Night", image: "background2", time: "", createdBy: "Kane", eventDate: "", location: "925 W. Jefferson", publishDate: "2022-03-28", series: nil, cost: nil, registerURL: nil, description: "Bible study, Music, Free Food, Great Community"),
        Event(title: "Welcome Back Picnic", image: "background4", time: "07:00pm", createdBy: "Kane", eventDate: "2022-03-28", location: "Langford Green", publishDate: "2022-03-28", series: nil, cost: nil, registerURL: nil, description: "Picnic"),
        Event(title: "First Monday Night", image: "background", time: "07:00pm", createdBy: "Kane", eventDate: "2022-03-28", location: "925 W. Jefferson", publishDate: "2022-08-04", series: "", cost: "", registerURL: "", description: "Bible study, Music, Free Food, Great Community"),
        Event(title: "CCF Beach Trip", image: "background3", time: "10:00am", createdBy: "Kane", eventDate: "2022-03-28", location: "Kane's House", publishDate: "2022-08-04", series: "this is a series", cost: "$100", registerURL: "fsuccf.com/beach", description: "This is going to be a weekend trip to the beach. It's a time to get to k now one another.")
    ]
    
    
}





