//
//  CCFButton.swift
//  ccf
//
//  Created by Tyler Perkins on 8/9/22.
//

import SwiftUI

struct CCFSafariButton: View {
    
    @Binding var isShowingSafariView: Bool
    
    var body: some View {
        Button {
            isShowingSafariView = true
        } label: {
            Text("More Info")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width: 280, height: 50)
                .background(Color("ccfPrimary"))
                .foregroundColor(Color("ccfSecondary"))
                .cornerRadius(10)
        }
        .padding()
        .background(Color("ccfBackground"))
    }
}

struct CCFSafariButton_Previews: PreviewProvider {
    static var previews: some View {
        CCFSafariButton(isShowingSafariView: .constant(false))
    }
}
