//
//  FeedView.swift
//  Twitter clone
//
//  Created by macbook on 1/23/21.
//

import SwiftUI

struct FeedView: View {
    
    // MARK: - Properties
    
    @State var isShowingNewTweetView = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    // MARK: - Body
    
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
            Button(action: {
                // TODO: - REMOVE THIS SIGNOUT METHOD FROM THIS BUTTON
                
                // Temporarily signin out from the tweet button, for testing purposes
                viewModel.signOut()
//                    isShowingNewTweetView.toggle()
                
            }, label: {
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
            .fullScreenCover(isPresented: $isShowingNewTweetView) {
                NewTweetView(isPresented: $isShowingNewTweetView)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
