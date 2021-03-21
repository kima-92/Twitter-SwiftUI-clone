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
            Button(action: {}, label: {
                Image(systemName: "bubble.left")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "arrow.2.squarepath")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "heart")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            })
            Spacer()
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
