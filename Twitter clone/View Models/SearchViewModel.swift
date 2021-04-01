//
//  SearchViewModel.swift
//  Twitter clone
//
//  Created by macbook on 3/9/21.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var users = [User]()
    
    // MARK: - Init
    
    init() {
        fetchUsers()
    }
    
    // MARK: - Methods
    
    private func fetchUsers() {
        COLLECTION_USERS.getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.map({ User(dictionary: $0.data()) })
        }
    }
    
    // Returns filtered user array based on query
    func filter(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.contains(lowercasedQuery )})
    }
}
