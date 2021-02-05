//
//  ProfileHeaderView.swift
//  Twitter clone
//
//  Created by macbook on 2/4/21.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        
        VStack {
            Image("batman")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
            
            Text("Bruce Wayne")
                .font(.system(size: 16, weight: .semibold))
            
            Text("@batman")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
