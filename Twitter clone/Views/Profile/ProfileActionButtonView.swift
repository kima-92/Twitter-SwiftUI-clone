//
//  ProfileActionButtonView.swift
//  Twitter clone
//
//  Created by macbook on 2/4/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    // MARK: - Properties
    
    let isCurrentUser: Bool
    
    // MARK: - Body
    
    var body: some View {
        
        // Display the Edit button if user is at their own profile
        // if not, display the Follow/Message buttons
        if isCurrentUser {
            
            // Edit button
            Button(action: {}, label: {
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }).cornerRadius(20)
            
        } else {
            // Follow/Message buttons
            HStack {
                Button(action: {}, label: {
                    Text("Follow")
                        .frame(width: 180, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                }).cornerRadius(20)
                
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
        ProfileActionButtonView(isCurrentUser: false)
    }
}
