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
                    ForEach(0..<15) { _ in
                        Text("Chat bubble")
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
