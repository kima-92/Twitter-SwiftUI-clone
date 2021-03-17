//
//  Twitter_cloneApp.swift
//  Twitter clone
//
//  Created by macbook on 1/23/21.
//

import SwiftUI
import Firebase

@main
struct Twitter_cloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
