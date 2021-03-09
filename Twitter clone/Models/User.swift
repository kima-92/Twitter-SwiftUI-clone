//
//  User.swift
//  Twitter clone
//
//  Created by macbook on 3/7/21.
//

import Foundation

struct User: Identifiable {
    let id: String  // Actually NEEDED to confirm to the Identifiable protocol
    let username: String
    let profileImageUrl: String
    let fullName: String
    let email: String
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
}
