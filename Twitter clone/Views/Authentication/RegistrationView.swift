//
//  RegistrationView.swift
//  Twitter clone
//
//  Created by macbook on 2/22/21.
//

import SwiftUI

struct RegistrationView: View {
    
    // MARK: - Properties
    
    @State var fullName = ""
    @State var username = ""
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
                    .padding(.bottom, 32)
                
                // CustomTextFields
                VStack(spacing: 20) {
                    CustomTextField(text: $fullName, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 32)
                
                // Sign up Button
                Button(action: {}, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                })
                
                // Sign in Bottom section
                Spacer()
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    Text("Sign in")
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(.white)
                .padding(.bottom, 40)
            }
        }
        .background(Color(#colorLiteral(red: 0.1137254902, green: 0.6328891516, blue: 0.952801168, alpha: 1)))  // Color Literal
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
