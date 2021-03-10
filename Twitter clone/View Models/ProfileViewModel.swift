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
    
    // MARK: - Initializer
    
    init(user: User) {
        self.user = user
    }
    
    // MARK: - Methods
    
    func follow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(user.id).setData([:]) { error in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currentUid).setData([:]) { error in
                self.isFollowed = true
            }
        }
    }
    
    func unfollow() {
        
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
