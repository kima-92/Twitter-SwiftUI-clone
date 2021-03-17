//
//  Constants.swift
//  Twitter clone
//
//  Created by macbook on 3/9/21.
//

import Firebase

// Collections inside Firestore
let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
let COLLECTION_TWEETS = Firestore.firestore().collection("tweets")
