//
//  Event.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import UIKit
import SwiftUI

struct Event: Identifiable {
    
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



struct MockData {
    
    static let event = Event(title: "First Monday Night", image: "background", time: "7pm", createdBy: "Kane", eventDate: "08/23/2021", location: "925 W. Jefferson", publishDate: "08/14/2021", series: nil, cost: nil, registerURL: nil, description: "Bible study, Music, Free Food, Great Community")
    
    
    static let events = [
        Event(title: "Last Monday Night", image: "background2", time: "7pm", createdBy: "Kane", eventDate: "04/18/2021", location: "925 W. Jefferson", publishDate: "08/14/2021", series: nil, cost: nil, registerURL: nil, description: "Bible study, Music, Free Food, Great Community"),
        Event(title: "Welcome Back Picnic", image: "background4", time: "12pm", createdBy: "Kane", eventDate: "08/21/2021", location: "Langford Green", publishDate: "08/08/2021", series: nil, cost: nil, registerURL: nil, description: "Picnic"),
        Event(title: "First Monday Night", image: "background", time: "7pm", createdBy: "Kane", eventDate: "08/23/2021", location: "925 W. Jefferson", publishDate: "08/14/2021", series: nil, cost: nil, registerURL: nil, description: "Bible study, Music, Free Food, Great Community"),
        Event(title: "CCF Beach Trip", image: "background3", time: "10am", createdBy: "Kane", eventDate: "10/08/2021", location: "Kane's House", publishDate: "09/07/2021", series: nil, cost: nil, registerURL: "fsuccf.com/beach", description: "This is going to be a weekend trip to the beach. It's a time to get to k now one another.")
    ]
    
    
}





