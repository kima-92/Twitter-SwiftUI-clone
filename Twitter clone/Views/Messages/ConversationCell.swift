//
//  ConversationCell.swift
//  Twitter clone
//
//  Created by macbook on 1/29/21.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                // Image
                Image("venom-10")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                // Name and Text
                VStack(alignment: .leading, spacing: 4) {
                    Text("venom")
                        .font(.system(size: 14, weight: .semibold))
                    Text("Long message text to see what happens when we do this")
                        .font(.system(size: 15, weight: .semibold))
                        .lineLimit(2)
                }
                .padding(.trailing)
            }
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
