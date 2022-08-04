//
//  AnnouncementsCell.swift
//  ccf
//
//  Created by Tyler Perkins on 7/15/22.
//

import SwiftUI

struct AnnouncementsCell: View {
    
    var announcement: Announcement
    
    var body: some View {
        VStack {
            Text(announcement.date)
                .frame(width: 314, height: 42, alignment: .topLeading)
                .foregroundColor(Color("ccfPrimary"))
                .font(.system(size: 32, weight: .semibold))
            
            
            ZStack {
                Rectangle()
                    .frame(width: 314, height: 214)
                    .foregroundColor(Color("ccfPrimary"))
                    .cornerRadius(12)
                VStack() {
                    Rectangle()
                        .frame(width: 300, height: 4)
                        .foregroundColor(Color("ccfSecondary"))
                        .offset(x: 0, y: -40)
                    Text(announcement.headline)
                        .frame(width: 300)
                        .foregroundColor(Color("ccfSecondary"))
                        .font(.system(size: 24, weight: .semibold))
                        .multilineTextAlignment(.leading)
                    
                }
                
                
            }
            
        }
    }
}


struct AnnouncementsCell_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsCell(announcement: MockData.announcement)
    }
}
