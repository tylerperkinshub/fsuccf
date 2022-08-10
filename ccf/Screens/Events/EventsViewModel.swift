//
//  EventsViewModel.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import Foundation
import SwiftUI
import FirebaseFirestore

final class EventsViewModel: ObservableObject {
    
    @Published var isShowingDetailView = false
    @Published var events = [Event]()
    
    var selectedEvent: Event? {
        didSet { isShowingDetailView = true }
    }

    //Setting single column for EventsView
    let columns: [GridItem] = [GridItem(.flexible())]

    // Configuring to firestore
    private var db = Firestore.firestore()
    
    // Calling out to Firebase for all announcements.
    func fetchData() {
        db.collection("events").addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else {
                return
            }
        
            // Mapping documents to events array
            self.events = documents.map { (documentSnapshot) -> Event in
                let data = documentSnapshot.data()
                let title = data["title"] as? String ?? ""
                let time = data["time"] as? String ?? ""
                let createdBy = data["name"] as? String ?? ""
                let eventDate = data["date"] as? String ?? ""
                let location = data["location"] as? String ?? ""
                let publishDate = data["publishDate"] as? String ?? ""
                let series = data["series"] as? String ?? ""
                let cost = data["cost"] as? String ?? ""
                let registrationUrl = data["eventURL"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let image = data["imageURL"] as? String ?? ""
                
                return Event(title: title, image: image, time: time, createdBy: createdBy, eventDate: eventDate, location: location, publishDate: publishDate, series: series, cost: cost, registerURL: registrationUrl, description: description)
            }
        } 
    }
    
    // Making sure the Events are not published ahead of today's date.
    func publishedEvents(events: [Event]) -> [Event] {
        
        var returnedEvents: [Event] = []
        
        let date = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let today = dateFormatter.string(from: date)
        
        for event in events {
            if event.publishDate <= today {
                returnedEvents.append(event)
            }
        }
        
        return returnedEvents
    }
}
