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
                
                AsyncImage(url: URL(string: event.image),
                           content: { phase in
                    switch phase {
                    case .empty:
                        Image("background")
                            .resizable()
                            .frame(width: 354, height: 200)
                            .scaledToFit()
                    case .success(let image):
                        image.resizable()
                            .frame(width: 354, height: 200)
                            .scaledToFit()
                    case .failure:
                        Image("background")
                            .resizable()
                            .frame(width: 354, height: 200)
                            .scaledToFit()
                    @unknown default:
                        Image("background")
                            .resizable()
                            .frame(width: 354, height: 200)
                            .scaledToFit()
                    }

                })


                Text(event.title)
                    .frame(width: 335, height: 35, alignment: .top)
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundColor(.white)
                    .offset(x: 0, y: -50)
                Rectangle()
                    .frame(width: 300, height: 4)
                    .foregroundColor(.white)
                    .offset(x: 0, y: -20)
                
            }

            ZStack{
                Rectangle()
                    .frame(width: 354, height: 50)
                    .foregroundColor(Color("ccfPrimary"))
                HStack{
                    Text("\(dateFormatMMMdyyyy(date:event.eventDate)) @ \(timeFormathmma(time:event.time))")
                    Spacer()
                    Text(event.location)
                }
                .frame(width: 335, height: 40, alignment: .center)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color("ccfSecondary"))
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
