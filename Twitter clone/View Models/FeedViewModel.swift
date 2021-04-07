//
//  FeedViewModel.swift
//  Twitter clone
//
//  Created by macbook on 3/16/21.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var tweets = [Tweet]()
    
    // MARK: - Init
    
    init() {
        fetchTweets()
    }
    
    // MARK: - Methods
    
    func fetchTweets() {
        COLLECTION_TWEETS.getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else { return }
            self.tweets = documents.map({ Tweet(dictionary: $0.data()) })
        }
    }
}
