//
//  ScheduleView.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import SwiftUI

struct ScheduleView: View {
    
    @StateObject var viewModel = ScheduleViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    
                    ForEach(viewModel.scheduledEvents, id: \.self) { event in
                        ScheduleCell(event: event)
                    }
                    .onDelete(perform: delete)
                }
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.leading)
                .listStyle(.grouped)
                .navigationTitle(Text("Schedule"))
                .background(Color("ccfBackground"))
            }
            .onAppear() {
                
                self.viewModel.getScheduledEvents()
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        
        for i in offsets.makeIterator() {
            let event = viewModel.scheduledEvents[i]
            
            PersistenceManager.updateWith(schedule: event, actionType: .remove) { error in
                
            }
            
        }
        viewModel.getScheduledEvents()
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
