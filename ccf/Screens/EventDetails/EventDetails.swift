//
//  EventDetails.swift
//  ccf
//
//  Created by Tyler Perkins on 7/13/22.
//

import SwiftUI

struct EventDetails: View {
    
    var event: Event
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack{
            
            CCFDismissButton(isShowingDetailView: $isShowingDetailView)
            VStack(spacing: 0){
                ZStack{
                    Image(event.image)
                    

                        VStack{
                            Text(event.title)
                                .font(.system(size: 24, weight: .semibold))
                                .padding([.bottom], 6)
                                
                            Text("\(event.eventDate) @ \(event.time!)")
                                .font(.system(size: 16, weight: .semibold))
 
                        }
                        .frame(width: 350, height: 225, alignment: .topLeading)

                }

                ZStack{
                    Rectangle()
                        .frame(width: .infinity, height: 100)
                        .foregroundColor(Color.secondary)
                    VStack{
                        Text(event.description!)
                            .frame(width: 350, height: 20, alignment: .topLeading)
                            .font(.system(size: 16, weight: .light))
                            .lineLimit(nil)
                            
                        Text(event.location)
                            .frame(width: 350, height: 20, alignment: .topLeading)
                    }

                }

                

            }
            .cornerRadius(12)
            

            
            

            
            Button {
                
            } label: {
                Text("Add to Schedule")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: 280, height: 50)
                    .background(Color.secondary)
                    .foregroundColor(.primary)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
    }
}

struct EventDetails_Previews: PreviewProvider {
    static var previews: some View {
        EventDetails(event: MockData.event, isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}
