//
//  RemoteImage.swift
//  ccf
//
//  Created by Tyler Perkins on 8/30/22.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    // Network call or pulling from cache and setting image on main thread.
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            
            DispatchQueue.main.async {
                guard let uiImage = uiImage else { return }
            
                self.image = Image(uiImage: uiImage)

            }
        }
    }
    
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("default").resizable()
    }
}


struct CCFRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        
        // Getting image on appear. 
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString) }
    }
}



