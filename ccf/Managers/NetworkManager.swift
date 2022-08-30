//
//  NetworkManager.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    
    private let cache = NSCache<NSString, UIImage>()
    
    
    private init() {}
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
                let cacheKey = NSString(string: urlString)
        
        // Grabbing from cache if possible.
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        // Ensuring we have a good URL.
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            // Making sure data and image are visible
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            // Adding image to cache
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        
        // Never forget. 
        task.resume()
    }
    
    
}
