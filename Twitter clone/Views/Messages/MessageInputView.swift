//
//  MessageInputView.swift
//  Twitter clone
//
//  Created by macbook on 1/29/21.
//

import SwiftUI

struct MessageInputView: View {
    
    // MARK: - Properties
    
    @Binding var mesageText: String
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            TextField("Message..", text: $mesageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: {}, label: {
                Text("Send")
            })
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(mesageText: .constant("Message.."))
    }
}
