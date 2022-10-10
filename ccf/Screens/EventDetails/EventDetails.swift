//
//  EventDetails.swift
//  ccf
//
//  Created by Tyler Perkins on 7/13/22.
//

import SwiftUI

struct EventDetails: View {
    
    var event: Event
    @StateObject var viewModel = EventDetailsViewModel()
    
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    @State var scheduledEvents = [Scheduled]()
    @State private var presentAlreadyScheduledAlert = false
    
    var body: some View {
        
        VStack{
            // Set to dismiss screen
            CCFDismissButton(isShowingDetailView: $isShowingDetailView)
            
            VStack(spacing: 0){
                // Inits hero image
                CCFEventsDetailCell(event: event)
                    
                // Text below Cell
                VStack(alignment: .leading) {
                    Text(event.description)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.system(size: 16, weight: .light))
                    
                    Text(event.location)
                    
                    if event.series != "" {
                        Text(event.series!)
                    }
                }
                .frame(width: 350)
                .padding(4)
            }
            
            // Setting schedule
            CCFScheduleButton(event: event, isShowingDetailView: $isShowingDetailView, presentAlreadyScheduledAlert: $presentAlreadyScheduledAlert)
            
            // If there is a register url it will show this button
            if event.registerURL != "" {
                CCFSafariButton(isShowingSafariView: $isShowingSafariView)
            }
            Spacer()
        }
        .onAppear() {
            // On initial boot will get preferences for Alerts
            viewModel.setAlertPreferences()
            
            // Gets any scheduled objects.
            PersistenceManager.retrieveScheduled { result in
                switch result {
                case .success(let events):
                    self.scheduledEvents = events
                    
                case.failure(let error):
                    print(error)
                }
            }
        }
        // If there is more information it will show Safari screen
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: event.registerURL!) ?? URL(string: "https://www.ccffsu.com")!)
        })
        .alert("This event has already been scheduled", isPresented: $presentAlreadyScheduledAlert, actions: {})
    }
}

struct EventDetails_Previews: PreviewProvider {
    static var previews: some View {
        EventDetails(event: MockData.events[3], isShowingDetailView: .constant(false))
    }
}
