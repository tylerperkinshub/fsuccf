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
                
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(viewModel.events) { event in
                        EventsCell(event: event)
                            .onTapGesture {
                                viewModel.selectedEvent = event
                            }
                        
                    }
                }

            }
            .navigationTitle("Upcoming Events")
            .onAppear() {
                self.viewModel.fetchData()
            }
            .sheet(isPresented: $viewModel.isShowingDetailView) {
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
