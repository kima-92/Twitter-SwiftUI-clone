//
//  FeedViewModel.swift
//  Twitter clone
//
//  Created by macbook on 3/16/21.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        COLLECTION_TWEETS.getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else { return }
            self.tweets = documents.map({ Tweet(dictionary: $0.data()) })
            print("DEBUG: Tweets \(self.tweets)")
        }
    }
}
