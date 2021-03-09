//
//  UserCell.swift
//  Twitter clone
//
//  Created by macbook on 1/25/21.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    // MARK: - Properties
    
    let user: User
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 12) {
            // Profile Image
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 4) {
                // Username
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                // Fullname
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            .foregroundColor(.black)
        }
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
