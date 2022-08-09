//
//  AnnouncementDetailsCell.swift
//  ccf
//
//  Created by Tyler Perkins on 7/15/22.
//

import SwiftUI

struct AnnouncementDetailsCell: View {
    
    var announcement: Announcement
    @Binding var isShowingDetailView: Bool

    var body: some View {
        VStack{
            Text(dateFormatMMMd(date: announcement.date))
                .frame(width: 314, height: 42, alignment: .topLeading)
                .foregroundColor(Color("ccfPrimary"))
                .font(.system(size: 32, weight: .semibold))
            
            ZStack {
                // Background
                Rectangle()
                    .frame(width: 314, height: 300)
                    .foregroundColor(Color("ccfPrimary"))
                    .cornerRadius(12)
                
                // Creating Announcement Cell
                VStack() {
                    Text(announcement.headline)
                        .frame(width: 300)
                        .foregroundColor(Color("ccfSecondary"))
                        .font(.system(size: 24, weight: .semibold))
                        .multilineTextAlignment(.leading)
                    
                    Rectangle()
                        .frame(width: 300, height: 4)
                        .foregroundColor(Color("ccfSecondary"))
                        .offset(x: 0, y: 10)

                    Text(announcement.description)
                        .frame(width: 280, height: 180, alignment: .center)
                        .font(.system(size: 14))
                        .foregroundColor(Color("ccfSecondary"))
                }
            }
            
            // Only returns a button if there is more info.

        }

    }
}

struct AnnouncementDetailsCell_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementDetailsCell(announcement: MockData.announcement, isShowingDetailView: .constant(false))
    }
}
