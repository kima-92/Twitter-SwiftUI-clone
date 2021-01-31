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
                    ForEach(0..<15) { _ in
                        HStack {
                            Spacer()
                            Text("Test message text")
                                .padding()
                                .background(Color.blue)
                                .clipShape(ChatBubble(isFromCurrentUser: true))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            MessageInputView(mesageText: $messageText)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
