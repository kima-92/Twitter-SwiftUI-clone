//
//  CustomTextField.swift
//  Twitter clone
//
//  Created by macbook on 2/23/21.
//

import SwiftUI

struct CustomTextField: View {
    
    // MARK: - Properties
    
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            
            HStack(spacing:16) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder: Text("Email"), imageName: "envelope")
    }
}
