//
//  ChatView.swift
//  Twitter clone
//
//  Created by macbook on 1/29/21.
//

import SwiftUI

struct ChatView: View {
    
    // MARK: - Properties
    
    @State var messageText: String = ""
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    
                    // Chat Bubbles
                    ForEach(MOCK_MESSAGES) { message in
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
            }
            MessageInputView(mesageText: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
