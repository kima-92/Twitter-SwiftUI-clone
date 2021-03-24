//
//  UserProfileView.swift
//  Twitter clone
//
//  Created by macbook on 2/4/21.
//

import SwiftUI

struct UserProfileView: View {
    
    // MARK: - Properties
    
    @State var selectedFilter: TweetFilterOptions = .tweets
    let user: User
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
                ProfileHeaderView(viewModel: viewModel, isFollowed: $viewModel.isFollowed)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(viewModel.likedTweets) { tweet in
                    TweetCell(tweet: tweet).padding()
                }
            }
            .navigationTitle("batman")
        }
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
