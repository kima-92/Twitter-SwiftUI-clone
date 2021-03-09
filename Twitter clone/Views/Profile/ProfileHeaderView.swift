//
//  ProfileHeaderView.swift
//  Twitter clone
//
//  Created by macbook on 2/4/21.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    // MARK: - Properties
    
    let user: User
    // TODO: - Check if you trully need this state variable here
    //    @State var selectedFilter: TweetFilterOptions = .tweets
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            // Profile Picture
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
            
            // User Details
            Text(user.fullname)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Billionaire by day, dark knight by night")
                .font(.system(size: 14))
                .padding(.top, 8)
            
            // Followers and Following Stack
            HStack(spacing: 40) {
                VStack {
                    Text("12")
                        .font(.system(size: 16)).bold()
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                VStack {
                    Text("12")
                        .font(.system(size: 16)).bold()
                    Text("Following")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }.padding()
            
            // Edit/Follow/Message buttons - Based on user type
            ProfileActionButtonView(isCurrentUser: user.isCurrentUser)
            
            // TODO: - Check if you trully need the FilterButtonView here
            //            FilterButtonView(selectedOption: $selectedFilter).padding()
            
            Spacer()
        }
    }
}

//struct ProfileHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeaderView()
//    }
//}
