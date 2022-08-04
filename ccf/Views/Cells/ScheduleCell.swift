//
//  ScheduleCell.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import SwiftUI

struct ScheduleCell: View {
    
    let event: Scheduled
    
    var body: some View {
        VStack {
            HStack{
                Text(event.title)
                    .font(.system(size: 24, weight: .semibold))
                Spacer()
            }
            
            HStack {
                Text("\(dateFormatMMMdyyyy(date:event.date)) @ \(timeFormathmma(time:event.time))")
                Spacer()
                Text(event.location)
            }      
            
        }
        .frame(height: 50, alignment: .topLeading)
        .padding([.leading, .trailing], 12)
    }
}

struct ScheduleCell_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleCell(event: Scheduled(id: "", title: "Test", time: "07:00", date: "08/01/2022", location: "Coffee Shop", reminder: 0))
    }
}
