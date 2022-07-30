//
//  ScheduleViewModel.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import Foundation
import SwiftUI

final class ScheduleViewModel: ObservableObject {
    @Published var scheduledEvents: [Scheduled] = []
    
    func getScheduledEvents() {
        PersistenceManager.retrieveScheduled { result in
            switch result {
            case .success(let schedule):
                print("This is my schedule \(schedule)")
                if schedule.isEmpty {
                    self.scheduledEvents = []
                    
                } else {
                    self.scheduledEvents = schedule.sorted(by: {$0.date < $1.date})
                    
                }
                
            case .failure(let error):
                print(error.rawValue)
            }
            
        
        }
    }
    
}
