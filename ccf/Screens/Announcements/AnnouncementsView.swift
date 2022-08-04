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

                LazyVGrid(columns: viewModel.columns) {
                    ForEach(viewModel.publishedAnnouncements(announcements: viewModel.announcements.sorted(by: {$0.date > $1.date})))   { announcement in
                        AnnouncementsCell(announcement: announcement)
                            .onTapGesture {
                                viewModel.selectedAnnouncement = announcement
                            }

                    }
                }

            }
            .navigationTitle("Announcement")
            .onAppear() {
                self.viewModel.fetchData()
            }
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
