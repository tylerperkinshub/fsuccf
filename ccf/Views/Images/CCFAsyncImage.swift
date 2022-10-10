//
//  CCFAsyncImage.swift
//  ccf
//
//  Created by Tyler Perkins on 8/9/22.
//

import SwiftUI



//struct CCFAsyncImage: View {
//
//    @Binding var imageString: String
//
//    var body: some View {
//
//        AsyncImage(url: URL(string: imageString),
//                   content: { phase in
//            switch phase {
//            case .empty:
//                Image("background")
//                    .resizable()
//                    .frame(height: 275)
//                    .aspectRatio(contentMode: .fill)
//
//            case .success(let image):
//                image.resizable()
//                    .frame(height: 275)
//                    .aspectRatio(contentMode: .fill)
//
//            case .failure:
//                Image("background")
//                    .resizable()
//                    .frame(height: 275)
//                    .aspectRatio(contentMode: .fill)
//
//            @unknown default:
//                Image("background")
//                    .resizable()
//                    .frame(height: 275)
//                    .aspectRatio(contentMode: .fit)
//
//            }
//
//        })
//
//    }
//}

//struct CCFAsyncImage_Previews: PreviewProvider {
//    static var previews: some View {
//        CCFAsyncImage(imageString: .constant(MockData.event.image))
//    }
//}
