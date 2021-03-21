//
//  TweetActionsView.swift
//  Twitter clone
//
//  Created by macbook on 3/19/21.
//

import SwiftUI

struct TweetActionsView: View {
    
    // MARK: - Properties
    
    let tweet: Tweet
    @ObservedObject var viewModel: TweetActionViewModel
    
    // MARK: - Init
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.viewModel = TweetActionViewModel(tweet: tweet)
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            
            // Add Comment Button
            Button(action: {}, label: {
                Image(systemName: "bubble.left")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            Spacer()
            
            // Retweet Button
            Button(action: {}, label: {
                Image(systemName: "arrow.2.squarepath")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            Spacer()
            
            // Like Button
            Button(action: {
                viewModel.didLike ? viewModel.unlikeTweet() : viewModel.likeTweet()
            }, label: {
                Image(systemName: viewModel.didLike ? "heart.fill" : "heart")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
                    .foregroundColor(viewModel.didLike ? .red : .gray)
            })
            Spacer()
            
            // Bookmark Button
            Button(action: {}, label: {
                Image(systemName: "bookmark")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
        }
        .foregroundColor(.gray)
        .padding(.horizontal)
    }
}
