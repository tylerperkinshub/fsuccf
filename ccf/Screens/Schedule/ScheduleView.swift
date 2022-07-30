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
                List(viewModel.scheduledEvents) { event in
                    ScheduleCell(event: event)
                }
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.leading)
                .listStyle(.grouped)
                .navigationTitle(Text("Schedule"))
                .background(Color("ccfBackground"))
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
