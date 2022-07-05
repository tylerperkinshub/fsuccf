//
//  Event.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import UIKit

struct Event {
    
    let id = UUID()
    let name: String
    let image: UIImage
    let createdBy: String
    let date: String
    let publishDate: String
    let series: String?
    let cost: Double?
    let registerURL: String?
    let description: String
    
}
