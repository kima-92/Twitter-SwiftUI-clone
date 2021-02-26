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
    
    @State var selectedUIImage: UIImage?
    @State var image: Image?

    @State var showImagePicker = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            VStack {
                
                // Profile Photo Section
                Button(action: { showImagePicker.toggle() }, label: {
                    ZStack {
                        if let image = image {
                            // Display the selected Image
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipped()
                                .cornerRadius(70)
                                .padding(.top, 88)
                                .padding(.bottom, 32)
                        } else {
                            // Display Placeholder
                            Image("plus_photo")
                                .resizable()
                                .renderingMode(.template) // allows us to give it a foreground color
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .padding(.top, 88)
                                .padding(.bottom, 32)
                                .foregroundColor(.white)
                        }
                    }
                })
                // Displaying ImagePicker
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedUIImage)
                })
                
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
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        Text("Sign in")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                })
            }
        }
        .background(Color(#colorLiteral(red: 0.1137254902, green: 0.6328891516, blue: 0.952801168, alpha: 1)))  // Color Literal
        .ignoresSafeArea()
    }
    
    // MARK: - Methods
    
    // Convert the UIKit UIImage to a SwiftUI Image
    private func loadImage() {
        guard let selectedUIImage = selectedUIImage else { return }
        image = Image(uiImage: selectedUIImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

/*
 An Enviroment variable (in this case: "mode") uses a view's state as a variable.
 So we can call dismiss on it's navigationLink
 Need more info on this*
 */
