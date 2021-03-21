//
//  TweetDetailView.swift
//  Twitter clone
//
//  Created by macbook on 3/18/21.
//

import SwiftUI
import Kingfisher

struct TweetDetailView: View {
    
    // MARK: - Properties
    
    let tweet: Tweet
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            // Profile Image, name and username
            HStack {
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing:4) {
                    Text(tweet.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("@\(tweet.username)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            
            // Tweet and Date
            Text(tweet.caption)
                .font(.system(size: 22))
            
            Text("7:22 PM • 05/01/2020")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Divider()
            
            // Retweets and Likes
            HStack(spacing: 12) {
                HStack {
                    Text("0")
                        .font(.system(size: 14))
                    
                    Text("Retweets")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("\(tweet.likes)")
                        .font(.system(size: 14))
                    
                    Text("Likes")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            Divider()
            
            // Bottom buttons
            TweetActionsView()
            Spacer()
        }.padding()
    }
}

//struct TweetDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetDetailView()
//    }
//}
