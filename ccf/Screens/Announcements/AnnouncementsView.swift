//
//  AnnouncementsView.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import SwiftUI
import Foundation

struct AnnouncementsView: View {
    
    @StateObject var viewModel = AnnouncementsViewModel()
    
    var body: some View {
        
        
        NavigationView {
            ScrollView{

                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.announcements) { announcement in
                        AnnouncementsCell(announcement: announcement)
                            .onTapGesture {
                                viewModel.selectedAnnouncement = announcement
                            }

                    }
                }

            }
            .navigationTitle("Announcement")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                AnnouncementsDetailsView(announcement: MockData.announcement, isShowingDetailView: $viewModel.isShowingDetailView)
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
