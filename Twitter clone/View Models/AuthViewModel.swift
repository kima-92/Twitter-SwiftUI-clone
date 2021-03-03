//
//  AuthViewModel.swift
//  Twitter clone
//
//  Created by macbook on 3/2/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    func login() {
    }
    
    // Register user in Firebase
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            print("DEBUG: Successfully signed up user")
        }
    }
}
