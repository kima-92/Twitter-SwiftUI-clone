//
//  UserProfileView.swift
//  Twitter clone
//
//  Created by macbook on 2/4/21.
//

import SwiftUI

struct UserProfileView: View {
    
    // MARK: - Properties
    
    let user: User
    @State var selectedFilter: TweetFilterOptions = .tweets
    @ObservedObject var viewModel: ProfileViewModel
    
    // MARK: - Initializer
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(viewModel: viewModel)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(viewModel.tweets(forFilter: selectedFilter)) { tweet in
                    TweetCell(tweet: tweet).padding()
                }
            }
            .navigationTitle(user.username)
        }
    }
}
