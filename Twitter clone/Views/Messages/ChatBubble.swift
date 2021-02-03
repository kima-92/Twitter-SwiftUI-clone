//
//  ChatBubble.swift
//  Twitter clone
//
//  Created by macbook on 1/29/21.
//

import SwiftUI

struct ChatBubble: Shape {
    
    // MARK: - Properties
    
    var isFromCurrentUser: Bool
    
    // MARK: - Body
    // Instead of using a View for the body, we will draw the entire chat bubble using the path function from the "Shape" class
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, isFromCurrentUser ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isFromCurrentUser: false)
    }
}
