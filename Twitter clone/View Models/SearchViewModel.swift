//
//  SearchViewModel.swift
//  Twitter clone
//
//  Created by macbook on 3/9/21.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    private func fetchUsers() {
        COLLECTION_USERS.getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.map({ User(dictionary: $0.data()) })
        }
    }
}
