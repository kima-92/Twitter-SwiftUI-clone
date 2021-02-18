//
//  TweetFilterOptions.swift
//  Twitter clone
//
//  Created by macbook on 2/17/21.
//

import Foundation

enum TweetFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}
