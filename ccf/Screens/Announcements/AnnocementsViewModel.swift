//
//  AnnocementsViewModel.swift
//  ccf
//
//  Created by Tyler Perkins on 7/4/22.
//

import Foundation
import SwiftUI

final class AnnouncementsViewModel: ObservableObject {
    
    var selectedAnnouncement: Announcement? {
        didSet { isShowingDetailView = true }
    }
    
    @Published var isShowingDetailView = false
    
    let columns: [GridItem] = [GridItem(.flexible())]
    
    
}
