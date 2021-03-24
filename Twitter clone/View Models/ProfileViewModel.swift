//
//  ProfileViewModel.swift
//  Twitter clone
//
//  Created by macbook on 3/9/21.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let user: User
    @Published var isFollowed = false
    @Published var userTweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    // MARK: - Initializer
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
        fetchUserTweets()
        fetchLikedTweets()
    }
    
    // MARK: - Following user Methods
    
    // Follow this profile's user
    func follow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        // Reference to the current user's following collection in Firebase
        let followingCollectionRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        // Reference to this profile's user's followers collection in Firebase
        let followersCollectionRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
        
        // Creating user document inside corresponding collections
        followingCollectionRef.document(user.id).setData([:]) { error in
            followersCollectionRef.document(currentUid).setData([:]) { error in
                self.isFollowed = true
            }
        }
    }
    
    // Unfollow this profile's user
    func unfollow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        // Reference to the current user's following collection in Firebase
        let followingCollectionRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        // Reference to this profile's user's followers collection in Firebase
        let followersCollectionRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        
        // Deleting user document from corresponding collections
        followingCollectionRef.document(user.id).delete() { error in
            followersCollectionRef.document(currentUid).delete { error in
                self.isFollowed = false
            }
        }
    }
    
    // Check if this profile's user is being followed by the current user
    private func checkIfUserIsFollowed() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        // Reference to the current user's following collection in Firebase
        let followingCollectionRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        
        followingCollectionRef.document(user.id).getDocument { documentSnapshot, error in
            guard let isFollowed = documentSnapshot?.exists else { return }
            self.isFollowed = isFollowed
        }
    }
    
    // MARK: - Fetching Tweets Methods
    
    // Fetch this profile user's tweets
    func fetchUserTweets() {
        
        // Fetch all tweets from the tweets collection that have this profile user's ID as the uid property
        let tweets = COLLECTION_TWEETS.whereField("uid", isEqualTo: user.id)
        
        // Create a Tweet object for each one and store them in userTweets
        tweets.getDocuments { querySnapshot, error in
            guard let documents = querySnapshot?.documents else { return }
            self.userTweets = documents.map({ Tweet(dictionary: $0.data() )})        }
    }
    
    // Fetch tweets liked by this profile's user
    func fetchLikedTweets() {
        
        var tweets = [Tweet]()
        
        // Get this profile user's "user-likes" collection
        let user = COLLECTION_USERS.document(self.user.id)
        let userLikesRef = user.collection("user-likes")
        
        // Get all the tweet ID's from that collection
        userLikesRef.getDocuments { querySnapshot, error in
            guard let documents = querySnapshot?.documents else { return }
            let tweetsIDs = documents.map({ $0.documentID })
            
            // Create a tweet object for each tweetID
            tweetsIDs.forEach { id in
                let tweetDocumentReference = COLLECTION_TWEETS.document(id)
                tweetDocumentReference.getDocument { snapshot, error in
                    
                    guard let data = snapshot?.data() else { return }
                    let tweet = Tweet(dictionary: data)
                    tweets.append(tweet)
                    
                    // Save likedTweets after ALL tweets have been fetched
                    guard tweets.count == tweetsIDs.count else { return }
                    self.likedTweets = tweets
                }
            }
        }
    }
    
    // Return array of tweets based on filter option
    func tweets(forFilter filter: TweetFilterOptions) -> [Tweet] {
        
        switch filter {
        
        case .tweets:
            return userTweets
        case .replies:
            return []  // TODO: - Replies are not yet implemented at all
        case .likes:
            return likedTweets
        }
    }
}

/*
 
 // MARK: - Follow Method Breakdown:
 
    -   Go to the "following" collection
    -   Find current user by ID
    -   Go to current user's "user-following" collection
    -   Add this profile's user to this "user-following" collection, as a document
    -   if that succeeds:
 
        -   Go to the "followers" collection
        -   Find this profile's user by ID
        -   Go to this user's "user-followers" collection
        -   Add the current user to this "user-followers" collection, as a document
        -   if that succeeds:
 
            -   self.isFollowed = true
 
 Long version:
 
 func follow() {
     guard let currentUid = Auth.auth().currentUser?.uid else { return }
     
     // Add this profile's user to the current user's following collection
     let currentUserDocument =  COLLECTION_FOLLOWING.document(currentUid)
     let followingCollection = currentUserDocument.collection("user-following")
     let profileUserDocument = followingCollection.document(user.id)
     
     profileUserDocument.setData([:]) { error in
         
         // Add the current user to this profile's user's followers collection
         let profileUserDoc = COLLECTION_FOLLOWERS.document(self.user.id)
         let followersCollection = profileUserDoc.collection("user-followers")
         let currentUserDoc = followersCollection.document(currentUid)
         
         currentUserDoc.setData([:]) { error in
             
             // Now this profile's user is being followed by the current user
             self.isFollowed = true
         }
     }
 }
 */
