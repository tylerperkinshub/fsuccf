//
//  Scheduled.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import Foundation

struct Scheduled: Codable, Hashable, Identifiable {

    // Scheduled is an event saved to local storage for pushing local notifications to users. 
    let id: String
    let title: String
    let time: String
    let date: String
    let location: String
    let reminder: Int

}
