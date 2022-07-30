//
//  AnnouncementsDetailsView.swift
//  ccf
//
//  Created by Tyler Perkins on 7/15/22.
//

import SwiftUI

struct AnnouncementsDetailsView: View {
    
    var announcement: Announcement
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack{
            CCFDismissButton(isShowingDetailView: $isShowingDetailView)
            Text(dateFormatMMMd(date: announcement.date))
                .frame(width: 314, height: 42, alignment: .topLeading)
                .foregroundColor(Color("ccfPrimary"))
                .font(.system(size: 32, weight: .semibold))
            
            ZStack {
                Rectangle()
                    .frame(width: 314, height: 300)
                    .foregroundColor(Color("ccfPrimary"))
                    .cornerRadius(12)
                VStack() {
                    Text(announcement.title)
                        .frame(width: 300)
                        .foregroundColor(Color("ccfSecondary"))
                        .font(.system(size: 24, weight: .semibold))
                        .multilineTextAlignment(.leading)
                        //.offset(x: 0, y: -40)
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
            
            Button {
                
            } label: {
                Text("More Info")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: 280, height: 50)
                    .background(Color("ccfPrimary"))
                    .foregroundColor(Color("ccfSecondary"))
                    .cornerRadius(10)
            }
            .padding()
            .background(Color("ccfBackground"))
            Spacer()
        }
        
    }
}

struct AnnouncementsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementsDetailsView(announcement: MockData.announcement, isShowingDetailView: .constant(false))
    }
}
