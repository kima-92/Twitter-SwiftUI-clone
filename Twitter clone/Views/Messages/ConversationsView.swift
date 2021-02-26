//
//  ConversationsView.swift
//  Twitter clone
//
//  Created by macbook on 1/29/21.
//

import SwiftUI

struct ConversationsView: View {
    
    // MARK: - Properties
    
    @State var isShowingNewMessageView = false
    @State var showChat = false
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationLink( destination: ChatView(),
                            isActive: $showChat,
                            label: {})
            
            // Cells
            ScrollView {
                
                // MARK: - Cells
                VStack {
                    // Displaying a certain amount of Views
                    ForEach(0..<25) { _ in
                        NavigationLink(
                            destination: ChatView(),
                            label: {
                                ConversationCell()
                            })
                    }
                }
            }
            
            // MARK: - New Message button
            Button(action: { self.isShowingNewMessageView.toggle() }, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowingNewMessageView, content: {
                NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
