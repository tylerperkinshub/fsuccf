//
//  CCFTabView.swift
//  ccf
//
//  Created by Tyler Perkins on 7/14/22.
//

import SwiftUI

struct CCFTabView: View {
    
    
    
    var body: some View {
        TabView {
            EventsView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Events")
                }
            
            AnnouncementsView()
                .tabItem {
                    Image(systemName: "megaphone.fill")
                    Text("Announcements")
                }
            
            ScheduleView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Schedule")
                }
            
        }
    }
}

struct CCFTabView_Previews: PreviewProvider {
    static var previews: some View {
        CCFTabView()
    }
}
