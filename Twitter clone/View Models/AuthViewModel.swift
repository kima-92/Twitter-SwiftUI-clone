//
//  AuthViewModel.swift
//  Twitter clone
//
//  Created by macbook on 3/2/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var user: User?
    @Published var userSession: FirebaseAuth.User?  // Will keep track of wether the user is logged in
    @Published var isAuthenticating = false         // Keep track of wether the user is being authenticated
    @Published var error: Error?                    // Track error if we get one, to later display for the user
    
    // MARK: - Initializer
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    // MARK: - Authorization Methods
    
    // Login
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("DEBUG: Failed to login: \(error.localizedDescription)")
                return
            }
            print("DEBUG: Successfully logged in")
        }
    }
    
    // Register user in Firebase
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        
        // MARK: - Storing the profileImage into Firebase Storage
        
        // Compressing the image and getting it's jpegData
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        // Create a file name
        let filename = NSUUID().uuidString
        // Create a referance in Storage for this filename
        let storageRef = Storage.storage().reference().child(filename)
        
        // Store the Image Data
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            print("DEBUG: Successfully uploaded user profilePhoto")
            
            // Get the URL for this image
            storageRef.downloadURL { (url, _) in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                // MARK: - Creating user in Firebase
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    
                    if let error = error {
                        print("DEBUG: Error \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    
                    let data = ["email": email,
                                "username": username,
                                "fullname": fullname,
                                "profileImage": profileImageUrl,
                                "uid": user.uid
                    ]
                    
                    // Store this user in our "user" collection in Firestore along with it's properties
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        print("DEBUG: Successfully uploaded user data")
                    }
                }
            }
        }
    }
    
    // Log out
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
}
