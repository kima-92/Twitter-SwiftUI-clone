//
//  UploadTweetViewModel.swift
//  Twitter clone
//
//  Created by macbook on 3/15/21.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
    
    func uploadTweet(caption: String) {
        guard let user = AuthViewModel.shared.user else { return }
        let documentRef = COLLECTION_TWEETS.document()
        
        let data: [String: Any] = ["uid": user.id,
                                   "caption": caption,
                                   "fullname": user.fullname,
                                   "timestamp": Timestamp(date: Date()),
                                   "username": user.username,
                                   "profileImageUrl": user.profileImageUrl,
                                   "likes": 0,
                                   "id": documentRef.documentID
        ]
        documentRef.setData(data) { _ in
            print("DEBUG: Successfully uploaded tweet...")
        }
    }
}
