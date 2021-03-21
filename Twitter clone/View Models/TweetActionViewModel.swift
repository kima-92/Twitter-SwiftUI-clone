//
//  TweetActionViewModel.swift
//  Twitter clone
//
//  Created by macbook on 3/20/21.
//

import SwiftUI
import Firebase

class TweetActionViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let tweet: Tweet
    @Published var didLike = false
    
    // MARK: - Init
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
    // MARK: - Methods
    
    func likeTweet() {
        // Current user's ID
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        // Get the reference to both this tweet and the current user - Firebase
        let tweetDocumentRef = COLLECTION_TWEETS.document(tweet.id)
        let userDocumentRef = COLLECTION_USERS.document(uid)
        
        // Update the likes property of this tweet
        tweetDocumentRef.updateData(["likes": tweet.likes + 1])
        
        // References to the "tweet-likes" and "user-likes" collections - Firebase
        let tweetLikesCollectionRef = tweetDocumentRef.collection("tweet-likes")
        let userLikesCollectionRef = userDocumentRef.collection("user-likes")
        
        // Save the uid inside this tweet's "tweet-likes" collection,
        // Save this tweet's id inside the current user's "user-likes" collection
        // Set didLike to true so we can update the UI
        tweetLikesCollectionRef.document(uid).setData([:]) { _ in
            userLikesCollectionRef.document(self.tweet.id).setData([:]) { _ in
                self.didLike = true
            }
        }
    }
    
    func unlikeTweet() {
        
    }
}

