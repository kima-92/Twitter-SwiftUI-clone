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
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(user: user)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach(0..<9) { tweet in
                    TweetCell()
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
