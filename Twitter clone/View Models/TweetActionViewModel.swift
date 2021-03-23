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
        checkIfUserLikedTweet()
    }
    
    // MARK: - Methods
    
    func likeTweet() {
        // Current user's ID
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        // Get the reference to both this tweet and the current user - Firebase
        let tweetDocumentRef = COLLECTION_TWEETS.document(tweet.id)
        let userDocumentRef = COLLECTION_USERS.document(uid)
        
        // Updating only the likes property of this tweet
        tweetDocumentRef.updateData(["likes": tweet.likes + 1]) // TODO: Bug - This is causing a bug in Firebase for the likes propety
        
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
        // Current user's ID
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        // Get the reference to both this tweet and the current user - Firebase
        let tweetDocumentRef = COLLECTION_TWEETS.document(tweet.id)
        let userDocumentRef = COLLECTION_USERS.document(uid)
        
        // Updating only the likes property of this tweet
        tweetDocumentRef.updateData(["likes": tweet.likes - 1]) // TODO: Bug - This is causing a bug in Firebase for the likes propety
        
        // References to the "tweet-likes" and "user-likes" collections - Firebase
        let tweetLikesCollectionRef = tweetDocumentRef.collection("tweet-likes")
        let userLikesCollectionRef = userDocumentRef.collection("user-likes")
        
        // Delete the uid from inside this tweet's "tweet-likes" collection,
        // Delete this tweet's id from inside the current user's "user-likes" collection
        // Set didLike to false so we can update the UI
        tweetLikesCollectionRef.document(uid).delete { _ in
            userLikesCollectionRef.document(self.tweet.id).delete { _ in
                self.didLike = false
            }
        }
    }
    
    private func checkIfUserLikedTweet() {
        // Current user's ID
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        // Try to get the reference to this tweet from inside of the current user's "user-likes" collection - Firebase
        let userDocumentRef = COLLECTION_USERS.document(uid)
        let userLikesCollectionRef = userDocumentRef.collection("user-likes")
        let tweetDocumentRef = userLikesCollectionRef.document(tweet.id)
        
        tweetDocumentRef.getDocument { documentSnapshot, error in
            // If the tweet's ID exists in this collection, set didLike to true
            guard let didLike = documentSnapshot?.exists else { return }
            self.didLike = didLike
        }
    }
}

