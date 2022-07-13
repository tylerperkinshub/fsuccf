//
//  EventsView.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import SwiftUI
import FirebaseCore


struct EventsView: View {
    


    
    var body: some View {
 
        EventsCell(event: MockData.event)
        
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
            .preferredColorScheme(.light)
    }
}
