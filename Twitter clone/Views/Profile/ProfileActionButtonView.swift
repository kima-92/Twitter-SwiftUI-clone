//
//  ProfileActionButtonView.swift
//  Twitter clone
//
//  Created by macbook on 2/4/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    // MARK: - Properties
    
    let viewModel: ProfileViewModel
    @Binding var isFollowed: Bool
    
    // MARK: - Body
    
    var body: some View {
        
        // Display the Edit button if user is at their own profile
        // if not, display the Follow/Message buttons
        if viewModel.user.isCurrentUser {
            
            // Edit button
            Button(action: {}, label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }).cornerRadius(20)
            
        } else {
            // Buttons
            HStack {
                
                // Follow/Unfollow Button
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .frame(width: 180, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                }).cornerRadius(20)
                
                // Message Button
                Button(action: {}, label: {
                    Text("Message")
                        .frame(width: 180, height: 40)
                        .background(Color.purple)
                        .foregroundColor(.white)
                }).cornerRadius(20)
            }
        }
    }
}

struct ProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionButtonView(viewModel: ProfileViewModel(user: User(dictionary: [:])), isFollowed: Binding.constant(true))
    }
}
