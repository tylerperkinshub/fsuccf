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
                    ForEach(viewModel.scheduledEvents) { event in
                        CCFScheduleCell(event: event)
                    }
                    .onDelete { (indexSet) in
                        self.viewModel.delete(at: indexSet)
                    }
                }
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.leading)
                .listStyle(.grouped)
                .navigationTitle(Text("Reminders"))
                .background(Color("ccfBackground"))
            }
            .onAppear() {
                self.viewModel.getScheduledEvents()
            }
        }
    }
    
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
