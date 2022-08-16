//
//  EventDetailsViewModel.swift
//  ccf
//
//  Created by Tyler Perkins on 7/13/22.
//

import Foundation
import SwiftUI

final class EventDetailsViewModel: ObservableObject {
    
  // Gets user preference for notifications
    func setAlertPreferences() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}

