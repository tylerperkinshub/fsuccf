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
    
    
    
    
    let columns: [GridItem] = [GridItem(.flexible())]
    
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("events").addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }
        
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
                let registrationUrl = data["eventUrl"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let image = data["imageURL"] as? String ?? ""
                
                
                return Event(title: title, image: image, time: time, createdBy: createdBy, eventDate: eventDate, location: location, publishDate: publishDate, series: series, cost: cost, registerURL: registrationUrl, description: description)
            }
            
        } 
    }
    
}
