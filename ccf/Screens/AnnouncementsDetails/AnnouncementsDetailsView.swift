//
//  AnnouncementsDetailsView.swift
//  ccf
//
//  Created by Tyler Perkins on 7/15/22.
//

import SwiftUI
import Foundation
import FirebaseFirestore

struct AnnouncementsDetailsView: View {
    
    var announcement: Announcement
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        
        VStack{
            // Tracking if detail page should be showing.
            CCFDismissButton(isShowingDetailView: $isShowingDetailView)
            
            // Getting the detail sell
            AnnouncementDetailsCell(announcement: announcement, isShowingDetailView: $isShowingDetailView)
            
            // If there is a URL in the announcement it will display this button.
            if announcement.urlString != "" {
                
                CCFSafariButton(isShowingSafariView: $isShowingSafariView)
        
            }
            Spacer()
        }
        // Presenting a sheet of the linked URL
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: announcement.urlString!) ?? URL(string: "https://www.ccffsu.com")!)
        })
    }
}

struct AnnouncementsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsDetailsView(announcement: MockData.announcement, isShowingDetailView: .constant(false))
    }
}
