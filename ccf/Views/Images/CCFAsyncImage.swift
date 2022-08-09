//
//  CCFAsyncImage.swift
//  ccf
//
//  Created by Tyler Perkins on 8/9/22.
//

import SwiftUI



struct CCFAsyncImage: View {
    
    @Binding var imageString: String
    
    var body: some View {

        AsyncImage(url: URL(string: imageString),
                   content: { phase in
            switch phase {
            case .empty:
                Image("background")
                    .resizable()
                    .frame(width: 354, height: 275)
                    .scaledToFit()
            case .success(let image):
                image.resizable()
                    .frame(width: 354, height: 275)
                    .scaledToFit()
            case .failure:
                Image("background")
                    .resizable()
                    .frame(width: 354, height: 275)
                    .scaledToFit()
            @unknown default:
                Image("background")
                    .resizable()
                    .frame(width: 354, height: 275)
                    .scaledToFit()
            }

        })

    }
}

struct CCFAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CCFAsyncImage(imageString: .constant(MockData.event.image))
    }
}
