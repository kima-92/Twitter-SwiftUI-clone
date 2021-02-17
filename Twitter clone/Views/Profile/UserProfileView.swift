//
//  UserProfileView.swift
//  Twitter clone
//
//  Created by macbook on 2/4/21.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .padding()
            }
            .navigationTitle("batman")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
