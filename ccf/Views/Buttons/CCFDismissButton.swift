//
//  CCFDismissButton.swift
//  ccf
//
//  Created by Tyler Perkins on 7/13/22.
//

import SwiftUI

struct CCFDismissButton: View {
    
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                isShowingDetailView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
        .padding()
    }
}

struct CCFDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        CCFDismissButton(isShowingDetailView: .constant(false))
    }
}
