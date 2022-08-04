//
//  Scheduled.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import Foundation

struct Scheduled: Codable, Hashable, Identifiable {

    let id: String
    let title: String
    let time: String
    let date: String
    let location: String
    let reminder: Int

}
