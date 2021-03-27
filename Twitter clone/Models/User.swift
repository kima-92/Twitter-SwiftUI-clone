//
//  User.swift
//  Twitter clone
//
//  Created by macbook on 3/7/21.
//

import Firebase

struct User: Identifiable {
    let id: String  // Actually NEEDED to confirm to the Identifiable protocol
    let username: String
    let profileImageUrl: String
    let fullname: String
    let email: String
    var stats: UserStats
    
    var isFollowed = false
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImage"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.stats = UserStats(followers: 0, following: 0)
    }
}
