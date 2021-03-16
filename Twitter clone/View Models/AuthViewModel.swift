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
        fetchUser()
    }
    
    // MARK: - Authorization Methods
    
    // Login
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("DEBUG: Failed to login: \(error.localizedDescription)")
                return
            }
            self.userSession = result?.user
            self.fetchUser()
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
                print("DEBUG: Failed to upload profile image for newly registered user \(error.localizedDescription)")
                return
            }
            
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
                                "username": username.lowercased(),
                                "fullname": fullname,
                                "profileImage": profileImageUrl,
                                "uid": user.uid
                    ]
                    
                    // Store this user in our "user" collection in Firestore along with it's properties
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        self.userSession = user
                        self.fetchUser()
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
    
    // MARK: - Other Methods
    
    // Fetching the user from Firestore
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        // Fetching this user by ID in the "users" collection - Firestore
        let userCollection = Firestore.firestore().collection("users")
        let userDocument = userCollection.document(uid)
        
        // Creating the User model after fetching
        userDocument.getDocument { (snapshot, error) in
            
            if let error = error {
                print("DEBUG: Error fetching logged in user: \(error.localizedDescription)")
                return
            }
            
            guard let data = snapshot?.data() else { return }
            self.user = User(dictionary: data)
        }
    }
}
