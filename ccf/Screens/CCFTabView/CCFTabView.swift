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
            
            // Init screens and adding on tab bar items. 
            AnnouncementsView()
                .tabItem {
                    Image(systemName: "megaphone.fill")
                    Text("Announcements")
                }
            
            EventsView()
                .tabItem{
                    Image(systemName: "calendar")
                    Text("Events")
                }
            
            ScheduleView()
                .tabItem {
                    Image(systemName: "alarm.fill")
                    Text("Reminders")
                }
        }
    }
}

struct CCFTabView_Previews: PreviewProvider {
    static var previews: some View {
        CCFTabView()
    }
}
