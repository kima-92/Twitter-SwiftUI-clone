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
    @ObservedObject var viewModel = FeedViewModel()
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                // LazyVStack - Loads cell as needed, not all at once
                LazyVStack {
                    // Displaying each tweetCell
                    ForEach(viewModel.tweets) { tweet in
                        NavigationLink(destination: TweetDetailView(tweet: tweet)) {
                            TweetCell(tweet: tweet)
                        }
                    }
                }
            }
            
            // MARK: - Tweet button
            Button(action: { isShowingNewTweetView.toggle() },
                   label: {
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
