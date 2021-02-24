//
//  LoginView.swift
//  Twitter clone
//
//  Created by macbook on 2/22/21.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    
    @State var email = ""
    @State var password = ""
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            VStack {
                // Logo
                Image("twitter-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 100)
                    .padding(.top, 88)
                
                // Email and Password CustomTextFields
                VStack {
                    CustomTextField(text: $email, placeholder: Text("Email"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding()
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
        .background(Color(#colorLiteral(red: 0.1137254902, green: 0.6328891516, blue: 0.952801168, alpha: 1)))  // Color Literal
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
