//
//  TweetCell.swift
//  Twitter clone
//
//  Created by macbook on 1/23/21.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
    
    // MARK: - Properties
    
    let tweet: Tweet
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                
                // Profile picture
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56 / 2)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    // Name and time stamp
                    HStack {
                        Text(tweet.fullname)
                            .font(.system(size: 14, weight: .semibold))
                        Text("@\(tweet.username) •")
                            .foregroundColor(.gray)
                        Text("2w")
                            .foregroundColor(.gray)
                    }
                    // Tweet
                    Text(tweet.caption)
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            
            // Bottom buttons
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
            
            // Bottom line
            Divider()
        }
        .padding(.leading, -16)
    }
}

//struct TweetCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetCell()
//    }
//}
