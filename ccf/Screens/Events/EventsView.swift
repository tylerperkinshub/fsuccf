//
//  EventsView.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import SwiftUI
import FirebaseCore


struct EventsView: View {
    
    @StateObject var viewModel = EventsViewModel()

    var body: some View {
        
        NavigationView {
            ScrollView{
                // Initing column
                LazyVGrid(columns: viewModel.columns) {
                    // Displaying all Published Events in Firebase
                    ForEach(viewModel.publishedEvents(events: viewModel.events.sorted(by: {$0.eventDate < $1.eventDate}))) { event in
                        CCFEventsCell(event: event)
                        // Presenting selected Event
                            .onTapGesture {
                                viewModel.selectedEvent = event
                            }
                    }
                }
            }
            .navigationTitle("Upcoming Events")
            //Calling Firebase for all data
            .onAppear() {
                self.viewModel.fetchData()
            }
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                // Presenting Event details
                EventDetails(
                    event: viewModel.selectedEvent!,
                    isShowingDetailView: $viewModel.isShowingDetailView)
            }
            .background(Color("ccfBackground"))
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
            .preferredColorScheme(.dark)
    }
}
