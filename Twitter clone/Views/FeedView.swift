//
//  FeedView.swift
//  Twitter clone
//
//  Created by macbook on 1/23/21.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                // LazyVStack - Loads cell as needed, not all at once
                VStack {
                    // Displaying a certain amount of Views
                    ForEach(0..<25) { _ in
                        TweetCell()
                    }
                }
            }
            
            // MARK: - Tweet button
            Button(action: {}, label: {
                Image("Tweet")
                    .resizable()
                    .renderingMode(.template)
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

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
