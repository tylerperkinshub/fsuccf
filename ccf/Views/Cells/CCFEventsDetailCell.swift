//
//  CCFEventsDetailCell.swift
//  ccf
//
//  Created by Tyler Perkins on 8/10/22.
//

import SwiftUI

struct CCFEventsDetailCell: View {
    
    var event: Event
    
    var body: some View {

        ZStack() {
            CCFAsyncImage(imageString: .constant(event.image))
            VStack(spacing: 0){
                HStack{
                    Text(event.title)
                    if event.cost != "" {
                        Text("- \(event.cost!)")
                    }
                }
                .font(.system(size: 24, weight: .semibold))
                
                Rectangle()
                    .frame(width:300, height: 4)
                
                Text("\(dateFormatMMMdyyyy(date:event.eventDate)) @ \(timeFormathmma(time:event.time))")
                    .font(.system(size: 16, weight: .semibold))            }
            .offset(x: 0, y: -75)
        }
        .foregroundColor(.white)
    }
}

struct CCFEventsDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        CCFEventsDetailCell(event: MockData.event)
    }
}
