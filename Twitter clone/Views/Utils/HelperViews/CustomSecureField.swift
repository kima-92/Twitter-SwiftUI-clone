//
//  CustomSecureField.swift
//  Twitter clone
//
//  Created by macbook on 2/24/21.
//

import SwiftUI

struct CustomSecureField: View {
    
    // MARK: - Properties
    
    @Binding var text: String
    let placeholder: Text
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            
            HStack(spacing:16) {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                // Making the textFiled secure
                SecureField("", text: $text)
            }
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(text: .constant(""), placeholder: Text("Placeholder"))
    }
}
