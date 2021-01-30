//
//  ConversationsView.swift
//  Twitter clone
//
//  Created by macbook on 1/29/21.
//

import SwiftUI

struct ConversationsView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                
                // MARK: - Cells
                VStack {
                    // Displaying a certain amount of Views
                    ForEach(0..<25) { _ in
                        ConversationCell()
                    }
                }
            }
            
            // MARK: - New Message button
            Button(action: {}, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
