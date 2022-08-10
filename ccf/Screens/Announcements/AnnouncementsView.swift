//
//  AnnouncementsView.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import SwiftUI
import Foundation
import FirebaseFirestore

struct AnnouncementsView: View {
    
    @StateObject var viewModel = AnnouncementsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView{

                // Laying out columns set in the viewModel.
                LazyVGrid(columns: viewModel.columns) {
                    // For each Published Announcement pulled from firebase.
                    ForEach(viewModel.publishedAnnouncements(announcements:
                        // Announcements sorted with most recent first.
                        viewModel.announcements.sorted(by: {$0.date > $1.date})))   { announcement in
                        CCFAnnouncementsCell(announcement: announcement)
                            .onTapGesture {
                                viewModel.selectedAnnouncement = announcement
                            }

                    }
                }

            }
            .navigationTitle("Announcement")
            .onAppear() {
                // Contatcting Firebase when screen appears.
                self.viewModel.fetchData()
            }
            // Passing in the tapped Announcement as a sheet. 
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                AnnouncementsDetailsView(
                    announcement: viewModel.selectedAnnouncement!,
                            isShowingDetailView: $viewModel.isShowingDetailView)
            }
            .background(Color("ccfBackground"))
        }
    }
}

struct AnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsView()
    }
}
