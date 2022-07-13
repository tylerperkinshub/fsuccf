//
//  EventsCell.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import SwiftUI

struct EventsCell: View {
    
    let event: Event
    
    var body: some View {
        VStack(spacing: 0) {

            ZStack{
                Image(event.image)
                    .resizable()
                    .frame(width: 354, height: 200)
                    .scaledToFill()

                Text(event.title)
                    .frame(width: 335, height: 160, alignment: .topLeading)
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundColor(Color.white)
            }

            ZStack{
                Rectangle()
                    .frame(width: 354, height: 50)
                    .foregroundColor(Color.secondary)
                HStack{
                    Text("\(event.eventDate) @ \(event.time!)")
                    Spacer()
                    Text(event.location)
                }
                .frame(width: 335, height: 40, alignment: .center)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color.white)
            }

                
            
            
        }
        .cornerRadius(12)
    }
}

struct EventsCell_Previews: PreviewProvider {
    static var previews: some View {
        EventsCell(event: MockData.event)
    }
}
