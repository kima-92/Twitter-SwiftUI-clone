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
                        MessageView(message: message)
                    }
                }
            }.padding()
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
