//
//  CCFScheduleButton.swift
//  ccf
//
//  Created by Tyler Perkins on 8/10/22.
//

import SwiftUI

struct CCFScheduleButton: View {
    
    var event: Event
    var scheduledEvents = [Scheduled]()
    
    @Binding var isShowingDetailView: Bool
    @Binding var presentAlreadyScheduledAlert: Bool
    
    let dateTimeComponenets = ccfTimeAndDateComponents()
    
    var body: some View {
        
        Button {
            
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
            
            let scheduledEvent = Scheduled(id: UUID().uuidString, title: event.title, time: event.time, date: event.eventDate, location: event.location, reminder: 0)
            
            print(scheduledEvent)
            
            for event in scheduledEvents {
                if event.date == scheduledEvent.date && event.time == scheduledEvent.time {
                    print("Already scheduled")
                    presentAlreadyScheduledAlert = true
                    return
                }
            }
            
            PersistenceManager.updateWith(schedule: scheduledEvent, actionType: .add) { error in
                guard let error = error else {
                    return
                }
                
                
                print("There was an error when saving: \(error.rawValue)")
            }
            
            let content = UNMutableNotificationContent()
            content.title = scheduledEvent.title
            content.subtitle = scheduledEvent.location
            content.sound = UNNotificationSound.default
            print("Event scheduled: \(content.title) @ \(content.subtitle)")
            
            var calendar = Calendar.current
            calendar.timeZone = TimeZone.current
            var testDate = DateComponents()
            
            testDate.hour = Int(10)
            testDate.minute = Int(0)
            
            testDate.month = Int(dateTimeComponenets.month(eventDate: event.eventDate))
            testDate.day = Int(dateTimeComponenets.day(eventDate: event.eventDate))
            testDate.year = Int(dateTimeComponenets.year(eventDate: event.eventDate))
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: testDate, repeats: false)
            
            let request = UNNotificationRequest(identifier: scheduledEvent.id, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
            
            print("Request added \(request)")
            
            
            isShowingDetailView = false
            
        } label: {
            Text("Add to Reminders")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width: 280, height: 50)
                .background(Color("ccfPrimary"))
                .foregroundColor(Color("ccfSecondary"))
                .cornerRadius(10)
        }
        .padding()
        .background(Color("ccfBackground"))
    }
}

struct CCFScheduleButton_Previews: PreviewProvider {
    static var previews: some View {
        CCFScheduleButton(event: MockData.event, isShowingDetailView: .constant(false), presentAlreadyScheduledAlert: .constant(false))
    }
}
