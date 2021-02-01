//
//  MessageView.swift
//  Twitter clone
//
//  Created by macbook on 1/31/21.
//

import SwiftUI

struct MessageView: View {
    
    // MARK: - Properties
    
    let message: MockMessage
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            
            // Current user messages
            if message.isCurrentUser {
                Spacer()
                Text(message.messageText)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                // Not current user messages
            } else {
                HStack(alignment: .bottom) {
                    Image(message.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(message.messageText)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                    Spacer() // <- Not in tutorial
                }.padding(.horizontal)
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: MOCK_MESSAGES[0])
    }
}
