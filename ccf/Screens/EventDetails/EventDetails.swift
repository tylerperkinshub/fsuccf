//
//  EventDetails.swift
//  ccf
//
//  Created by Tyler Perkins on 7/13/22.
//

import SwiftUI

struct EventDetails: View {
    
    var event: Event
    let dateTimeComponenets = ccfTimeAndDateComponents()
    
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    @State var scheduledEvents = [Scheduled]()
    
    @State private var presentAlreadyScheduledAlert = false
    
    
    var body: some View {
        VStack{
            
            CCFDismissButton(isShowingDetailView: $isShowingDetailView)
            VStack(spacing: 0){
                ZStack{
                    
                    CCFAsyncImage(imageString: .constant(event.image))
                        VStack{
                            HStack{
                                Text(event.title)
                                if event.cost != "" {
                                    Text("- \(event.cost!)")
                                }
                            }
                            .font(.system(size: 24, weight: .semibold))

                            Rectangle()
                                .frame(width:300, height: 4)
   
                            Text("\(dateFormatMMMdyyyy(date:event.eventDate)) @ \(timeFormathmma(time:event.time))")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        .padding([.bottom], 6)
                        .offset(x: 0, y: -75)
                        .foregroundColor(.white)
                }

                ZStack{

                    VStack{
                        Text(event.description)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(width: 350, alignment: .leading)
                            .font(.system(size: 16, weight: .light))
                            
                            
                        Text(event.location)
                            .frame(width: 350, height: 20, alignment: .topLeading)
                        
                        if event.series != "" {
                            Text(event.series!)
                                .frame(width: 350, height: 20, alignment: .topLeading)
                            
                        }
                        
                    }
                }
            }
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
            
            if event.registerURL != "" {
                
                Button {
                    isShowingSafariView = true
                } label: {
                    Text("More Info")
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
            
            Spacer()
        }
        .onAppear() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("All set!")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
            
            PersistenceManager.retrieveScheduled { result in
                switch result {
                case .success(let events):
                    
                    self.scheduledEvents = events
                case.failure(let error):
                    print(error)
                }
            }
        }
        
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: event.registerURL!) ?? URL(string: "https://www.ccffsu.com")!)
        })
        
        .alert("This event has already been scheduled", isPresented: $presentAlreadyScheduledAlert, actions: { })

    }

}

struct EventDetails_Previews: PreviewProvider {
    static var previews: some View {
        EventDetails(event: MockData.events[3], isShowingDetailView: .constant(false))
    }
}
