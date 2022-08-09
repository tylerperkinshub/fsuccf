//
//  AnnocementsViewModel.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import Foundation
import SwiftUI
import FirebaseFirestore

final class AnnouncementsViewModel: ObservableObject {
    
    @Published var isShowingDetailView = false
    @Published var announcements = [Announcement]()
    
    var selectedAnnouncement: Announcement? {
        didSet { isShowingDetailView = true }
    }

    // Setting single column for AnnouncementView
    let columns: [GridItem] = [GridItem(.flexible())]
    
    // Configuring to firestore
    private var db = Firestore.firestore()
    
    // Calling out to Firebase for all announcements.
    func fetchData() {
        db.collection("announcements").addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }
            
            // Mapping documents to announcements array
            self.announcements = documents.map { (documentSnapshot) -> Announcement in
                let data = documentSnapshot.data()
                let createdBy = data["createdBy"] as? String ?? ""
                let date = data["date"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let headline = data["headline"] as? String ?? ""
                let publishDate = data["publishDate"] as? String ?? ""
                let url = data["url"] as? String ?? ""
                
                return Announcement(headline: headline, createdBy: createdBy, date: date, publishDate: publishDate, description: description, urlString: url)
            }
        }
    }
    
    // Making sure the Announcements are not published ahead of today's date.
    func publishedAnnouncements(announcements: [Announcement]) -> [Announcement] {
        
        var returnedAnnouncements: [Announcement] = []
        
        let date = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let today = dateFormatter.string(from: date)
        
        for event in announcements {
            if event.publishDate <= today {
                returnedAnnouncements.append(event)
            }
        }
        
        return returnedAnnouncements
    }
    
}
